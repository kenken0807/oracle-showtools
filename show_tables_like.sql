@set
select table_name from user_tables where table_name like upper('&1') order by 1;
