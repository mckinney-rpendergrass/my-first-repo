SELECT 
       pickitem.[SVALUE] AS METER_SIZE
      ,perm.PERMIT_NUMBER
      ,perm.WORK_CLASS
      ,perm.DESCRIPTION
      ,perm.ISSUE_DATE
      ,perm.MAIN_ADDRESS_LINE1
      ,perm.MAIN_ADDRESS_LINE2
      ,perm.MAIN_PARCEL_NUMBER
 
  FROM [GIS_Development].[dbo].[CUSTOMSAVERTBLCOL_LST] collst
  INNER JOIN vw_PERMIT perm ON collst.OBJECTID = perm.PMPERMITID
  INNER JOIN CUSTOMFIELDPICKLISTITEM pickitem ON collst.PICKLISTVALUE = pickitem.GCUSTOMFIELDPICKLISTITEM
  INNER JOIN CUSTOMFIELDPICKLIST picklist ON  pickitem.FKGCUSTOMFIELDPICKLIST = picklist.GCUSTOMFIELDPICKLIST
  INNER JOIN CUSTOMFIELD customfield ON picklist.FKGCUSTOMFIELD = customfield.GCUSTOMFIELD
  WHERE SCUSTOMFIELD = 'Meter Size' AND
        PERMIT_TYPE <> 'Structure' AND
        SVALUE NOT IN (
         '1"'
        ,'2"'
        ,'3/4"'
        ) and permit_status <> 'void'
