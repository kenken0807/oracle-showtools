@set
select INDEX_NAME ,listagg(COLUMN_NAME,',') WITHIN GROUP (order by COLUMN_POSITION) as IND_COLUMNS from user_ind_columns where table_name = upper('&1') group by INDEX_NAME;
