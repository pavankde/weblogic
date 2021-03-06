SET SERVEROUTPUT ON;

DECLARE
 vCtr     Number;
 vSQL     VARCHAR2(1000); 
 vcurrSchema VARCHAR2(256);
BEGIN

  SELECT sys_context( 'userenv', 'current_schema' ) into vcurrSchema from dual;
  dbms_output.put_line('Current Schema: '||vcurrSchema);

  SELECT COUNT(*)  
    INTO vCtr  
    FROM user_tables  
    WHERE table_name = 'WLS_HVST';
 
  IF vCtr = 0 THEN
    dbms_output.put_line('Creating WLS_HVST table');
    vSQL := 'CREATE TABLE "WLS_HVST"
    (	
      "RECORDID" NUMBER(20,0) NOT NULL, 
      "TIMESTAMP" NUMBER(20,0) DEFAULT NULL, 
      "DOMAIN" VARCHAR2(250 BYTE) DEFAULT NULL, 
      "SERVER" VARCHAR2(250 BYTE) DEFAULT NULL, 
      "TYPE" VARCHAR2(250 BYTE) DEFAULT NULL, 
      "NAME" VARCHAR2(500 BYTE) DEFAULT NULL, 
      "ATTRNAME" VARCHAR2(250 BYTE) DEFAULT NULL, 
      "ATTRTYPE" NUMBER(10,0) DEFAULT NULL, 
      "ATTRVALUE" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "WLDFMODULE" VARCHAR2(250 BYTE) DEFAULT NULL,
      "PARTITION_ID" VARCHAR2(250 BYTE) DEFAULT NULL,
      "PARTITION_NAME" VARCHAR2(250 BYTE) DEFAULT NULL
    )';  
   EXECUTE IMMEDIATE vSQL;   
   vSQL := 'CREATE UNIQUE INDEX WLS_HVST_RECORD_IDX ON WLS_HVST(RECORDID)';
   EXECUTE IMMEDIATE vSQL;
   vSQL := 'CREATE INDEX WLS_HVST_TS_IDX ON WLS_HVST(TIMESTAMP)';
   EXECUTE IMMEDIATE vSQL;
  END IF;

  -- Check for WLDFMODULE column and add if necessary
  SELECT COUNT(*)
    INTO vCtr FROM user_tab_columns
    WHERE table_name = 'WLS_HVST' AND column_name = 'WLDFMODULE';
  IF vCtr = 0 THEN
    dbms_output.put_line('Creating WLDFMODULE column in WLS_HVST table');
    vSQL := 'ALTER TABLE WLS_HVST ADD("WLDFMODULE" VARCHAR2(250 BYTE) DEFAULT NULL)';
    EXECUTE IMMEDIATE vSQL;  
  END IF;
  
  -- Check for PARTITION_ID column and add if necessary (12.2.1)
  SELECT COUNT(*)
    INTO vCtr FROM user_tab_columns
    WHERE table_name = 'WLS_HVST' AND column_name = 'PARTITION_ID';
  IF vCtr = 0 THEN
    dbms_output.put_line('Creating PARTITION_ID column in WLS_HVST table');
    vSQL := 'ALTER TABLE WLS_HVST ADD("PARTITION_ID" VARCHAR2(250 BYTE) DEFAULT NULL)';
    EXECUTE IMMEDIATE vSQL;  
  END IF;
  
  -- Check for PARTITION_NAME column and add if necessary (12.2.1)
  SELECT COUNT(*)
    INTO vCtr FROM user_tab_columns
    WHERE table_name = 'WLS_HVST' AND column_name = 'PARTITION_NAME';
  IF vCtr = 0 THEN
    dbms_output.put_line('Creating PARTITION_NAME column in WLS_HVST table');
    vSQL := 'ALTER TABLE WLS_HVST ADD("PARTITION_NAME" VARCHAR2(250 BYTE) DEFAULT NULL)';
    EXECUTE IMMEDIATE vSQL;  
  END IF;
  
  vSQL := 'ALTER TABLE WLS_HVST MODIFY("NAME" VARCHAR2(500 BYTE) DEFAULT NULL)';
  EXECUTE IMMEDIATE vSQL;  

  -- create auto-index sequence if necessary
  SELECT COUNT(*) INTO vCtr FROM user_sequences
  WHERE sequence_name = 'SEQ_WLS_HVST_RECORDID';
  IF vCtr = 0 THEN
    vSQL := 'CREATE SEQUENCE SEQ_WLS_HVST_RECORDID MINVALUE 1 MAXVALUE 99999999999999999999 START WITH 1 INCREMENT BY 1 NOCACHE';
    EXECUTE IMMEDIATE vSQL;
  END IF;

  -- create index trigger if necessary 
  SELECT COUNT(*) INTO vCtr FROM user_triggers
  WHERE table_name = 'WLS_HVST';
  IF vCtr = 0 THEN  
    vSQL := 'CREATE OR REPLACE TRIGGER TRG_WLS_HVST_INSERT 
    BEFORE INSERT ON WLS_HVST 
    REFERENCING NEW AS newRow 
    FOR EACH ROW 
    BEGIN 
      IF :newRow.RECORDID IS NULL THEN 
        SELECT SEQ_WLS_HVST_RECORDID.nextval INTO :newRow.RECORDID FROM DUAL; 
      END IF; 
    END;';
    EXECUTE IMMEDIATE vSQL;    
  END IF;  
    
END;
/
