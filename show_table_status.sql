@set
select ut.TABLE_NAME,ut.STATUS,ut.NUM_ROWS,ut.BLOCKS,us.BYTES/1024/1024 as MB,uo.OBJECT_ID,uo.LAST_DDL_TIME,uo.TIMESTAMP as create_date,ut.LAST_ANALYZED from user_tables ut,user_segments us,user_objects uo where ut.table_name=us.SEGMENT_NAME and ut.table_name=uo.OBJECT_NAME and ut.table_name=upper('&1');

select tc.TABLE_NAME,tc.COLUMN_NAME,tc.COLUMN_ID as SEQ_ID,tc.DATA_TYPE,tc.DATA_LENGTH as LENGTH ,nvl2(ppk.COLUMN_NAME,'P',null) as PK,tc.NULLABLE,
       tc.NUM_NULLS ,tcs.NUM_DISTINCT,tcs.HISTOGRAM,tcs.LAST_ANALYZED
from user_tab_columns tc
join USER_TAB_COL_STATISTICS tcs
on tc.TABLE_NAME=tcs.TABLE_NAME and tc.COLUMN_NAME=tcs.COLUMN_NAME
left join
(
select TABLE_NAME,COLUMN_NAME from user_ind_columns where INDEX_NAME in (
select INDEX_NAME from user_constraints where CONSTRAINT_TYPE='P' and TABLE_NAME=upper('&1'))
) ppk
on tc.TABLE_NAME=ppk.TABLE_NAME and tc.COLUMN_NAME=ppk.COLUMN_NAME
where tc.TABLE_NAME=upper('&1')
 order by 3;
