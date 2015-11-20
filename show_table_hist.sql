@set
select TABLE_NAME,COLUMN_NAME,ENDPOINT_VALUE as COLUMN_VALUE ,ENDPOINT_NUMBER  from user_tab_histograms where TABLE_NAME =upper('&1') and COLUMN_NAME = upper('&2') order by COLUMN_VALUE;
