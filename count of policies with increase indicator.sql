--(10348474 row(s) affected)
SELECT DISTINCT
[Mon YYYY]
	--,[PolicyKey]
	--,[PolicyNumber]
	--,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
	,count(*)
FROM
(
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar_2014_prep
  union
  
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar_2014
  union

SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##Apr2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##apr_2014

  union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##may2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##may_2014


    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jun2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jun_2014


    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jul2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jul_2014

    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##aug2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##aug_2014

    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##sep2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##sep_2014

    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##oct2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##oct_2014


    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##nov2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##nov_2014

    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##dec2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##dec_2014

    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jan2015_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jan_2015


    union
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

    union
  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar2015_Final 

  union

  SELECT 	
	[Mon YYYY]
	--,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar_2015
  )k
  --order by [PolicyNumber]
group by [Mon YYYY]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]