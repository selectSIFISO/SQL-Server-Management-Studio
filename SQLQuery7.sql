SELECT
	m.[PolicyKey]
	  ,m.[PolicyNumber]
      ,m.[PercentIncrease]
	  ,m.[RecordEffectiveStartDate]
	  ,m.[IsActiveRecord] 
	  ,[MasterContract]
	  ,m.[ProductKey]
	  ,[ProductCode]
      ,[EnglishProductCodeDescription]
FROM (
SELECT 
	--a.[PolicyKey]
	--a.[PolicyNumber]
      --,a.[PercentIncrease]
	  --,a.[RecordEffectiveEndDate] [Start Date]
	  --,a.[IsActiveRecord]
	  b.[PolicyKey]
	  ,b.[PolicyNumber]
      ,b.[PercentIncrease]
	  ,b.[RecordEffectiveStartDate]
	  ,b.[IsActiveRecord] 
	  ,b.[MasterContract]
	  ,b.[ProductKey]
	  --[IsActiveRecord]
  FROM [CG_P_DB_DATEDW].[DIM].[POLICY] A
  inner join [CG_P_DB_DATEDW].[DIM].[POLICY] b
  on a.[PolicyNumber] = b.[PolicyNumber]
  and a.[ProductKey] = b.[ProductKey]
  and a.[PercentIncrease] != b.[PercentIncrease]
  --where a.[RecordEffectiveStartDate] between '1 feb 2015' and '28 feb 2015'
  
  --where a.[PolicyNumber]='950450521'
  )m
  INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] P
  ON p.ProductKey = m.ProductKey
  where m.IsActiveRecord = 1


  ORDER BY [PolicyNumber]

  --Month Year  - last 12 months
  --per master contract
  --desc of master constract
  --Count begin
  --count end