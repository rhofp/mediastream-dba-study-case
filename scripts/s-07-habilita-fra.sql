-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Configuraciones para habilitar la FRA

-- Se propone un tamaño de 2G dadas las capacidades de la maquina 
-- y el valor de la carga inicial 
alter system set db_recovery_file_dest_size=2g scope=both;

-- Los archivos de FRA se ubican exclusivamente en disk_5
alter system 
set db_recovery_file_dest='/u01/app/oracle/oradata/FRPAPROY/disk_5' 
scope=both;

-- Se asegura un periodo de retencion de un dia 
-- para poder generar un guaranteed restore point
alter system set db_flashback_retention_target=1440 scope=both;
