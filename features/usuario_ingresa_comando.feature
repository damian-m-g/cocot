#language: es

Característica: el usuario ingresa un comando y obtiene una respuesta.

  Con el fin de conocer que sucede en la aplicación cuando ingreso determinado comando,
  como usuario,
  quiero poder ingresar un comando y recibir una respuesta.

  Antecedentes: la aplicación aún no fue iniciada.
    Dado que aún no inicié la aplicación,

  #Casos erroneos.

  Esquema del escenario: intento iniciar la aplicación ingresando determinados comandos incorrectos.
    Cuando ejecuto el comando: "<comando>",
    Entonces debo recibir en consola: "<salida>",
    Y el programa debe terminarse.

    Ejemplos: ingreso comandos incorrectos.
      | comando                          | salida                                                                                                                                |
      | cocot                            | Error: cocot needs to know the name of the further proyect. `cocot '<name_of_the_proyect>'`.                                          |
      | cocot ''                         | Error: cocot needs to know the name of the further proyect. `cocot '<name_of_the_proyect>'`.                                          |
      | cocot dos argumentos             | Error: cocot just need one argument: the name of the further proyect. If its name have more than a word you must put these inside ''. |
      | cocot --help nombre              | Error: what do you want to do? invoke the help or skeletonize? You can't do both things.                                              |
      | cocot nombre del proyecto --help | Error: what do you want to do? invoke the help or skeletonize? You can't do both things.                                              |

  @carpeta_existente
  Escenario: ejecuto "cocot Proyecto" existiendo en el directorio actual una carpeta de nombre "Proyecto".
    Dado que existe la carpeta "Proyecto" en el directorio actual,
    Cuando ejecuto el comando: "cocot Proyecto",
    Entonces debo recibir en consola: "Building skeletal structure for Proyecto.",
    Y a continuación: "Skeletal structure can't be build. There's an existing folder in the working directory called Proyecto.", terminando el programa.

  #Solicitando ayuda.

  Escenario: invoco ayuda.
    Cuando ejecuto el comando: "cocot --help",
    Entonces debo recibir en consola información que me ayude a comprender el funcionamiento de cocot,
    Y el programa debe terminarse.

  #Arrancando el programa satisfactoriamente.

  Escenario: arranco el programa satisfactoriamente.
    Cuando ejecuto el comando: "cocot ProyectoFu",
    Entonces debo recibir en consola: "Building skeletal structure for ProyectoFu.".

  Escenario: arranco el programa satisfactoriamente.
    Cuando ejecuto el comando: "cocot 'Proyecto Fu Fu'", cocot entiende que el nombre del proyecto será "Proyecto Fu Fu",
    Entonces debo recibir en consola: "Building skeletal structure for Proyecto Fu Fu.".

  @wip
  Escenario: paso la opción --full.
    Cuando ejecuto el comando: "cocot --full ProyectoFu",
    Entonces debo recibir en consola: "Building skeletal structure for ProyectoFu",
    Y debo ver generada además de las carpetas convencionales: './data/', './share/' y './ext/'.