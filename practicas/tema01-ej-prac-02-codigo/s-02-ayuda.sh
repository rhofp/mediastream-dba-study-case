/s-01-procesa-imagenes.sh <path_archivo_imagen> <num_imagenes> [<nombre_archivo_zip>]

<path_archivo_imagen>     Ruta y nombre donde se encuentra el archivo de texto 
                          que contiene un URL por cada renglón de la imagen que 
                          será descargada de internet.
                          Total de imágenes a descargar, entre 1 y hasta 90 imágenes
<num_imagenes>            Parámetro opcional que indica la ruta y nombre del archivo 
                          zip a generar.
[<nombre_archivo_zip>]    En caso de no especificarse se empleará el nombre 
                          imagenes-yyyy-mm-dd-hh:mi:ss.zip y estará ubicado en
                          {TMP}/imagenes/${USER}/imagenes. Si se especifica este parámetro, 
                          su valor deberá incluir la ruta y el nombre del archivo zip a 
                          generar. La ruta absoluta y el nombre del archivo zip 
                          generado deberá ser exportado empleando una variable de 
                          entorno IMG_ZIP_FILE

