<?php
/**
 * Demande de paramètre en fonction d'un fichier de config ini
 *
 * @author  dev <dev@solire.fr>
 * @license CC by-nc http://creativecommons.org/licenses/by-nc/3.0/fr/
 */

namespace Install;

use Composer\Script\Event;
use Install\Parameters;

/**
 * Demande de paramètre en fonction d'un fichier de config ini
 *
 * @author  dev <dev@solire.fr>
 * @license CC by-nc http://creativecommons.org/licenses/by-nc/3.0/fr/
 */
class Ask
{
    /**
     * A composer installation script to define the different configuration
     * parameters
     *
     * @param Event $event the composer event
     *
     * @return void
     */
    public static function Parameters(Event $event)
    {
        $extras = $event->getComposer()->getPackage()->getExtra();
        $filesPath = $extras['solire']['parameters'];
        $parameters = new Parameters($event->getIO());
        foreach ($filesPath as $filePath => $moreParams) {
            $sections = null;
            if (isset($moreParams['sections'])) {
                $sections = $moreParams['sections'];
            }

            $hiddenAnswer = null;
            if (isset($moreParams['hideAnswer'])) {
                $hiddenAnswer = $moreParams['hideAnswer'];
            }

            $defaultFile = $filePath . '.default.ini';
            $newFile = $filePath . '.ini';

            if (!file_exists($newFile)
                && file_exists($defaultFile)
            ) {
                $parameters->processFile(
                    $defaultFile,
                    $newFile,
                    $sections,
                    $hiddenAnswer
                );
            }
        }
    }
}
