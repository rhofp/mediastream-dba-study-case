-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Configuracion de modo compartido

whenever sqlerror exit rollback
set serveroutput on

-- Configurar 2 dispatchers
alter system set dispatchers='(dispatchers=2)(protocol=tcp)';

-- Configurar 4 shared servers
alter system set shared_servers=4;

-- Comprobar la configuracion con el comando show parameter

show parameter dispatchers
show parameter shared_servers

-- Comando para notificar al listener
alter system register;

-- Consulta que muestra lista de servicios registrados en el listener
select program,pid,pname
from v$process
where pname like'S0%'
or pname like 'D0%'
order by program;

whenever sqlerror continue
