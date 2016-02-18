<?php

namespace Solire\Lib;

/*
 * Affichage des erreurs
 */
error_reporting(E_ALL & ~E_STRICT);
ini_set('display_errors', 'Off');

include './vendor/autoload.php';

require './vendor/solire/lib/init.php';

/*
 * Marvin displays (if true) or sends an email (if false)
 */
$debug = false;

//FrontController::setApp([
//    'name' => 'Xxxxx\Projet',
//    'dir' => 'Projet',
//    'namespace' => 'Xxxxx\Projet',
//    'public' => 'public/projet',
//]);

include './vendor/solire/lib/start.php';
