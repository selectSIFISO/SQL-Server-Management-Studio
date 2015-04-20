SELECT 
	--a.[PolicyKey]
	a.[PolicyNumber]
      ,a.[PercentIncrease]
	  ,a.[RecordEffectiveEndDate] 
	  ,a.[IsActiveRecord]
	  --b.[PolicyKey]
	  ,b.[PolicyNumber]
      ,b.[PercentIncrease]
	  ,b.[RecordEffectiveEndDate]
	  ,b.[IsActiveRecord] 
	  --[IsActiveRecord]
  FROM [CG_P_DB_DATEDW].[DIM].[POLICY] A
  inner join [CG_P_DB_DATEDW].[DIM].[POLICY] b
  on a.[PolicyNumber] = b.[PolicyNumber]
  and a.[PercentIncrease] <> b.[PercentIncrease]
  --where a.[RecordEffectiveStartDate] between '1 feb 2015' and '28 feb 2015'
  order by a.[PolicyNumber]