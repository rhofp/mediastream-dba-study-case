-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Configuracion para habilitar el modo archivelog

connect sys/system3 as sysdba

create pfile from spfile;

alter system set log_archive_max_processes=5 scope=spfile;

--rutas
alter system set 
log_archive_dest_1='LOCATION=/u01/app/oracle/oradata/FRPAPROY/disk_3 MANDATORY' 
scope=spfile;

alter system set 
log_archive_dest_2='LOCATION=/u01/app/oracle/oradata/FRPAPROY/disk_4' 
scope=spfile;

alter system set 
log_archive_dest_3='LOCATION=USE_DB_RECOVERY_FILE_DEST' scope=spfile;

alter system set log_archive_format='arch_%t_%s_%r.arc' scope=spfile;

alter system set log_archive_min_succeed_dest=1;

shutdown;

startup mount

alter database archivelog;

alter database open;

create pfile from spfile;
