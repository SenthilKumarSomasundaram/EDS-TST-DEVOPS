USE DATABASE DEV_TPTY_DB;
USE SCHEMA OTHER_TPTY;

-- LIST @OFAC_EXTRACT_STAGE

-- Create External table for SDN
CREATE OR REPLACE EXTERNAL TABLE CICD_ignore_OFAC_ETAB_LND_SDN(
        ENT_NUM 	VARCHAR AS decode((value:c1::varchar),'\u001a',null,(value:c1::varchar)),
        SDN_NAME 	VARCHAR AS decode((value:c2::varchar),'-0- ',null,(value:c2::varchar)),
        SDN_TYPE 	VARCHAR AS decode((value:c3::varchar),'-0- ',null,(value:c3::varchar)),
        PROGRAM 	VARCHAR AS decode((value:c4::varchar),'-0- ',null,(value:c4::varchar)),
        TITLE 		VARCHAR AS decode((value:c5::varchar),'-0- ',null,(value:c5::varchar)),
        CALL_SIGN 	VARCHAR AS decode((value:c6::varchar),'-0- ',null,(value:c6::varchar)),
        VESS_TYPE 	VARCHAR AS decode((value:c7::varchar),'-0- ',null,(value:c7::varchar)),
        TONNAGE 	VARCHAR AS decode((value:c8::varchar),'-0- ',null,(value:c8::varchar)),
        GRT 		VARCHAR AS decode((value:c9::varchar),'-0- ',null,(value:c9::varchar)),
        VESS_FLAG 	VARCHAR AS decode((value:c10::varchar),'-0- ',null,(value:c10::varchar)),
        VESS_OWNER 	VARCHAR AS decode((value:c11::varchar),'-0- ',null,(value:c11::varchar)),
        REMARKS 	VARCHAR AS decode((value:c12::varchar),'-0- ',null,(value:c12::varchar)),
        CREATED_DATE	VARCHAR AS decode((value:c13::varchar),'-0- ',null,(value:c13::varchar))
)
  LOCATION=@OFAC_EXTRACT_STAGE/incr/data/ 
  PATTERN='.*sdn.*.csv'
  FILE_FORMAT = (FORMAT_NAME = OFAC_EXTRACT_FORMAT TYPE = CSV)
  AUTO_REFRESH = TRUE;
  