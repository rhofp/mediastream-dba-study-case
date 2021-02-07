set line 200
set heading off
col network format a30
col service format a20
col client_program format a20
col bd_username format a20

--connect sys/system2 as sysdba

prompt T02_DISPATCHER_CONFIG
select * from rodrigo0501.T02_DISPATCHER_CONFIG;
prompt T03_DISPATCHER
select * from rodrigo0501.T03_DISPATCHER;
prompt T04_SHARED_SERVER
select * from rodrigo0501.T04_SHARED_SERVER;
prompt T05_QUEUE
select * from rodrigo0501.T05_QUEUE;
prompt T06_VIRTUAL_CIRCUIT
select * from rodrigo0501.T06_VIRTUAL_CIRCUIT;

col tracefile format a80
col bd_username format a20
col host format a20
col os_user format a20
col session_id format a20
col user_id format a20


prompt T07_SESSION_INFO_CONTEXT
select * from rodrigo0501.T07_SESSION_INFO_CONTEXT;
clear columns
col tracefile format a80
col bd_username format a20
col host format a20
col os_user format a20
col user_id format a20

prompt T08_SESSION_INFO_VIEW
select * from rodrigo0501.T08_SESSION_INFO_VIEW;
prompt T09_PROCESS_INFO
select * from rodrigo0501.T09_PROCESS_INFO;
prompt T10_BACKGROUND_PROCESS
select * from rodrigo0501.T10_BACKGROUND_PROCESS;
prompt T11_FOREGROUND_PROCESS
select * from rodrigo0501.T11_FOREGROUND_PROCESS;
