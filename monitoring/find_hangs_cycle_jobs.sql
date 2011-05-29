SELECT *
FROM kalturadw_ds.cycles
WHERE  (STATUS IN ('GENERATED','PROCESSED') AND insert_time < NOW() - INTERVAL 1 DAY)
 OR 
 (STATUS = 'RUNNING' AND run_time < NOW() - INTERVAL 1 HOUR)
 OR 
 (STATUS = 'TRANSFERING' AND transfer_time < NOW() - INTERVAL 2 HOUR)
 OR 
 STATUS NOT IN ('DONE', 'GENERATED', 'PROCESSED', 'RUNNING', 'TRANSFERRING', 'DELETED', 'SPOOF_CYCLE')