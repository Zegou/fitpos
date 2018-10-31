@color 2
@echo WELCOME to BACKUP TOOL fit_db
@echo **********************************************

mysql -h localhost -u root -p  fitpos_db < fitpos_db.sql

@pause