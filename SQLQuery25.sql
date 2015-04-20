SELECT
[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
FROM
(
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar_2014
  union

SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##Apr_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##apr_2014

  union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##may_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##may_2014


    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jun_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jun_2014


    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jul_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jul_2014

    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##aug_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##aug_2014

    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##sep_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##sep_2014

    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##oct_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##oct_2014


    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##nov_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##nov_2014

    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##dec_2014_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##dec_2014

    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jan_2015_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##jan_2015


    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##feb2015_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##feb2015

    union
  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar2015_Final 

  union

  SELECT 	
	[Mon YYYY]
	,[PolicyKey]
	,[PolicyNumber]
	,[PercentIncrease]
	,[MasterContract] 
	,[Policy Type]
    ,[Policy Type Description]
  FROM ##mar2015
  )k
  order by [Mon YYYY]
----(8382761 row(s) affected)
--SELECT
--z.[Date]
--	,z.[TrackingApplicableMonthKey]
--	--,z.[PolicyNumber]
--	,z.[MasterContract] 
--	,z.[Policy Type]
--    ,z.[Policy Type Description]
--	,COUNT(*) [Number of policies with an annual premium increase indicator]
--FROM (
--SELECT DISTINCT
--	SUBSTRING(CONVERT(VARCHAR(11), [FullDate], 113), 4, 8) AS [Date]
--	,[TrackingApplicableMonthKey]
--	--,[FirstMovementCaptureDateKey]
--	,k.[PolicyNumber]
--	,[MasterContract] 
--	,[ProductCode] [Policy Type]
--    ,[EnglishProductCodeDescription] [Policy Type Description]
--	--,COUNT(*) [Number of policies with an annual premium increase indicator]
--FROM
--(
--	SELECT 
--		[PolicyNumber]
--		,[ProductKey]
--		,MAX([PolicyKey]) [PolicyKey] 
--	FROM [CG_P_DB_DATEDW].[DIM].[POLICY]  
--	--WHERE [RecordEffectiveStartDate] between '1 mar 2014' and '28 mar 2014'
--	WHERE [RecordEffectiveStartDate] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-3, 0)
--	GROUP BY 
--		[PolicyNumber]
--		,[ProductKey]
--)k
--INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICY] pol
--	ON k.PolicyKey = pol.PolicyKey
--INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] P
--  ON p.ProductKey = pol.ProductKey

--INNER join [CG_P_DB_DATEDW].[FACT].[BILLINGTRANSACTION] c
--on c.PolicyKey = k.PolicyKey
--and [TrackingApplicableMonthKey] <> -1
--inner join [CG_P_DB_DATEDW].[DIM].[Date] dd
--on dd.[DateKey] = [TrackingApplicableMonthKey]
--WHERE pol.[PercentIncrease] <> 0
----and k.[PolicyNumber]='611033749'
----GROUP BY k.[Mon YYYY],[FirstMovementCaptureDateKey],[MasterContract] 
----	,[ProductCode]
----    ,[EnglishProductCodeDescription]
----ORDER BY pol.[RecordEffectiveStartDate]
----54509
--) z
--group by z.[Date],z.[TrackingApplicableMonthKey]
--	,z.[MasterContract] 
--	,z.[Policy Type]
--    ,z.[Policy Type Description]
--	order by z.[TrackingApplicableMonthKey]