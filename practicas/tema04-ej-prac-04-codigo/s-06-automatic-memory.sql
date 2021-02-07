-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Configuracion de la admin de memoria en modo automatico

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

-- Este valor de los valores anteriores del script s-05-manual-shared.sql,
-- Se sumaron los valores y se obtuvo la cantidad de 768M. La cual coincide con
-- el valor original que tenia.
-- Nuevamente se hace la aclaracion de que esto se debe a que se tomo un valor
-- de 364M para la administracion de la PGA, como se explico en
-- s-04-automatic-shared.sql
alter system set memory_target=768M scope=memory;

alter system set sga_target = 0M scope=memory;
alter system set pga_aggregate_target = 0M scope=memory;

alter system set db_cache_size=0M scope=memory;
alter system set shared_pool_size=0M scope=memory;
alter system set large_pool_size=0M scope=memory;
alter system set java_pool_size=0M scope=memory;

exec dbms_session.sleep(5);

insert into rodrigo0404.t02_memory_param_values (
  id, sample_date, memory_target, sga_target, pga_aggregate_target,
  shared_pool_size, large_pool_size, java_pool_size, db_cache_size
)
select 
  (
    select 4 from dual
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

