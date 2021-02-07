select component component_name,
  trunc(current_size/1024,2) current_size_mb
from v$sga_dynamic_components
where current_size = (
  select min(current_size) from v$sga_dynamic_components
  where current_size > 0
) 
fetch first row only;