<?php

namespace Install;

use Composer\Script\Event;

class Db
{
    public static function Create(Event $event)
    {
        $io = $event->getIO();

        $extras = $event->getComposer()->getPackage()->getExtra();
        $dataBases = $extras['solire']['db'];

        foreach ($dataBases as $dataBase) {
            $config = parse_ini_file($dataBase['config'], true);
            $section = $dataBase['section'];
            $server = new DbServer($config[$section], $io);
            $server->create();
            $server->import($dataBase['import']);
        }
    }
}
