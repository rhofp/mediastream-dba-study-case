-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 11/12/2020
-- @Descripcion: Informacion acerca del db buffer cache
whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0402';
  v_table_01 varchar2(30) := 'T03_DB_BUFFER_CACHE';
  v_table_02 varchar2(30) := 'T04_DB_BUFFER_SYSSTATS';
begin
    -- Comprobando la existencia de la tabla    
    select count(*) into v_count    
    from all_tables    
    where table_name = v_table_01;    
             
    -- Eliminando tabla en caso de existir    
    if v_count > 0 then    
    execute immediate 'drop table '|| v_username ||'.'||v_table_01;    
    end if; 

    -- Comprobando la existencia de la tabla    
    select count(*) into v_count    
    from all_tables    
    where table_name = v_table_02;    
             
    -- Eliminando tabla en caso de existir    
    if v_count > 0 then    
    execute immediate 'drop table '|| v_username ||'.'||v_table_02;    
    end if; 
end;
/

create table rodrigo0402.t03_db_buffer_cache as (
  select block_size, current_size, buffers, target_buffers,
  prev_size, prev_buffers,
  (
    select value
    from v$parameter 
    where name='db_cache_size'
  )  default_pool_size
  from v$buffer_pool
);

create table rodrigo0402.t04_db_buffer_sysstats as (
  select 
  (
    select value from v$sysstat 
    where name ='db block gets from cache'
  ) db_blocks_gets_from_cache,  
  (
    select value from v$sysstat 
    where name ='consistent gets from cache'
  ) consistent_gets_from_cache,
  (
    select value from v$sysstat 
    where name ='physical reads cache'
  ) physical_reads_cache,
  trunc((
    1 - (
      select value from v$sysstat 
      where name ='physical reads cache'
    )/(
      ( 
        select value from v$sysstat 
        where name ='db block gets from cache'
      ) +
      (
        select value as from v$sysstat 
        where name ='consistent gets from cache'
      )
    )
  ), 6
  ) as cache_hit_radio
  from dual
);

prompt Listo !
whenever sqlerror continue
