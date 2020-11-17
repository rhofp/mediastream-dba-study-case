#!/bin/bash
# @Autor: Francisco Pablo Rodrigo
# @Fecha creacion: 15/10/2010
# @Descripcion: Creacion de loop devices

# Creando y cambiandose a la ruta recomendada
mkdir -p /unam-bda
cd /unam-bda

echo "Creando discos virtuales"
if ! [ -f "/unam-bda/disk2.img" ]; then
  dd if=/dev/zero of=disk2.img bs=100M count=10
else
  echo "El disco virtual 1 ya existe"
fi

if ! [ -f "/unam-bda/disk3.img" ]; then
  dd if=/dev/zero of=disk3.img bs=100M count=10
else
  echo "El disco virtual 2 ya existe"
fi

echo "Comprobando la creacion de discos"
du -sh disk*.img
losetup -fP disk2.img
losetup -fP disk3.img

echo "Revisando las configuraciones"
losetup -a

# Como proceso de automatizacion se formatean en automatico
# Se asume que los discos estan vacios
echo "Formateando discos"
mkfs.ext4 disk2.img -F 
mkfs.ext4 disk3.img -F

# Creando las carpetas para montar los discos virtuales
mkdir -p /u02
mkdir -p /u03

echo "Realiza la configuracion del archivo /etc/fstab de forma manual"