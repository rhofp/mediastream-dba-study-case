-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Configuracion de la administracion de la memoria en modo manual

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

alter system set memory_target=0M scope=memory;

alter system set sga_target=0M scope=memory;
--alter system set pga_aggregate_target = 0M scope=memory;

-- Del mismo modo que en s-04-automatic-shared.sql, se considerar los valores de
-- la primera vez que se ejecuto el script, en donde la PGA habia realizado mas
-- operaciones, adicionales a la carga maxima, por lo cual se obtuvieron estos
-- valores que pueden no coinicidir enteramente con la salida de las tablas.
-- Sin embargo, no hay mucha discrepancia
alter system set db_cache_size=168M scope=memory;
alter system set shared_pool_size=212M scope=memory;
alter system set large_pool_size=4M scope=memory;
alter system set java_pool_size=4M scope=memory;


exec dbms_session.sleep(5);

insert into rodrigo0404.t02_memory_param_values (
  id, sample_date, memory_target, sga_target, pga_aggregate_target,
  shared_pool_size, large_pool_size, java_pool_size, db_cache_size
)
select 
  (
    select 3 from dual
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

