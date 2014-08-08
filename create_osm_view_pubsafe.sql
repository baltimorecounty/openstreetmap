DROP VIEW VW_ADDRESS_OSM;
DROP MATERIALIZED VIEW VW_ADDRESS_OSM;
CREATE MATERIALIZED VIEW VW_ADDRESS_OSM
AS
SELECT
ADP.SHAPE,
AD.OBJECTID,
TRIM(CONCAT(AD.ST_NUMBER || ' ',(TRIM(AD.ST_NUMSUFFIX)))) as ADDR_HOUSENUMBER,
TRIM(
  CONCAT(
   TRIM(
    CONCAT(
     TRIM(
      CONCAT(
       TRIM(
        CONCAT(
        TRIM(
          CONCAT(
           TRIM(
            CONCAT(
             TRIM(
              DECODE(SN.ST_PREMOD, '1', 'OLD', '2', 'NEW')
              ) || ' ',TRIM(
                        DECODE(SN.ST_PREFIXDIR,
                        'E','East',
                        'N','North',
                        'S','South',
                        'W','West')
              )
             )
            ) || ' ',TRIM(SN.ST_PREFIXTYPE)
           )
          ) || ' ',TRIM(
                    CASE
                     WHEN SN.ST_NAME LIKE 'MCA%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mca','McA')
                     WHEN SN.ST_NAME LIKE 'MCB%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcb','Mcb')
                     WHEN SN.ST_NAME LIKE 'MCC%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcc','McC')
                     WHEN SN.ST_NAME LIKE 'MCD%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcd','McD')
                     WHEN SN.ST_NAME LIKE 'MCE%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mce','McE')
                     WHEN SN.ST_NAME LIKE 'MCF%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcf','McF')
                     WHEN SN.ST_NAME LIKE 'MCG%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcg','McG')
                     WHEN SN.ST_NAME LIKE 'MCH%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mch','McH')
                     WHEN SN.ST_NAME LIKE 'MCI%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mci','McI')
                     WHEN SN.ST_NAME LIKE 'MCJ%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcj','McJ')
                     WHEN SN.ST_NAME LIKE 'MCK%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mck','McK')
                     WHEN SN.ST_NAME LIKE 'MCL%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcl','McL')
                     WHEN SN.ST_NAME LIKE 'MCM%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcm','McM')
                     WHEN SN.ST_NAME LIKE 'MCN%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcn','McN')
                     WHEN SN.ST_NAME LIKE 'MCO%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mco','McO')
                     WHEN SN.ST_NAME LIKE 'MCP%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcp','McP')
                     WHEN SN.ST_NAME LIKE 'MCQ%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcq','McQ')
                     WHEN SN.ST_NAME LIKE 'MCR%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcr','McR')
                     WHEN SN.ST_NAME LIKE 'MCS%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcs','McS')
                     WHEN SN.ST_NAME LIKE 'MCT%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mct','McT')
                     WHEN SN.ST_NAME LIKE 'MCU%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcu','McU')
                     WHEN SN.ST_NAME LIKE 'MCV%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcv','McV')
                     WHEN SN.ST_NAME LIKE 'MCW%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcw','McW')
                     WHEN SN.ST_NAME LIKE 'MCX%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcx','McX')
                     WHEN SN.ST_NAME LIKE 'MCY%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcy','McY')
                     WHEN SN.ST_NAME LIKE 'MCZ%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mcz','McZ')
                     WHEN SN.ST_NAME LIKE 'LHIR%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Lhir','LHir')
                     WHEN SN.ST_NAME LIKE 'MLAD%' THEN
                      REPLACE(INITCAP(SN.ST_NAME),'Mlad','MLad')
                     ELSE INITCAP(SN.ST_NAME)
                    END
                    )
         )
        ) || ' ',TRIM(INITCAP(
                  DECODE(SN.ST_TYPE,
                  'ALY','ALLEY',
                  'AVE','AVENUE',
                  'BLVD','BOULEVARD',
                  'BRG','BRIDGE',
                  'CIR','CIRCLE',
                  'CMN','COMMON',
                  'CT','COURT',
                  'CTR','CENTER',
                  'DR','DRIVE',
                  'DRWY','DRIVEWAY',
                  'EXPY','EXPRESSWAY',
                  'GRN','GREEN',
                  'GRTH','GARTH',
                  'HWY','HIGHWAY',
                  'LN','LANE',
                  'LOOP','LOOP',
                  'MALL','MALL',
                  'MEWS','MEWS',
                  'PARK','PARK',
                  'PATH','PATH',
                  'PIKE','PIKE',
                  'PKWY','PARKWAY',
                  'PLZ','PLAZA',
                  'RD','ROAD',
                  'ROW','ROW',
                  'SQ','SQUARE',
                  'ST','STREET',
                  'TER','TERRACE',
                  'TRL','TRAIL',
                  'WALK','WALK',
                  'WAY','WAY',
                  'PL','PLACE')
                 ))
       )
      ) || ' ',TRIM(
                DECODE(SN.ST_SUFFIXDIR,
                'E','East',
                'N','North',
                'S','South',
                'W','West')
      )
     )
    ) || ' ',TRIM(DECODE(SN.ST_POSTMOD, '1', 'EXTENDED'))
   )
  ) AS ADDR_STREET,
AD.STATE AS ADDR_STATE,
INITCAP(Communityname.COUNTY_PREF) AS ADDR_CITY,
AD.ZIP AS ADDR_POSTAL
FROM AddressPoint ADP,Address AD,StreetName SN,CommunityName
WHERE ADP.ADDRPT_ID (+) = AD.ADDRPT_ID
AND SN.STNAME_ID = AD.STNAME_ID
AND AD.ZIP = Communityname.ZIPCODE (+)
AND AD.STATUS = 'A'
AND AD.ST_NUMBER != 0;

CREATE INDEX IDX_VW_ADDRESS_OSM_SHP ON VW_ADDRESS_OSM(SHAPE);
CREATE INDEX IDX_VW_ADDRESS_OSM_OID ON VW_ADDRESS_OSM(OBJECTID);

quit;
