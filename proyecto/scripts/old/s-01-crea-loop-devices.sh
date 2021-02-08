#!/bin/bash
# @Autor:           Francisco Pablo Rodrigo
# @Fecha creacion:  04/02/2021
# @Descripcion:     Creacion de loop devices

# NOTE: execute as sudo user

export ORACLE_SID=frpaproy
basedir="/u01/app/oracle/oradata/${ORACLE_SID^^}"

echo "Directorio base: ${basedir}"
read -p "Continuar? (y/n): "
if [[ $REPLY = 'n' ]]; then exit; fi

# Crear directorios
mkdir -p ${basedir}/{disk_1,disk_2}

# Cambiando dueno y gpo de carpetas
chown -R oracle:oinstall /u01/app/oracle/oradata/${ORACLE_SID^^}

# Cambiando mascara de permisos
chmod -R 754 /u01/app/oracle/oradata/${ORACLE_SID^^}

ls -l ${basedir}

# Checkpoint para ver el status 
# y analizar manualmente si se debe continuar
read -p "Continuar? (y/n): "
if [[ $REPLY = 'n' ]]; then exit; fi

echo "Creando discos virtuales"
if ! [ -f "${basedir}/disk_1.img" ]; then
  dd if=/dev/zero of=${basedir}/disk_1.img bs=100M count=10
else
  echo "El disco virtual 1 ya existe"
fi

if ! [ -f "${basedir}/disk_2.img" ]; then
  dd if=/dev/zero of=${basedir}/disk_2.img bs=100M count=10
else
  echo "El disco virtual 2 ya existe"
fi

echo "Comprobando la creacion de discos"
du -sh ${basedir}/disk*.img
losetup -fP ${basedir}/disk_1.img
losetup -fP ${basedir}/disk_2.img

echo "Revisando las configuraciones"
losetup -a

# Como proceso de automatizacion se formatean en automatico
# Se asume que los discos estan vacios
echo "Formateando discos"
mkfs.ext4 ${basedir}/disk_1.img -F 
mkfs.ext4 ${basedir}/disk_2.img -F 

echo "Realiza la configuracion del archivo /etc/fstab de forma manual"
