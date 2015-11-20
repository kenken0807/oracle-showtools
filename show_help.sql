@set
select '@show_tables' as command ,'none' as opt,'List the tables in the schema' as describe from dual
union all
select '@show_tables_like' as command ,'[table name] or wildcard % ' as opt,'List the tables in the schema by the LIKE clause' as describe from dual
union all
select '@show_create' as command ,'[index | table] [index name | table name]' as opt,'Shows the CREATE TABLE or INDEX statement' as describe from dual
union all
select '@show_index_from' as command ,'[table name]' as opt,'List index columns of the table' as describe from dual
union all
select '@show_index_status' as command ,'[index name]' as opt,'Shows index information' as describe from dual
union all
select '@show_table_status' as command ,'[table name]' as opt,'Shows table information' as describe from dual
union all
select '@show_table_hist' as command ,'[table name] [column name]' as opt,'Shows histogram information that the column has' as describe from dual
union all
select '@show_insert_table_cols' as command ,'[table name]' as opt,'Shows all columns in a comma-separated that the table has' as describe from dual;
