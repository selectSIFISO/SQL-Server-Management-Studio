SELECT 	
	SUBSTRING(CONVERT(VARCHAR(11), pol.[RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
	--,[PolicyKey]
	--,pol.[IsActiveRecord]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[ProductCode] [Policy Type]
    ,[EnglishProductCodeDescription] [Policy Type Description]
	into ##mar_2015
	--into ##mar_2014_prep
  FROM [CG_P_DB_DATEDW].[DIM].[POLICY] pol 
  INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] P
  ON p.ProductKey = pol.ProductKey
   where pol.[RecordEffectiveStartDate] between '1 mar 2015' and '31 mar 2015'
   --where pol.[RecordEffectiveStartDate] < '1 mar 2014'
   --and pol.[RecordEffectiveEndDate] > '1 mar 2014'
  and pol.[PercentIncrease] <> 0
  and pol.PolicyStatusKey in (2,11,32)
  --order by [PolicyNumber]
  --(5346117 row(s) affected)
