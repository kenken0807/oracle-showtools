@set
select ut.INDEX_NAME,ut.INDEX_TYPE,ut.NUM_ROWS,ut.UNIQUENESS,ut.CLUSTERING_FACTOR,us.BYTES/1024/1024 as MB,uo.OBJECT_ID,uo.LAST_DDL_TIME,uo.TIMESTAMP as create_date,ut.LAST_ANALYZED from USER_INDEXES ut,user_segments us,user_objects uo where ut.INDEX_NAME=us.SEGMENT_NAME and ut.INDEX_NAME=uo.OBJECT_NAME and ut.INDEX_NAME=upper('&1');

select 
  ui.COLUMN_NAME
  ,ui.COLUMN_POSITION
  ,ui.COLUMN_LENGTH
  ,ut.NUM_DISTINCT as CARDINALITY 
  ,ut.NULLABLE,ut.NUM_NULLS 
  ,uie.COLUMN_EXPRESSION as FUNCTION_IDX
from 
  user_ind_columns ui 
left join 
  user_tab_columns ut 
on 
  ui.TABLE_NAME=ut.TABLE_NAME and  
  ui.COLUMN_NAME=ut.COLUMN_NAME
left join 
  user_ind_expressions uie
on  
  ui.TABLE_NAME=uie.TABLE_NAME and 
  ui.INDEX_NAME=uie.INDEX_NAME and 
  ui.COLUMN_POSITION=uie.COLUMN_POSITION
where ui.INDEX_NAME=upper('&1') 
order by ui.COLUMN_POSITION;
