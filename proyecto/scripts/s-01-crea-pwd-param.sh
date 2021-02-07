#!/bin/bash
# @Autor:           Francisco Pablo Rodrigo
# @Fecha creacion:  05/02/2021
# @Descripcion:     Configuraciones previas la instalacion de la BD

# Se puede configurar como fija
export ORACLE_SID=frpaproy

# Archivo de passwords para la instancia frpaproy
echo "Agregar como contrasena hola1234*"
orapwd file="${ORACLE_HOME}/dbs/orapw${ORACLE_SID}" force=y sys=password

# Verificando existenca archivo de parametros
# Si ya existe lo elimino, la razon de eliminarlo es por motivos 
# automatizacion, realidad si ya existe no debemos sobreescribirlo
if [ -f "${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora" ]; then
  rm "${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"
fi

# Creando el archivo de parametros
touch "${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"
paramFile="${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"

# Si hay error salimos
if [ $? -ne 0 ]; then
  echo "Error: Posiblemente no se ejecuto el script como usuario oracle"
  echo "O las rutas son invalidas"
  exit 100
fi  

# Notar que ${ORACLE_SID^^} transforma la cadena a mayusculas
echo "db_name=${ORACLE_SID}" >> "${paramFile}" 
echo "control_files=(/u01/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
  /u01/app/oracle/oradata/${ORACLE_SID^^}/disk_1/control02.ctl,
  /u01/app/oracle/oradata/${ORACLE_SID^^}/disk_2/control03.ctl )" >> "${paramFile}"
echo "memory_target=768M" >> "${paramFile}"
