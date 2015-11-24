-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 26 Septembre 2014 à 12:41
-- Version du serveur: 5.5.35-1
-- Version de PHP: 5.5.9-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `squelette`
--

-- --------------------------------------------------------

--
-- Structure de la table `back_log`
--

CREATE TABLE IF NOT EXISTS `back_log` (
  `logId` int(100) NOT NULL AUTO_INCREMENT,
  `logDate` date NOT NULL,
  `logTime` time NOT NULL,
  `logIp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `logString` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `logStrOpt` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `logIdUser` int(100) NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `board_state`
--

CREATE TABLE IF NOT EXISTS `board_state` (
  `id_utilisateur` int(11) NOT NULL,
  `cookie` text COLLATE utf8_unicode_ci NOT NULL,
  `id_api` tinyint(4) NOT NULL,
  UNIQUE KEY `id_utilisateur` (`id_utilisateur`,`id_api`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gab_api`
--

CREATE TABLE IF NOT EXISTS `gab_api` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `gab_api`
--

INSERT INTO `gab_api` (`id`, `name`, `label`) VALUES
(1, 'main', 'Desktop');

-- --------------------------------------------------------

--
-- Structure de la table `gab_bloc`
--

CREATE TABLE IF NOT EXISTS `gab_bloc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_gabarit` int(11) NOT NULL,
  `type` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(31) COLLATE utf8_unicode_ci NOT NULL COMMENT 'nom du bloc/fichier html',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trad` tinyint(1) NOT NULL DEFAULT '1',
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `gab_bloc`
--

INSERT INTO `gab_bloc` (`id`, `id_gabarit`, `type`, `name`, `label`, `trad`, `ordre`) VALUES
(1, 2, '', 'author_google', 'Paramètre pour le référencement- Authors Google + ', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `gab_champ`
--

CREATE TABLE IF NOT EXISTS `gab_champ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL COMMENT 'id du gabarit/block',
  `type_parent` enum('bloc','gabarit') COLLATE utf8_unicode_ci NOT NULL,
  `id_group` int(4) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(31) COLLATE utf8_unicode_ci NOT NULL COMMENT '{name}',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'text, wysiwyg, ...',
  `typedonnee` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `oblig` enum('oblig','fac') COLLATE utf8_unicode_ci NOT NULL,
  `trad` tinyint(1) NOT NULL DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `ordre` int(11) NOT NULL,
  `typesql` enum('varchar(255) NOT NULL','text NOT NULL','date NOT NULL','INT( 11 ) NOT NULL','TINYINT( 1 ) NOT NULL','FLOAT(10,7) NOT NULL','GMAP POINT') COLLATE utf8_unicode_ci NOT NULL,
  `aide` text COLLATE utf8_unicode_ci NOT NULL,
  `filter_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Pattern séparer par des virgules, seulement utilisé pour les type filesExemple :  %.mp4,%.m4v; Recherche sans passer par mysql : pattern (file:video/%.mp4)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Contenu de la table `gab_champ`
--

INSERT INTO `gab_champ` (`id`, `id_parent`, `type_parent`, `id_group`, `label`, `name`, `type`, `typedonnee`, `oblig`, `trad`, `visible`, `ordre`, `typesql`, `aide`, `filter_file`) VALUES
(1, 2, 'gabarit', 1, 'Code Google Webmaster Tools', 'code_google_webmaster_tools', 'TEXT', 'MIX', 'fac', 1, 1, 0, 'varchar(255) NOT NULL', '', ''),
(2, 2, 'gabarit', 1, 'Code Bing Webmaster Tools', 'code_bing_webmaster_tools', 'TEXT', 'MIX', 'fac', 1, 1, 1, 'varchar(255) NOT NULL', '', ''),
(3, 2, 'gabarit', 1, 'Publisher (page google +) https://plus.google.com/', 'publisher', 'TEXT', 'MIX', 'fac', 1, 1, 5, 'varchar(255) NOT NULL', '', ''),
(4, 2, 'gabarit', 1, 'Code de suivi statistiques', 'code_google_analytics', 'TEXTAREA', 'MIX', 'fac', 1, 1, 3, 'text NOT NULL', '', ''),
(5, 2, 'gabarit', 1, 'Nom du publisher', 'publisher_nom', 'TEXT', 'MIX', 'fac', 1, 1, 6, 'varchar(255) NOT NULL', '', ''),
(6, 1, 'bloc', 0, 'Compte Google + https://plus.google.com/ ', 'compte_google', 'TEXT', 'MIX', 'fac', 1, 1, 0, 'varchar(255) NOT NULL', '', ''),
(7, 1, 'bloc', 0, 'Nom de l''auteur', 'nom_de_lauteur', 'TEXT', 'MIX', 'fac', 1, 1, 0, 'varchar(255) NOT NULL', '', ''),
(8, 2, 'gabarit', 2, 'Raison sociale', 'raison_sociale', 'TEXT', 'MIX', 'oblig', 1, 1, 0, 'varchar(255) NOT NULL', '', ''),
(9, 2, 'gabarit', 2, 'Adresse', 'adresse', 'TEXT', 'MIX', 'oblig', 1, 1, 1, 'varchar(255) NOT NULL', '', ''),
(10, 2, 'gabarit', 2, 'Code postal', 'code_postal', 'TEXT', 'MIX', 'oblig', 1, 1, 2, 'varchar(255) NOT NULL', '', ''),
(11, 2, 'gabarit', 2, 'Ville', 'ville', 'TEXT', 'MIX', 'oblig', 1, 1, 3, 'varchar(255) NOT NULL', '', ''),
(12, 2, 'gabarit', 2, 'Pays', 'pays', 'TEXT', 'MIX', 'fac', 1, 1, 4, 'varchar(255) NOT NULL', '', ''),
(13, 2, 'gabarit', 2, 'Téléphone', 'telephone', 'TEXT', 'MIX', 'fac', 1, 1, 5, 'varchar(255) NOT NULL', '', ''),
(14, 2, 'gabarit', 2, 'Email', 'email', 'TEXT', 'MIX', 'oblig', 1, 1, 6, 'varchar(255) NOT NULL', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `gab_champ_group`
--

CREATE TABLE IF NOT EXISTS `gab_champ_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(31) COLLATE utf8_unicode_ci NOT NULL,
  `id_gabarit` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `gab_champ_group`
--

INSERT INTO `gab_champ_group` (`id`, `label`, `name`, `id_gabarit`, `ordre`) VALUES
(1, 'Paramètres pour le référencement', '', 2, 0),
(2, 'Coordonnées', '', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gab_champ_param`
--

CREATE TABLE IF NOT EXISTS `gab_champ_param` (
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_champ_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`code`,`code_champ_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `gab_champ_param`
--

INSERT INTO `gab_champ_param` (`code`, `name`, `default_value`, `code_champ_type`) VALUES
('WIDTH', 'Taille du champs', '420', 'TEXT'),
('VALUE.DEFAULT', 'Valeur par défaut', '', 'TEXT'),
('MAXLENGTH', 'Nombre de caractères max', '255', 'TEXT'),
('READONLY', 'Lecture seule', 'false', 'TEXT'),
('MAXLENGTH', 'Nombre de caractères max', '', 'TEXTAREA'),
('DEFAULT.VALUE', 'Valeur par  défaut', '', 'TEXTAREA'),
('TABLE.NAME', 'Nom de la table', '', 'JOIN'),
('TABLE.FIELD.LABEL', 'Nom du champ label', '', 'JOIN'),
('QUERY.FILTER', 'Filtre de la requête', '', 'JOIN'),
('VIEW', 'Mode d''affichage', 'autocomplete', 'JOIN'),
('TABLE.FIELD.ID', 'Nom du champ id', 'id_gab_page', 'JOIN'),
('TABLE.NAME', 'Nom de la table', '', 'AUTOCOMPLETE_MULTI'),
('TABLE.FIELD.LABEL', 'Nom du champ label', '', 'AUTOCOMPLETE_MULTI'),
('TABLE.FIELD.ID', 'Nom du champ id', '', 'AUTOCOMPLETE_MULTI'),
('THEME', 'Thème (facebook ou vide)', 'facebook', 'AUTOCOMPLETE_MULTI'),
('VALUES', 'Valeurs (séparé par |+|)', '', 'SELECT'),
('VIEW', 'Mode d''affichage', 'default', 'TEXT'),
('LINK', 'Type lien', '0', 'TEXT'),
('EXTENSIONS.ALLOW', 'Filtre par extension (.gif;.png)', '', 'FILE'),
('CROP.WIDTH.MIN', 'Largeur minimale de redimensionnement', '', 'FILE'),
('CROP.HEIGHT.MIN', 'Hauteur minimale de redimensionnement', '', 'FILE'),
('MINIATURE', 'Miniature (200x100;*x50;50x*)', '', 'FILE'),
('TABLE.NAME', 'Nom de la table', '', 'AUTOCOMPLETE'),
('TABLE.FIELD.LABEL', 'Nom du champ label', '', 'AUTOCOMPLETE'),
('QUERY.FILTER', 'Filtre de la requête', '', 'AUTOCOMPLETE'),
('VIEW', 'Mode d''affichage', 'autocomplete', 'AUTOCOMPLETE'),
('TABLE.FIELD.ID', 'Nom du champ id', 'id_gab_page', 'AUTOCOMPLETE'),
('TYPE.GAB.PAGE', 'Jointure avec gab_page', '1', 'AUTOCOMPLETE'),
('VALUE.DEFAULT', 'Valeur par défaut', '', 'AUTOCOMPLETE'),
('VISUEL.ID', 'Visuel', '', 'ALT'),
('TYPE.GAB.PAGE', 'Jointure avec gab_page', '1', 'JOIN'),
('VALUE.DEFAULT', 'Valeur par défaut', '', 'JOIN'),
('DATALIST', 'Suggestions (séparé par |+|)', '', 'TEXT');

-- --------------------------------------------------------

--
-- Structure de la table `gab_champ_param_value`
--

CREATE TABLE IF NOT EXISTS `gab_champ_param_value` (
  `id_champ` int(11) NOT NULL,
  `code_champ_param` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_champ`,`code_champ_param`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gab_champ_type`
--

CREATE TABLE IF NOT EXISTS `gab_champ_type` (
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ordre` smallint(6) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `gab_champ_type`
--

INSERT INTO `gab_champ_type` (`code`, `ordre`) VALUES
('TEXT', 1),
('WYSIWYG', 2),
('TEXTAREA', 3),
('FILE', 4),
('SELECT', 5),
('CHECKBOX', 6),
('AUTOCOMPLETE', 7),
('AUTOCOMPLETE_MULTI', 8),
('AUTOCOMPLETE_UNIQUE', 9),
('YEAR', 10),
('JOIN', 11),
('ALT', 12),
('GMAP', 12);

-- --------------------------------------------------------

--
-- Structure de la table `gab_champ_typedonnee`
--

CREATE TABLE IF NOT EXISTS `gab_champ_typedonnee` (
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ordre` smallint(6) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `gab_champ_typedonnee`
--

INSERT INTO `gab_champ_typedonnee` (`code`, `ordre`) VALUES
('NOTNUL', 1),
('MIX', 2),
('DATE', 3),
('DATETIME', 4),
('FILE', 5),
('MAIL', 6),
('GMAP_POINT', 7);

-- --------------------------------------------------------

--
-- Structure de la table `gab_gabarit`
--

CREATE TABLE IF NOT EXISTS `gab_gabarit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `id_api` tinyint(1) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'nom du bloc/fichier html',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordre` int(11) NOT NULL,
  `main` tinyint(1) NOT NULL,
  `creable` tinyint(1) NOT NULL DEFAULT '1',
  `creable_min` tinyint(1) NOT NULL,
  `creable_max` tinyint(1) NOT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `sortable` tinyint(1) NOT NULL DEFAULT '1',
  `make_hidden` tinyint(1) NOT NULL DEFAULT '1',
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `editable_middle_office` tinyint(4) NOT NULL,
  `meta` tinyint(1) NOT NULL DEFAULT '1',
  `301_editable` tinyint(1) NOT NULL DEFAULT '1',
  `meta_titre` tinyint(1) NOT NULL DEFAULT '1',
  `extension` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `gab_gabarit`
--

INSERT INTO `gab_gabarit` (`id`, `id_parent`, `id_api`, `name`, `label`, `ordre`, `main`, `creable`, `creable_min`, `creable_max`, `deletable`, `sortable`, `make_hidden`, `editable`, `editable_middle_office`, `meta`, `301_editable`, `meta_titre`, `extension`, `view`) VALUES
(1, 0, 1, 'accueil', 'Accueil', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, '', 1),
(2, 0, 1, 'element_commun', 'Éléments communs', 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `gab_page`
--

CREATE TABLE IF NOT EXISTS `gab_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_version` tinyint(1) NOT NULL,
  `id_api` tinyint(4) NOT NULL,
  `id_gabarit` tinyint(1) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `visible_parent` tinyint(1) NOT NULL,
  `suppr` tinyint(1) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bal_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bal_descr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bal_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `importance` tinyint(1) NOT NULL DEFAULT '1',
  `no_index` tinyint(1) NOT NULL,
  `canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` int(11) NOT NULL,
  `rewriting` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titre_rew` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_crea` datetime NOT NULL,
  `date_modif` datetime NOT NULL,
  `date_suppr` datetime NOT NULL,
  PRIMARY KEY (`id`,`id_version`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `gab_page`
--

INSERT INTO `gab_page` (`id`, `id_version`, `id_api`, `id_gabarit`, `id_parent`, `ordre`, `visible`, `visible_parent`, `suppr`, `titre`, `bal_title`, `bal_descr`, `bal_key`, `importance`, `no_index`, `canonical`, `author`, `rewriting`, `titre_rew`, `date_crea`, `date_modif`, `date_suppr`) VALUES
(1, 1, 1, 1, 0, 1, 1, 1, 0, 'Accueil', 'Accueil', '', '', 1, 0, '', 0, 'accueil', '', '2014-09-26 12:41:22', '2014-09-26 12:41:22', '0000-00-00 00:00:00'),
(2, 1, 1, 2, 0, 2, 1, 1, 0, 'Elements communs', 'Elements communs', '', '', 1, 0, '', 0, 'elements-communs', '', '2014-09-26 12:41:22', '2014-09-26 12:41:22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `main_accueil`
--

CREATE TABLE IF NOT EXISTS `main_accueil` (
  `id_gab_page` int(11) NOT NULL,
  `id_version` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_gab_page`,`id_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `main_accueil`
--

INSERT INTO `main_accueil` (`id_gab_page`, `id_version`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `main_element_commun`
--

CREATE TABLE IF NOT EXISTS `main_element_commun` (
  `id_gab_page` int(11) NOT NULL,
  `id_version` tinyint(1) NOT NULL,
  `code_google_webmaster_tools` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_bing_webmaster_tools` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_google_analytics` text COLLATE utf8_unicode_ci NOT NULL,
  `publisher_nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `raison_sociale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code_postal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_gab_page`,`id_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `main_element_commun`
--

INSERT INTO `main_element_commun` (`id_gab_page`, `id_version`, `code_google_webmaster_tools`, `code_bing_webmaster_tools`, `publisher`, `code_google_analytics`, `publisher_nom`) VALUES
(2, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `main_element_commun_author_google`
--

CREATE TABLE IF NOT EXISTS `main_element_commun_author_google` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_version` tinyint(1) NOT NULL,
  `id_gab_page` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `suppr` datetime NOT NULL,
  `compte_google` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom_de_lauteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`id_version`),
  KEY `id_version` (`id_version`,`id_gab_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media_fichier`
--

CREATE TABLE IF NOT EXISTS `media_fichier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_gab_page` int(11) NOT NULL,
  `id_temp` int(11) NOT NULL,
  `rewriting` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taille` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `vignette` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_crea` datetime NOT NULL,
  `suppr` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media_fichier_utilise`
--

CREATE TABLE IF NOT EXISTS `media_fichier_utilise` (
  `rewriting` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_gab_page` int(11) NOT NULL,
  `id_version` tinyint(1) NOT NULL,
  UNIQUE KEY `rewriting` (`rewriting`,`id_gab_page`,`id_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `old_link`
--

CREATE TABLE IF NOT EXISTS `old_link` (
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `link` (`link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `redirection`
--

CREATE TABLE IF NOT EXISTS `redirection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_version` int(11) NOT NULL,
  `id_api` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `traduction`
--

CREATE TABLE IF NOT EXISTS `traduction` (
  `cle_sha` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `id_version` tinyint(4) NOT NULL,
  `id_api` tinyint(4) NOT NULL,
  `cle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valeur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aide` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cle_sha`,`id_version`,`id_api`),
  KEY `id_version` (`id_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civilite` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fonction` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `cle` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_cle` datetime NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` int(11) NOT NULL,
  `tel` varchar(31) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(31) COLLATE utf8_unicode_ci NOT NULL,
  `site` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` enum('editeur','administrateur','super administrateur') COLLATE utf8_unicode_ci NOT NULL,
  `gabarit_niveau` int(11) NOT NULL,
  `actif` tinyint(4) NOT NULL,
  `lat` float(10,7) NOT NULL,
  `lng` float(10,7) NOT NULL,
  `date_crea` date NOT NULL,
  `suppr` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `civilite`, `nom`, `prenom`, `societe`, `fonction`, `email`, `pass`, `cle`, `adresse`, `cp`, `ville`, `pays`, `tel`, `fax`, `site`, `description`, `photo`, `niveau`, `gabarit_niveau`, `actif`, `lat`, `lng`, `date_crea`, `suppr`) VALUES
(1, 'M', 'Super Administrateur', 'Solire', 'Solire', '', 'contact@solire.fr', '$2y$10$VfOIubFk/IjdqxPwL60xtOrxXwlOEQqSn5Ml0Jc5z0cSkenCgH8/e', NULL, '34 rue du Professeur Weill', '69006', 'Lyon', 1, '', '', 'http://www.solire.fr', '', '', 'super administrateur', 0, 1, 0.0000000, 0.0000000, '2014-09-26', '0000-00-00 00:00:00'),
(2, 'M.', 'Administrateur', 'Solire', 'Solire', '', 'admin@solire.fr', '$2y$10$VfOIubFk/IjdqxPwL60xtOrxXwlOEQqSn5Ml0Jc5z0cSkenCgH8/e', NULL, '', '', '', 0, '', '', '', '', '', 'administrateur', 0, 1, 0.0000000, 0.0000000, '2014-09-26', '0000-00-00 00:00:00'),
(3, 'M.', 'Éditeur', 'Solire', 'Solire', '', 'editeur@solire.fr', '$2y$10$VfOIubFk/IjdqxPwL60xtOrxXwlOEQqSn5Ml0Jc5z0cSkenCgH8/e', NULL, '', '', '', 0, '', '', '', '', '', 'editeur', 0, 1, 0.0000000, 0.0000000, '2014-09-26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `suf` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `exotique` tinyint(1) NOT NULL,
  `domaine` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `analytics` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sitemap-google` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sitemap-yahoo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sitemap-bing` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_api` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`,`id_api`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `version`
--

INSERT INTO `version` (`id`, `suf`, `nom`, `exotique`, `domaine`, `analytics`, `sitemap-google`, `sitemap-yahoo`, `sitemap-bing`, `id_api`) VALUES
(1, 'FR', 'français (French)', 0, '', '', '', '', '', 1);

--
-- Structure de la table `so_fail2ban`
--

CREATE TABLE IF NOT EXISTS `so_fail2ban` (
`id` int(11) NOT NULL,
  `ip` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `endDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `so_fail2ban`
--
ALTER TABLE `so_fail2ban`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `so_fail2ban`
--
ALTER TABLE `so_fail2ban`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;