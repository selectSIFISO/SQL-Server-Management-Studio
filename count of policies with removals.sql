SELECT
SUBSTRING(CONVERT(VARCHAR(11), pol.[RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
--,[To PolicyNumber]  [PolicyNumber] 
,pol.[MasterContract] 	        
   --   ,[From PercentIncrease]
	  --,[To PercentIncrease]
	  	,[ProductCode] [Policy Type]
    ,[EnglishProductCodeDescription] [Policy Type Description]
	,count(*)
FROM (
  SELECT distinct
	a.[PolicyNumber] [From PolicyNumber]
      ,a.[PercentIncrease] [From PercentIncrease]
	  ,b.[AutoKey]
	  ,b.[PolicyNumber]	  [To PolicyNumber]
      ,b.[PercentIncrease] [To PercentIncrease]
  FROM [CG_P_DB_DATSTA].[STA].[d3_keydet] A
  inner join [CG_P_DB_DATSTA].[STA].[d3_keydet] b
  on a.[PolicyNumber] = b.[PolicyNumber]
  and a.[PercentIncrease] != b.[PercentIncrease]
  inner join [CG_P_DB_DATEDW].[DIM].[POLICY] pol
  on pol.PolicyNumber = a.PolicyNumber
  and (pol.KeyDet_SourceAutokey = a.AutoKey OR pol.KeyDet_SourceAutokey = b.AutoKey)
  where b.PercentIncrease_Changed=1 and b.[PercentIncrease]=0
   and a.[PercentIncrease]>0
  --order by a.[PolicyNumber]
) k
  inner join [CG_P_DB_DATEDW].[DIM].[POLICY] pol
  on pol.KeyDet_SourceAutokey = k.[AutoKey]
    INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] P
  ON p.ProductKey = pol.ProductKey
  where pol.[RecordEffectiveStartDate] > '28 feb 2014'
  group by SUBSTRING(CONVERT(VARCHAR(11), pol.[RecordEffectiveStartDate], 113), 4, 8)
--,[To PolicyNumber] 
,pol.[MasterContract] 	        
   --   ,[From PercentIncrease]
	  --,[To PercentIncrease]
	  	,[ProductCode] 
    ,[EnglishProductCodeDescription] 
  --order by [From PolicyNumber]