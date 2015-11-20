@set
select TABLE_NAME ,listagg(COLUMN_NAME,',') WITHIN GROUP (order by COLUMN_ID) as INSCOLUMNS from user_tab_columns where table_name = upper('&1') group by TABLE_NAME;
