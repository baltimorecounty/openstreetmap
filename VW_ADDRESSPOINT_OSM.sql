SELECT 
ADP.SHAPE,
AD.OBJECTID,
TRIM(CONCAT(AD.ST_NUMBER || ' ',(TRIM(AD.ST_NUMSUFFIX) ||' ')))
addr_housenumber,
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
              ) || ' ',TRIM(SN.ST_PREFIXDIR)
             )
            ) || ' ',TRIM(SN.ST_PREFIXTYPE)
           )
          ) || ' ',TRIM(SN.ST_NAME)
         )
        ) || ' ',TRIM(
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
                 )
       )
      ) || ' ',TRIM(SN.ST_SUFFIXDIR)
     )
    ) || ' ',TRIM(DECODE(SN.ST_POSTMOD, '1', 'EXTENDED'))
   )
  )
addr_street,
AD.STATE AS addr_state,
Communityname.COUNTY_PREF AS addr_city,
AD.ZIP AS addr_postal,
DECODE(AD.STATUS, 'A', 'ACTIVE',
 'I', 'INACTIVE',
 'U', 'UNKNOWN') AS STATUS
FROM AddressPoint ADP,Address AD,StreetName SN,CommunityName
WHERE ADP.ADDRPT_ID (+) = AD.ADDRPT_ID
AND SN.STNAME_ID = AD.STNAME_ID
AND AD.ZIP = Communityname.ZIPCODE (+);
