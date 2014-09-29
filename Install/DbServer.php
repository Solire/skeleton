<?php

namespace Install;

use Doctrine\DBAL\DriverManager;
use Composer\IO\IOInterface;

class DbServer
{
    /**
     * Connection to the database
     *
     * @var \Doctrine\DBAL\Connection
     */
    private $connection;

    /**
     * Connection parameters
     *
     * @var array
     */
    private $config;

    /**
     * Input / Output interface
     *
     * @var Composer\IO\IOInterface
     */
    private $io;

    /**
     * Constructor
     *
     * @param array $config
     */
    public function __construct($config, IOInterface $io)
    {
        $this->config = $config;

        unset($config['dbname']);
        $config['driverOptions'] = array(
            \PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
        );
        $this->connection = DriverManager::getConnection($config);

        $this->io = $io;
    }

    public function create()
    {
        $dbName = $this->config['dbname'];
        try {
            $this->connection->getSchemaManager()->createDatabase($dbName);
        } catch (\Exception $e) {
            $q = sprintf(
                '<error>The database "%s" already exists, drop current databases ? (true)</error>',
                $dbName
            );
            $ans = $this->io->askConfirmation($q);

            if ($ans) {
                $this->connection->getSchemaManager()->dropAndCreateDatabase($dbName);
                $m = sprintf(
                    '<info>The database "%s" has been recreated</info>',
                    $this->config['dbname']
                );
                $this->io->write($m);
            }
        }
    }

    public function import($sqlDumpPath)
    {
        $cmd = 'mysql -h"' . $this->config['host'] . '" '
             . '-u"' . $this->config['user'] . '" '
             . '-p"' . $this->config['password'] . '" '
             . '' . $this->config['dbname'] . ' '
             . '< "' . $sqlDumpPath . '"';
        exec($cmd);

        $m = sprintf(
            '<info>The database "%s" has been filled</info>',
            $this->config['dbname']
        );
        $this->io->write($m);
    }
}
