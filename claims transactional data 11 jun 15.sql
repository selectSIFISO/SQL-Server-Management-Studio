SELECT
  m.[Reference Number]
  ,[Latest Claim Event Status Type] [Latest Claim Status]
  ,[Intimation Method Type]
  ,[Comment]
  ,[User]
  ,ors.[Description] [Changed From Status]
  ,ors2.[Description] [Changed To Status]
  ,m.[From Date]
  ,m.[To Date]
  ,DATEDIFF(D,m.[From Date],m.[To Date]) [Total Days]
  ,DateDiff(HOUR, m.[From Date], m.[To Date]) % 24 [Total Hours]
  ,DateDiff(MINUTE, m.[From Date], m.[To Date]) % 60 [Total Mins]
  ,DateDiff(SECOND, m.[From Date], m.[To Date]) % 3600 [Total Secs]     
  ,CONVERT(VARCHAR,(DATEDIFF(D,m.[From Date],m.[To Date]))) +  ' day(s) ' + CONVERT(VARCHAR,(DateDiff(HOUR, m.[From Date], m.[To Date]) % 24)) + 'h ' + CONVERT(VARCHAR,(DateDiff(MINUTE, m.[From Date], m.[To Date]) % 60)) + 'm ' + CONVERT(VARCHAR,(DateDiff(SECOND, m.[From Date], m.[To Date]) % 3600)) + 's' [Total Duration]  
FROM
(
SELECT   
  k.[ClaimEventReferenceNumber_Number][Reference Number]
  ,k.[Latest Claim Event Status Type]
  ,k.[Intimation Method Type]
  ,k.[Comment]
  ,k.[User]
  ,LAG(k.[ActivityId], 1, null) OVER (PARTITION BY   k.[ClaimEventReferenceNumber_Number] ORDER BY   k.[CreatedTimestamp] ASC)   AS [From]
  ,k.[ActivityId] AS [To]  
  ,LAG(b.[CreatedTimestamp], 1, null) OVER (PARTITION BY   k.[ClaimEventReferenceNumber_Number] ORDER BY   b.[CreatedTimestamp] ASC)   AS [From Date]
  ,k.[CreatedTimestamp] [To Date]
FROM   (
	  SELECT [Intimation Method Type]
      ,[ClaimEventReferenceNumber_Number]
      ,[Comment]
      ,[User]
      ,[CreatedTimestamp]
      ,[Id]
      ,[Claim Event Activity Type Desc]
      ,[Latest Claim Event Status Type]
      ,[ActivityId]
  FROM [CG_D_DB_DATSTA].[dbo].[SifisoClaimsTest3]
  --order by [ClaimEventReferenceNumber_Number]
  --where [ClaimEventReferenceNumber_Number]='S0062198'
	)k
inner JOIN  [CG_D_DB_DATSTA].[dbo].[SifisoClaimsTest3] b
on k.[id] = b.[id]
)m
left join [CG_D_DB_CLAIMS].[dbo].[ClaimEventActivityType] ors
on ors.id = m.[From]
left join [CG_D_DB_CLAIMS].[dbo].[ClaimEventActivityType] ors2
on ors2.id = m.[To]
order by [Reference Number],m.[To Date]