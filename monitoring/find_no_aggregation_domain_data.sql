SELECT 'Domain aggregation did not enter any new data' stat, (DATE(NOW())-INTERVAL 2 DAY)*1 DAY
FROM kalturadw.dwh_hourly_events_domain
WHERE date_id = (DATE(NOW())-INTERVAL 2 DAY)*1
HAVING COUNT(*)  = 0