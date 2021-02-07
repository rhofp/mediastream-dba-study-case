-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de eneoro de 2021
-- @Descripcion: 

whenever sqlerror exit rollback
set serveroutput on


-- Detener instancia
connect sys as sysdba
shutdown immediate

-- Iniciar instancia
connect sys as sysdba
startup

-- Generar registro en t01_memory_areas con id = 2
insert into t01_memory_areas (
  id, sample_date, redo_buffer_size, buffer_cache_size, 
  shared_pool_size, large_pool_size, java_pool_size,
  sga_size, sga_free_memory,max_pga_allocated, aggregate_pga_target_param
)
  select 
  (
    select 2 from dual
  ) id,
  (
    select sysdate from dual
  ) sample_date,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'memory_target'
  ) memory_target,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'sga_target' 
  ) sga_target,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'pga_aggregate_target' 
  ) pga_aggregate_target,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'shared_pool_size' 
  ) shared_pool_size,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'large_pool_size' 
  ) large_pool_size,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'java_pool_size' 
  ) java_pool_size,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'db_cache_size' 
  ) db_cache_size
  from dual;

commit;

whenever sqlerror continue
