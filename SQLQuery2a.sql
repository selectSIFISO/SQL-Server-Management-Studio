SELECT 
	p.[PolicyNumber] 
	,SUBSTRING(CONVERT(VARCHAR(11), p.[RecordEffectiveendDate], 113), 4, 8) AS [Mon YYYY]
		,p.MasterContract		
		,[ProductCode] [Policy Type]
		,[EnglishProductCodeDescription] [Policy Type Description]
		,count(*)
  FROM [CG_P_DB_DATEDW].[DIM].[POLICY] p
  INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] Pr
	ON pr.ProductKey = p.ProductKey
	where PolicyStatusKey=7
	group by p.[PolicyNumber] 
	,SUBSTRING(CONVERT(VARCHAR(11), p.[RecordEffectiveendDate], 113), 4, 8)
		,p.MasterContract		
		,[ProductCode]
		,[EnglishProductCodeDescription]  
  --and [PolicyNumber]='12020617'