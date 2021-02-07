-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Configuracion para adminstracion de memoria en modo semi
--               automatico

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

alter system set memory_target=0M scope=memory;

-- Agrega instruccion para configurar sga_target
alter system set sga_target=404M scope=memory;

-- Instruccion para configurar la pga_aggregate_target 
-- 363M se obtiene del primer registros de la columna max_pga_allocated 
-- Este valor se elegio porque cumplia con que la suma de este valor con el de
-- la memoria libre de la sga daban como resultado el valor de memory_target.
-- En ejecuciones posteriores se obtuvo un valor maximo de 188 M para
-- max_pga_allocated, sin embargo, se decidio no tomarlo porque no cumplia con
-- la regla de la suma.
-- Posteriormente se reconocio que el algoritmo de carga maxima debio haber sido
-- un poco mas robusto para obtener un valor mayor.
-- Finalmente se decidio dejar este valor porque es el que mejor se ajustaba a
-- la regla de la suma y al primer valor obtenido en la primera ejecucion
alter system set pga_aggregate_target=363M scope=memory;

exec dbms_session.sleep(5);

insert into rodrigo0404.t02_memory_param_values (
  id, sample_date, memory_target, sga_target, pga_aggregate_target,
  shared_pool_size, large_pool_size, java_pool_size, db_cache_size
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
    from v$pgastat 
    where name = 'aggregate PGA target parameter' 
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

