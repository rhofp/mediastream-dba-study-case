-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Creacion de tablespaces


create tablespace multimedia_tbs
  datafile '/u01/app/oracle/oradata/FRPAPROY/disk_2/multimedia01.dbf' 
  size 1m
  reuse 
  autoextend on next 1m maxsize 5G 
  logging
  online;

create tablespace indexes_tbs 
  datafile '/u01/app/oracle/oradata/FRPAPROY/disk_3/indexes01.dbf' 
  size 500k
  reuse
  autoextend on next 500k maxsize 100m
  online;

create bigfile tablespace contenido_blob_tbs 
  datafile '/u01/app/oracle/oradata/FRPAPROY/disk_4/contenido_blob.dbf' 
  size 10m
  reuse
  autoextend on next 1m maxsize 100G
  online;
