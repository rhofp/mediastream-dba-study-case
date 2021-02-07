  select 
  (
    select 'bkg-processs' from dual
  ) process_type,
  (
    select count(*) 
    from  v$process
    where pname is not null
  ) total_process,
  (
    select trunc(sum(pga_alloc_mem)/(1024*1024),2)
    from v$process
    where pname is not null
  ) total_pga_allocated_mb,
  (
    select trunc(sum(pga_used_mem)/(1024*1024),2)
    from v$process
    where pname is not null
  ) total_pga_used_mb
  from dual
  union
  select 
  (
    select 'other-processs' from dual
  ) process_type,
  (
    select count(*) 
    from  v$process
    where pname is null
  ) total_process,
  (
    select trunc(sum(pga_alloc_mem)/(1024*1024),2)
    from v$process
    where pname is null
  ) total_pga_allocated_mb,
  (
    select trunc(sum(pga_used_mem)/(1024*1024),2)
    from v$process
    where pname is null
  ) total_pga_used_mb
  from dual;
