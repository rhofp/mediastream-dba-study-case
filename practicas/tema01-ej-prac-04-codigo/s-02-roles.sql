-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 06/10/2010
-- @Descripcion: Listar roles y privilegios existentes

declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0104';
  v_db_roles_table_name varchar2(30) := 'T02_DB_ROLES';
  v_dba_privs_table_name varchar2(30) := 'T03_DBA_PRIVS';
begin
  -- Crear la tabla t02_db_roles
  select count(*) into v_count
  from all_tables
  where table_name = v_db_roles_table_name;

  -- Eliminar la tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table ' 
      || v_username || '.' 
      || v_db_roles_table_name;
  end if;

  -- Creando tabla
  execute immediate 'create table ' || v_username || '.'
    || v_db_roles_table_name || '(
      role_id number,
      role varchar2(128)
    )';

  execute immediate 'insert into ' || v_username || '.' 
    || v_db_roles_table_name || '(
    role_id,role ) select role_id, role from dba_roles'; 

  commit;

  -- Crear la tabla t03_dba_privs
  select count(*) into v_count
  from all_tables
  where table_name = v_dba_privs_table_name;

  -- Eliminar la tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table ' 
      || v_username || '.' 
      || v_dba_privs_table_name;
  end if;

  -- Creando tabla
  execute immediate 'create table ' || v_username || '.'
    || v_dba_privs_table_name || '(
      privilege varchar2(128)
    )';

  execute immediate 'insert into ' || v_username || '.' 
    || v_dba_privs_table_name || '(privilege) 
    select privilege from DBA_SYS_PRIVS';     
  
  commit;

end;
/