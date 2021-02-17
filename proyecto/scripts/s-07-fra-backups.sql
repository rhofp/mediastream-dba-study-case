-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Configuracion de archivos a respaldar en la FRA

--NOTA: Ejecutar como usuario oracle

-- Un gpo de redologs se almacenar en la fra

shutdown immediate
!mkdir -p /u01/app/oracle/oradata/FRPAPROY/disk_5/redologs/{disk_a,disk_b,disk_c}

!mv /u01/app/oracle/oradata/FRPAPROY/redo03a.log /u01/app/oracle/oradata/FRPAPROY/disk_5/redologs/disk_a/redo03a.log
!mv /u01/app/oracle/oradata/FRPAPROY/disk_1/redo03b.log /u01/app/oracle/oradata/FRPAPROY/disk_5/redologs/disk_b/redo03b.log
!mv /u01/app/oracle/oradata/FRPAPROY/disk_2/redo03c.log /u01/app/oracle/oradata/FRPAPROY/disk_5/redologs/disk_c/redo03c.log

startup mount

alter database 
rename file 
'/u01/app/oracle/oradata/FRPAPROY/redo03a.log',
'/u01/app/oracle/oradata/FRPAPROY/disk_1/redo03b.log ',
'/u01/app/oracle/oradata/FRPAPROY/disk_2/redo03c.log'
to
'/u01/app/oracle/oradata/FRPAPROY/disk_5/redologs/disk_a/redo03a.log'
'/u01/app/oracle/oradata/FRPAPROY/disk_5/redologs/disk_b/redo03b.log'
'/u01/app/oracle/oradata/FRPAPROY/disk_5/redologs/disk_c/redo03c.log';

alter database open;

-- Un archivo de control se almacena en la fra
alter database backup controlfile to
'LOCATION=USE_DB_RECOVERY_FILE_DEST';
