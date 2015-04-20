SELECT
	g.[Mon YYYY]
	--,g.PolicyNumber
	,k.MasterContract
	,k.[Policy Type]
	,k.[Policy Type Description]
	,count(*) 
FROM(
	SELECT DISTINCT
		--pol1.[PolicyMainMemberKey]
		pol1.[PolicyNumber] 
		,p.MasterContract
		,[ProductCode] [Policy Type]
    ,[EnglishProductCodeDescription] [Policy Type Description]
	FROM [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol1
	INNER JOIN [CG_P_DB_DATEDW].[DIM].[SPOUSE] s
		ON s.PolicyNumber = pol1.PolicyNumber
		AND s.DateOfBirth = pol1.DateOfBirth
		INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICY] p
	ON pol1.PolicyNumber = p.PolicyNumber
	AND p.[IsActiveRecord] = 1
	INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] Pr
	ON pr.ProductKey = p.ProductKey
	WHERE 
	pol1.IsActiveRecord=1 
	--and 
	--pol1.PolicyNumber='12020617'
)k
INNER JOIN (
SELECT
	--z.PolicyMainMemberKey
	z.PolicyNumber
	,SUBSTRING(CONVERT(VARCHAR(11), m.[RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
FROM(
SELECT 
	MAX(pol1.[PolicyMainMemberKey]) [PolicyMainMemberKey]
	,pol1.[PolicyNumber] 
FROM [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol1
WHERE pol1.IsActiveRecord=0 
--and pol1.PolicyNumber='12020617'
GROUP BY 
	pol1.[PolicyNumber])z
INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] m
	ON  z.PolicyNumber = m.PolicyNumber
	AND z.PolicyMainMemberKey = m.PolicyMainMemberKey
)g
on k.PolicyNumber = g.PolicyNumber
group by g.[Mon YYYY]
	,k.MasterContract
	,k.[Policy Type]
	,k.[Policy Type Description]