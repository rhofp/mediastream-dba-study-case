#!/bin/bash
#@Autor Rodrigo Francisco Pablo
#@Fecha 01/10/2020
#@Descripcion Script para descargar imagenes

# Configuramos la variable de entorno en caso de que no exista
# de lo contrario las rutas se alteraran
export TMP="/tmp"

#
# Parametros de linea de comandos
#
archivoImg="${1}"
numImagenes="${2}"
archivoZip="${3}"

#
#Funcion ayuda
#Parametros:
#parametro 1: valor del status
#
function ayuda(){
  status="${1}"
  cat s-02-ayuda.sh
  exit "${status}"
}

#Validando el primer parametro : nombre del archivo con la lista de imagenes
# Si ${archivoImg} es nulo, se ejecuta ayuda con codigo 100
if [ -z "${archivoImg}" ]; then
  echo "ERROR: El nombre del archivo de imagenes es requerido"
  ayuda 100
else
  # Si el directorio no es valido, terminar con codigo 101
  if ! [ -f "${archivoImg}" ]; then
    echo "ERROR: El archivo ${archivoImg} no existe"
    ayuda 101
  fi
fi

#Validando parametro 2: numero de imagenes
#rango valido: [1,90]
if ! [[ "${numImagenes}" =~ [0-9]+ && "${numImagenes}" -gt 0 
  && "${numImagenes}" -le 90 ]]; then
	echo "ERROR: El numero de imagenes es incorrecto"
	ayuda 102
fi

#Validar parametro 3: 
# Si el nombre del archivo no es nulo construimos el zip a partir del param 3
if [ -n "${archivoZip}" ]; then
  dirSalida=$(dirname "${archivoZip}")
  nombreZip=$(basename "${archivoZip}")
  
  if ! [ -d "${dirSalida}" ];then
  	echo "ERROR: La ruta indicada no existe"
  	ayuda 103
  fi
else
  dirSalida="${TMP}"/"${USER}"/imagenes
  mkdir -p "${dirSalida}"
  nombreZip="imagenes-$(date '+%Y-%m-%d-%H-%M-%S').zip"
fi

#Parametros validos
#Limpieza, eliminar posibles descargas anteriores
rm -rf "${dirSalida}"/*

#Leer el archivo que contiene la lista de imagenes
count=1
while read -r linea
do
  if [ "${count}" -le "${numImagenes}" ]; then
    wget -q -P "${dirSalida}" "${linea}"
    # Status de descarga de imagen
    status=$?  
    if [ "${status}" -eq 0 ]; then
      count=$((count+1))
    else
  	  echo "ERROR: Error en la descarga"
  	  ayuda 104
    fi
  fi
done < "${archivoImg}"

#Generando el archivo zip
export IMG_ZIP_FILE="${dirSalida}"/"${nombreZip}"

zip "${IMG_ZIP_FILE}" "${dirSalida}"/*

#cambiar permisos 700
chmod 700 ${IMG_ZIP_FILE}

#Generar el archivo con la lista de imagenes descargadas...
#Lista todos los archivos que sean diferentes del formato zip
# Otras alternativas validas si estrictamente queremos filtrar 
# formatos de imagenes serian:
#   awk -F / '/.jpg/ || /.png/ {print $NF}'
ls  ${dirSalida} | awk -F / '! /.zip/ {print $NF}' >  s-00-lista-archivos.txt 