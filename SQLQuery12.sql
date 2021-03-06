SELECT 
--TOP 1000 [PolicyMovementStatusKey]
      --,[PS_AutoKey]
      --,[RE_AutoKey]
	  --[PolicyNumber]
	  SUBSTRING(CONVERT(VARCHAR(11), d.FullDate, 113), 4, 8) AS [Mon YYYY]
	  ,pol.MasterContract	
	  ,[ProductCode] [Policy Type]
		,[EnglishProductCodeDescription] [Policy Type Description]
      --,[InsertAuditkey]
      --,[RecordUser]
      --,[TriggerAction]
      --,[TriggerActionLineNumber]
      --,[TriggerID]
      --,[InstanceCount]
      --,[PolicyStatusKey]
      --,a.[PolicyKey]
      --,[ActionDateKey]
	  --,d.FullDate	  
      --,[EffectiveDateKey]
      --,[TriggerDateKey]
	  ,count(*)
  FROM [CG_P_DB_DATEDW].[FACT].[POLICYSTATUSMOVEMENT] a
  inner join [CG_P_DB_DATEDW].DIM.Date d
  on a.ActionDateKey = d.DateKey
  inner join [CG_P_DB_DATEDW].[DIM].[POLICY] pol
  on pol.PolicyKey = a.PolicyKey
  INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] Pr
	ON pr.ProductKey = pol.ProductKey
  where a.[PolicyStatusKey] = 7
  and d.FullDate > '31 mar 2014'
  --and [PolicyNumber]='1000004439'
  --where PolicyKey=4355
  --order by d.FullDate
  group by SUBSTRING(CONVERT(VARCHAR(11), d.FullDate, 113), 4, 8)
  ,pol.MasterContract	
	  ,[ProductCode]
		,[EnglishProductCodeDescription]
      --,a.[PolicyKey]
      