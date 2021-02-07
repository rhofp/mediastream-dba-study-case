-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 15/12/2020
-- @Descripcion: Creacion memoria flash
whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

create pfile='/u04/db_flash_cache/pfile' from spfile;

alter system set db_flash_cache_file='/u04/db_flash_cache/rfpbda2_flash.cache' scope=spfile;
alter system set db_flash_cache_size=50M scope=spfile;


prompt Listo !
whenever sqlerror continue
