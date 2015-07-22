SELECT TOP 1000
  FClaim.[ClaimFactKey]
  ,ClaSta1.[ClaimStatusDescription] [Latest Claim Status]
  ,FClaim.[ClaimEventReferenceNumber] [Claim Reference Number]
  ,CSH.[CreatedTimestamp] [Claim Status History Date]
  ,C.[ProductCode]
  ,C.[CreatedBy] [Agent Name]
  ,C.[PlanDescription] [Policy Plan Description]
  ,ClaTyp.[ClaimTypeDescription] [Claim Type]
  ,FClaim.[ClaimValue] [Value]
  ,ClaSta.[ClaimStatusDescription] [Status of Claim]
  ,ClaTyp.[ClaimCategoryDescription] [Portfolio]
  ,FClaim.[PolicyNumber]
  ,FClaim.[ClaimNumber]  
  ,FClaim.[TotalSumAssured]
FROM [CG_P_DB_DATEDW].[FACT].[Claim] FClaim
INNER JOIN [CG_P_DB_DATEDW].[DIM].[ClaimType] ClaTyp
  ON ClaTyp.[ClaimTypeKey] = FClaim.[ClaimTypeKey]
INNER JOIN [CG_P_DB_CLAIMS].[dbo].[Claim] C
  ON C.id = FClaim.[ClaimFactID_Source]
INNER JOIN [CG_P_DB_CLAIMS].[dbo].[ClaimStatusHistory] CSH
  ON CSH.[Claim_Id] = FClaim.[ClaimFactID_Source]
INNER JOIN [CG_P_DB_DATEDW].[DIM].[ClaimStatus] ClaSta
  ON ClaSta.[ClaimStatusID_Source] = CSH.[StatusId]
LEFT JOIN [CG_P_DB_DATEDW].[DIM].[ClaimStatus] ClaSta1
  ON ClaSta1.[ClaimStatusKey] = FClaim.[LatestClaimStatusKey]
--WHERE FClaim.[ClaimEventReferenceNumber]='S0005161'
where year(CSH.[CreatedTimestamp]) > 2014 
and C.[CreatedBy] <> 'Clientele\MigrationUser'
ORDER BY FClaim.[ClaimEventReferenceNumber],FClaim.[ClaimFactKey],FClaim.[LatestClaimStatusKey]