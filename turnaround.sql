/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 Enc.[EncashmentsFactKey]
      ,Enc.[EncashmentValueRequestFactKey]
      ,EncStat.[EncashmentStatusTypeDescription]
      ,Enc.[EncashmentKey]
      ,Enc.[EncashmentCreatedByUserKey]
      ,Enc.[EncashmentStatusTypeKey]
      ,Enc.[EncashmentReasonTypeKey]
      ,Enc.[PolicyKey]
      ,Enc.[Amount]
      ,Enc.[CreatedTimestamp]
  FROM [CG_D_DB_DATEDW].[FACT].[Encashments] Enc
  INNER JOIN [CG_D_DB_DATEDW].[DIM].[EncashmentStatusType] EncStat
  ON Enc.[EncashmentStatusTypeKey] = EncStat.[EncashmentStatusTypeKey]

  --ui_ch