#language: es

Característica: cocot construye el esqueleto del proyecto.

  Con el fin de cumplimentar el objetivo principal de la aplicación,
  como desarrollador,
  quiero poder lograr que cocot construya el esqueleto del nuevo proyecto en la ruta actual desde donde se está ejecutando la aplicación.

  Escenario: genero el árbol de carpetas.
    Dado que el usuario ingresó correctamente el comando para esqueletizar su nuevo proyecto, por ejemplo: "cocot Proyecto",
    Cuando origino sus carpetas,
    Entonces debo encontrar creada una carpeta con nombre "Proyecto",
    #realmente el step definition de la siguiente línea testea que estén todos los archivos también
    Y dentro de ella debo encontrarme con la siguiente estructura de carpetas creadas:
      | bin                       |
      | lib                       |
      | lib/Proyecto              |
      | spec                      |
      | spec/Proyecto             |
      | features                  |
      | features/support          |
      | features/step_definitions |
      | doc                       |