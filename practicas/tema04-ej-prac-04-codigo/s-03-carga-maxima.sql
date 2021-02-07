
-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de eneoro de 2021
-- @Descripcion: 

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

set timing on
exec rodrigo0404.spv_consulta_random_data
set timing off

-- Generar registro en t01_memory_areas con id = 3
insert into rodrigo0404.t01_memory_areas (
  id, sample_date, redo_buffer_size, buffer_cache_size,
  shared_pool_size, large_pool_size, java_pool_size,
  sga_size, sga_free_memory,max_pga_allocated, aggregate_pga_target_param
)  select 
  (
    select 3 from dual
  ) id,
  (
    select sysdate from dual
  ) sample_date,
  (
    select trunc(value/(1024*1024),2)
    from v$parameter 
    where name = 'log_buffer'
  ) redo_buffer_size,
  (
    select trunc(value/(1024*1024),2) 
    from v$sga
    where name = 'Database Buffers'
  ) buffer_cache_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Shared Pool Size' 
  ) shared_pool_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Large Pool Size' 
  ) large_pool_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Java Pool Size' 
  ) java_pool_size,
  (
    select trunc(sum(value)/(1024*1024)) 
    from v$sga
  ) sga_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Free SGA Memory Available' 
  ) sga_free_memory,
  (
    select trunc(value/1048576,2)
    from v$pgastat
    where name='maximum PGA allocated'
  ) max_pga_allocated,
  (
    select trunc(value/(1024*1024),2)
    from v$pgastat 
    where name = 'aggregate PGA target parameter'
  ) aggregate_pga_target_param
  from dual;

commit;

whenever sqlerror continue
