@echo WELCOME to DO BACKUP TOOL fitpos_db
mysqldump -u root -h localhost -padmin fitpos_db --routines > fitpos_db.sql 
@PAUSE