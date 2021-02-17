#!/bin/bash
# @Autor:           Francisco Pablo Rodrigo
# @Fecha creacion:  05/02/2021
# @Descripcion:     Configuraciones previas la instalacion de la BD

# NOTA: EJECUTAR COMO USUARIO ORACLE

# Se puede configurar como fija
export ORACLE_SID=frpaproy

ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1

# ^^ transforma la cadena a mayusculas
BASEDIR="/u01/app/oracle/oradata/${ORACLE_SID^^}"

echo "Directorio base: ${BASEDIR}"
read -p "Continuar? (y/n): "
if [[ $REPLY = 'n' ]]; then exit; fi

# Crear directorios
mkdir -p ${BASEDIR}/{disk_1,disk_2,disk_3,disk_4,disk_5,disk_6}

# Cambiando dueno y gpo de carpetas
chown -R oracle:oinstall ${BASEDIR}

# Cambiando mascara de permisos
chmod -R 754 ${BASEDIR}

ls -l ${BASEDIR}

# Archivo de passwords para la instancia frpaproy
echo "Ahora se creara el archivo de passwords:"
echo "${ORACLE_HOME}/dbs/orapw${ORACLE_SID}"
echo "Agregar como contrasena hola1234*"
read -p "Continuar? (y/n): "
if [[ $REPLY = 'n' ]]; then exit; fi

orapwd file="${ORACLE_HOME}/dbs/orapw${ORACLE_SID}" force=y sys=password

# Verificando existenca archivo de parametros
# Si ya existe lo elimino, la razon de eliminarlo es por motivos 
# automatizacion, realidad si ya existe no debemos sobreescribirlo
if [ -f "${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora" ]; then
  rm "${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"
fi

# Checkpoint para ver el status 
# y analizar manualmente si se debe continuar
echo "Ahora se creara el archivo de control"

echo "en ${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"
read -p "Continuar? (y/n): "
if [[ $REPLY = 'n' ]]; then exit; fi

# Creando el archivo de parametros
touch "${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"
paramFile="${ORACLE_HOME}/dbs/init${ORACLE_SID}.ora"

# Si hay error salimos
if [ $? -ne 0 ]; then
  echo "Error: Posiblemente no se ejecuto el script como usuario oracle"
  echo "O las rutas son invalidas"
  exit 100
fi  

echo "db_name=${ORACLE_SID}" > "${paramFile}" 
echo "control_files=(${BASEDIR}/control01.ctl,
  ${BASEDIR}/disk_1/control02.ctl,
  ${BASEDIR}/disk_2/control03.ctl )" >> "${paramFile}"
echo "memory_target=768M" >> "${paramFile}"
