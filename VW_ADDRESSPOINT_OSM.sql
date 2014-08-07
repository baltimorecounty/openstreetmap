SELECT 
ADP.SHAPE,
AD.OBJECTID,
AD.ADDRESS_ID,
ADP.ADDRPT_ID,
ADP.TAXACCTID,
AD.TAXACCTID AS ADDRESS_TAXACCTID,
AD.ST_NUMBER,
AD.ST_NUMSUFFIX,
DECODE(SN.ST_PREMOD, '1', 'OLD', '2', 'NEW') AS ST_PREMOD,
SN.ST_PREFIXDIR,
SN.ST_PREFIXTYPE,
SN.ST_NAME,
SN.ST_TYPE,
SN.ST_SUFFIXDIR,
DECODE(SN.ST_POSTMOD, '1', 'EXTENDED') AS ST_POSTMOD,
TRIM(CONCAT(AD.ST_NUMBER || ' ',
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
              CONCAT(TRIM(AD.ST_NUMSUFFIX) ||' ',TRIM(DECODE(SN.ST_PREMOD, '1', 'OLD', '2', 'NEW')))
              ) || ' ',TRIM(SN.ST_PREFIXDIR)
             )
            ) || ' ',TRIM(SN.ST_PREFIXTYPE)
           )
          ) || ' ',TRIM(SN.ST_NAME)
         )
        ) || ' ',TRIM(SN.ST_TYPE)
       )
      ) || ' ',TRIM(SN.ST_SUFFIXDIR)
     )
    ) || ' ',TRIM(DECODE(SN.ST_POSTMOD, '1', 'EXTENDED'))
   )
  )
)
)ADDRLABEL,
AD.STATE,
Communityname.COUNTY_PREF,
Communityname.POSTAL_PREF AS CITY_POSTAL,
AD.ZIP,
AD.ZIP4,
DECODE(AD.STATUS, 'A', 'ACTIVE',
                                                                                'I', 'INACTIVE',
                                                                                'U', 'UNKNOWN') AS STATUS,
DECODE(AD.ADDRESSUSE, '2010', 'COMMERCIAL',
                '2020', 'INSTITUTIONAL',
                '2001', 'RESIDENTIAL LOW DENSITY',
                '2002', 'RESIDENTIAL HIGH DENSITY',
                '2030', 'BUSINESS',
                '2040', 'INDUSTRIAL',
                '2099', 'OTHER',
                '2097', 'PRIVATE VACANT',
                '2098', 'PUBLIC VACANT',
                '2715', 'STORM WATER MANAGEMENT',
                '2900', 'INFRASTRUCTURE') AS ADDRESSUSE,
DECODE(ADP.BLDG_CODE, '2010', 'COMMERCIAL',
                '2020', 'INSTITUTIONAL',
                '2001', 'RESIDENTIAL LOW DENSITY',
                '2002', 'RESIDENTIAL HIGH DENSITY',
                '2030', 'BUSINESS',
                '2040', 'INDUSTRIAL',
                '9999', 'UNDER CONSTRUCTION',
                '2099', 'OTHER',
                '2097', 'PRIVATE VACANT',
                '2098', 'PUBLIC VACANT',
                '2715', 'STORM WATER MANAGEMENT',
                '2900', 'INFRASTRUCTURE') AS BLDG_CODE,
ADP.ADC,
ADP.ADC_NEW,
ADP.COUNCILMANIC_DISTRICT,
ADP.ELECTION_DISTRICT,
ADP.FIREBOX,
ADP.POL_RPTAREA,
ADP.LATITUDE,
ADP.LONGITUDE,
AD.PARENT_ID,
AD.STNAME_ID,
ADP.PIN,
ADP.VERIFICATION
FROM AddressPoint ADP,Address AD,StreetName SN,CommunityName
WHERE ADP.ADDRPT_ID (+) = AD.ADDRPT_ID
AND SN.STNAME_ID = AD.STNAME_ID
AND AD.ZIP = Communityname.ZIPCODE (+);
