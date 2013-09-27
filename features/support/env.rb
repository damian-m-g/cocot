#encoding: utf-8

require 'fileutils'

#si se respeta la convención del esqueleto de un proyecto en Ruby entonces la siguiente línea es fija
$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
#esta es variable. Acá va el nombre del archivo dentro de lib/ que va a requerir a todos los demás del código fuente
require 'cocot'