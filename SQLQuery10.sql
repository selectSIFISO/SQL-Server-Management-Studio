
--1000003044

--SELECT 
--	a.[PolicyNumber]     
--  FROM [CG_P_DB_DATEDW].[DIM].[POLICY] A 
--  where /*[IsActiveRecord] = 0
--  and*/ [PercentIncrease]<>0
--  and [PolicyNumber] in (

--SELECT 
--	a.[PolicyNumber]     
--  FROM [CG_P_DB_DATEDW].[DIM].[POLICY] A 
--  where /*[IsActiveRecord] = 1
--  and*/ [PercentIncrease]=0
  
--  )


  SELECT 
	--a.[AutoKey]
	--,SUBSTRING(CONVERT(VARCHAR(11), a.[RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
	--a.[ProductKey]
	a.[PolicyNumber]
	--,pol.[PolicyKey]
      ,a.[PercentIncrease]
	  --,a.PercentIncrease_Changed
	--  ,a.[MasterContract] 
	--,[ProductCode] [Policy Type]
 --   ,[EnglishProductCodeDescription] [Policy Type Description]
	  --,a.[RecordEffectiveEndDate] [Start Date]
	  --,a.[IsActiveRecord]
	  --,b.[PolicyKey]
	  ,b.[AutoKey]
	  --,SUBSTRING(CONVERT(VARCHAR(11), pol.[RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
	  ,b.[PolicyNumber]	  
      ,b.[PercentIncrease]
    --,b.PercentIncrease_Changed
	--,b.[MasterContract] 
	--,[ProductCode] [Policy Type]
 --   ,[EnglishProductCodeDescription] [Policy Type Description]
	  --,b.[RecordEffectiveStartDate]
	  --,b.[IsActiveRecord] 
	  --,b.[MasterContract]
	  --,b.[ProductKey]
	  --[IsActiveRecord]
  FROM [CG_P_DB_DATSTA].[STA].[d3_keydet] A
  inner join [CG_P_DB_DATSTA].[STA].[d3_keydet] b
  on a.[PolicyNumber] = b.[PolicyNumber]
  --and a.[ProductKey] = b.[ProductKey]
  --  and a.[MasterContract] = b.[MasterContract]
  and a.[PercentIncrease] != b.[PercentIncrease]
  inner join [CG_P_DB_DATEDW].[DIM].[POLICY] pol
  on pol.PolicyNumber = a.PolicyNumber
  and (pol.KeyDet_SourceAutokey = a.AutoKey OR pol.KeyDet_SourceAutokey = b.AutoKey)
  --INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] P
  --ON p.ProductKey = pol.ProductKey
  where b.PercentIncrease_Changed=1 and b.[PercentIncrease]=0
   and a.[PercentIncrease]>0
  order by a.[PolicyNumber]

  --(12008 row(s) affected)
  --(3955 row(s) affected)

