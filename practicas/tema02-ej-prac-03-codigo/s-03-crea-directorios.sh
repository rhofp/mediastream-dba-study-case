#!/bin/bash
# @Autor: Francisco Pablo Rodrigo
# @Fecha creacion: 15/10/2010
# @Descripcion: Creacion de directorios para la BD

export ORACLE_SID=rfpbda2

# Crear directorios
mkdir -p /u01/app/oracle/oradata/${ORACLE_SID^^}
mkdir -p /u02/app/oracle/oradata/${ORACLE_SID^^}
mkdir -p /u03/app/oracle/oradata/${ORACLE_SID^^}

# Cambiando dueno y gpo de carpetas
chown -R oracle:oinstall /u01/app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall /u02/*
chown -R oracle:oinstall /u03/*

# Cambiando mascara de permisos
chmod -R 754 /u01/app/oracle/oradata/${ORACLE_SID^^}
chmod -R 754 /u02/app/oracle/oradata/${ORACLE_SID^^}
chmod -R 754 /u03/app/oracle/oradata/${ORACLE_SID^^}