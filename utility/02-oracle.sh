./runInstaller -executePrereqs -silent -responseFile /u01/app/oracle/product/19.0.0/dbhome_1/install/response/db_install.rsp \
  oracle.install.option=INSTALL_DB_SWONLY \
  UNIX_GROUP_NAME=oinstall \
  INVENTORY_LOCATION=/u01/app/oraInventory \
  ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1 \
  ORACLE_BASE=/u01/app/oracle \
  oracle.install.db.InstallEdition=EE \
  oracle.install.db.OSDBA_GROUP=oinstall \
  oracle.install.db.OSOPER_GROUP=oinstall \
  oracle.install.db.OSBACKUPDBA_GROUP=oinstall \
  oracle.install.db.OSDGDBA_GROUP=oinstall \
  oracle.install.db.OSKMDBA_GROUP=oinstall \
  oracle.install.db.OSRACDBA_GROUP=oinstall 



