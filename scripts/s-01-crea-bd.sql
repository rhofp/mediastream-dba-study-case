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
prompt Creando la base de datos FRPAPROY
prompt =====================================================

create database frpaproy
  user sys identified by system3
  user system identified by system3
  logfile group 1 (
    '/u01/app/oracle/oradata/FRPAPROY/redo01a.log',
    '/u01/app/oracle/oradata/FRPAPROY/disk_1/redo01b.log',
    '/u01/app/oracle/oradata/FRPAPROY/disk_2/redo01c.log') size 50m blocksize 512,
  group 2 (
    '/u01/app/oracle/oradata/FRPAPROY/redo02a.log',
    '/u01/app/oracle/oradata/FRPAPROY/disk_1/redo02b.log',
    '/u01/app/oracle/oradata/FRPAPROY/disk_2/redo02c.log') size 50m blocksize 512,
  group 3 (
    '/u01/app/oracle/oradata/FRPAPROY/redo03a.log',
    '/u01/app/oracle/oradata/FRPAPROY/disk_1/redo03b.log',
    '/u01/app/oracle/oradata/FRPAPROY/disk_2/redo03c.log') size 50m blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/u01/app/oracle/oradata/FRPAPROY/system01.dbf'
    size 700m reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/u01/app/oracle/oradata/FRPAPROY/sysaux01.dbf'
    size 1g reuse autoextend on next 10240k maxsize unlimited
  default tablespace users
    datafile '/u01/app/oracle/oradata/FRPAPROY/users01.dbf'
    size 500m reuse autoextend on maxsize unlimited
  default temporary tablespace tempts1
    tempfile '/u01/app/oracle/oradata/FRPAPROY/temp01.dbf'
    size 20m reuse autoextend on next 640k maxsize unlimited
  undo tablespace undotbs1
    datafile '/u01/app/oracle/oradata/FRPAPROY/undotbs01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

alter user sys identified by system3;
alter user system identified by system3;
