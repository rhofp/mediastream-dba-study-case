-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: 

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0403';
  v_table_01 varchar2(30) := 'T05_HIST_PGA_STATS';
  v_table_02 varchar2(30) := 'T06_HIST_PGA_PROCESS';
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

create table rodrigo0403.t05_hist_pga_stats(
  sample_date               date,
  max_pga_mb                number ,
  pga_target_parameter_mb   number ,
  pga_total_actual_mb       number ,
  pga_in_use_actual_mb      number ,
  pga_free_memory_mb        number ,
  pga_process_count         number ,
  pga_in_use_workareas_auto number
);
create table rodrigo0403.t06_hist_pga_process (
  sample_date             date,
  process_type            varchar2(15),
  total_username          number,
  total_pga_allocated_mb  number,
  total_pga_used_mb       number
);

grant select on rodrigo0402.t01_random_data to rodrigo0403;
