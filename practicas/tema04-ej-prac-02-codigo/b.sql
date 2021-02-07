create table t02_db_cache_stats(
  sample_date date,
  db_blocks_gets_from_cache number,
  consistent_gets_from_cache number,
  physical_reads_cache number,
  cache_hit_radio number
);
