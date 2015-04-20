select 
	'Mar 2015' [Mon YYYY]
	--,m.[PolicyKey]
	,m.[PolicyNumber]
	,m.[PercentIncrease]
	,m.[MasterContract] 
	,m.[Policy Type]
    ,m.[Policy Type Description]
	into ##mar2015_Final
	--drop table ##mar2015_Final
from (
	SELECT 
		--[Mon YYYY]
		--[PolicyKey]
		[PolicyNumber]
		,[PercentIncrease]
		,[MasterContract] 
		,[Policy Type]
		,[Policy Type Description]	
	from (
		(
			SELECT 	
			[Mon YYYY]
			--,[PolicyKey]
			,[PolicyNumber]
			,[PercentIncrease]
			,[MasterContract] 
			,[Policy Type]
			,[Policy Type Description]
		  FROM ##feb2015_Final	
			union
		  SELECT 	
			[Mon YYYY]
			--,[PolicyKey]
			,[PolicyNumber]
			,[PercentIncrease]
			,[MasterContract] 
			,[Policy Type]
			,[Policy Type Description]
		  FROM ##feb_2015
		)
	) z
  except
  SELECT 	
	--[Mon YYYY]
	--[PolicyKey]
	[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar_2015
  --order by 2
  --##Mar_2014 
  )m
--inner join ##apr_2014 m
--on k.[PolicyNumber] = m.[PolicyNumber]
--and k.[Policy Type] = m.[Policy Type]
--  --(52234 row(s) affected)

  --(50322 row(s) affected)

  --(50320 row(s) affected)