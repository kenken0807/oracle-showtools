@set
set long 100000
select dbms_metadata.get_ddl(upper('&1'),upper('&2')) as show_create from dual;
