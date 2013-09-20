#encoding: utf-8

#keywords de cucumber en español(para que funcionen poner en la primera línea de cada *.feature "#language: es"):
=begin
  "background": "Antecedentes",
  "feature": "Característica",
  "scenario": "Escenario",
  "scenario_outline": "Esquema del escenario",
  "examples": "Ejemplos",
  "given": "*|Dado|Dada|Dados|Dadas",
  "when": "*|Cuando",
  "then": "*|Entonces",
  "and": "*|Y",
  "but": "*|Pero"
=end

#plantilla para describir una característica:
=begin
  En orden de <alcanzar un objetivo>
  Como un/a <tipo de persona>
  Quiero <una característica>
=end

#si se respeta la convención del esqueleto de un proyecto en Ruby entonces la siguiente línea es fija
$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
#esta es variable. Acá va el nombre del archivo dentro de lib/ que va a requerir a todos los demás del código fuente
require 'cocot'