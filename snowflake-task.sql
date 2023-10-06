CREATE TASK delete_old_audit_events
WAREHOUSE = ocm_dwaas
SCHEDULE = 'USING CRON 0 0 * * * UTC';
AS 
DELETE 
FROM ocm_domain_db.logged_actions
WHERE to_date(action_timestamp_tx) < current_date()-2555;
