
drop table ##mar2015_Final
drop table ##feb2015_Final
drop table ##jan2015_Final
drop table ##dec2014_Final
drop table ##nov2014_Final
drop table ##oct2014_Final
drop table ##sep2014_Final
drop table ##aug2014_Final
drop table ##jul2014_Final
drop table ##jun2014_Final
drop table ##may2014_Final
drop table ##apr2014_Final

select * from sys.tables order by create_date desc

update ##mar_2014_prep
set [Mon YYYY] = 'Mar 2014'

SELECT
	k.[Mon YYYY] [Date]
	,k.[PolicyNumber]
	,[MasterContract] 
	,[ProductCode] [Policy Type]
    ,[EnglishProductCodeDescription] [Policy Type Description]
	--,COUNT(*) [Number of policies with an annual premium increase indicator]
FROM
(
	SELECT 
		SUBSTRING(CONVERT(VARCHAR(11), [RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
		,[PolicyNumber]
		,[ProductKey]
		,MAX([PolicyKey]) [PolicyKey] 
	FROM [CG_P_DB_DATEDW].[DIM].[POLICY]  
	--WHERE [RecordEffectiveStartDate] between '1 mar 2014' and '28 mar 2014'
	WHERE [RecordEffectiveStartDate] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-12, 0)
	GROUP BY 
		SUBSTRING(CONVERT(VARCHAR(11), [RecordEffectiveStartDate], 113), 4, 8)
		,[PolicyNumber]
		,[ProductKey]
)k
INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICY] pol
	ON k.PolicyKey = pol.PolicyKey
INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] P
  ON p.ProductKey = pol.ProductKey
WHERE pol.[PercentIncrease] = 0
--GROUP BY k.[Mon YYYY]
ORDER BY k.[Mon YYYY]
--54509

select DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-12, 0)