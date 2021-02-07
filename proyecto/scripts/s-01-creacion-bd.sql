-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion: Creacion de una BD

-- @Section: Observaciones
-- Previamente se tuvo que haber creado los directorios en donde se almacenaran
-- los redolog y los datafiles
-- Ademas, dichos directorios deben pertencer al usuario oracle 
-- y al gpo oinstall
-- Asi mismo se debio haber dado los permisos correspondientes
set serveroutput on

prompt =====================================================
prompt Creando la base de datos frpaproy
prompt =====================================================

create database frpaproy
  user sys identified by system3
  user system identified by system3
  logfile group 1 (
    '/u01/app/oracle/oradata/frpaproy/redo01a.log',
    '/u01/app/oracle/oradata/frpaproy/disk_1/redo01b.log',
    '/u01/app/oracle/oradata/frpaproy/disk_2/redo01c.log') size 50m blocksize 512,
  group 2 (
    '/u01/app/oracle/oradata/frpaproy/redo02a.log',
    '/u01/app/oracle/oradata/frpaproy/disk_1/redo02b.log',
    '/u01/app/oracle/oradata/frpaproy/disk_2/redo02c.log') size 50m blocksize 512,
  group 3 (
    '/u01/app/oracle/oradata/frpaproy/redo03a.log',
    '/u01/app/oracle/oradata/frpaproy/disk_1/redo03b.log',
    '/u01/app/oracle/oradata/frpaproy/disk_2/redo03c.log') size 50m blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL32UTF8
  extent management local
  datafile '/u01/app/oracle/oradata/frpaproy/system01.dbf'
    size 700m reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/u01/app/oracle/oradata/frpaproy/sysaux01.dbf'
    size 550m reuse autoextend on next 10240k maxsize unlimited
  default tablespace users
    datafile '/u01/app/oracle/oradata/frpaproy/users01.dbf'
    size 500m reuse autoextend on maxsize unlimited
  default temporary tablespace tempts1
    tempfile '/u01/app/oracle/oradata/frpaproy/temp01.dbf'
    size 20m reuse autoextend on next 640k maxsize unlimited
  undo tablespace undotbs1
    datafile '/u01/app/oracle/oradata/frpaproy/undotbs01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

alter user sys identified by system3;
alter user system identified by system3;

prompt =====================================================
prompt Creando el diccionario de datos
prompt =====================================================

connect sys/system3 as sysdba

@@?/rdbms/admin/catalog.sql
@@?/rdbms/admin/catproc.sql
@@?/rdbms/admin/utlrp.sql

connect system/system2

@@?/sqlplus/admin/pupbld.sql
