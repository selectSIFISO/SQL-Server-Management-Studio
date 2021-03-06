
SELECT
	--z.PolicyMainMemberKey
	m.DateOfBirth
	,z.PolicyNumber
	,SUBSTRING(CONVERT(VARCHAR(11), m.[RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
FROM(
SELECT 
	MIN(pol1.[PolicyMainMemberKey]) [PolicyMainMemberKey]
	--,DateOfBirth
	,pol1.[PolicyNumber] 
FROM [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol1
WHERE pol1.IsActiveRecord=0 
and pol1.PolicyNumber='LE501189072'
GROUP BY 
	DateOfBirth,pol1.[PolicyNumber])z
INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] m
	ON  z.PolicyNumber = m.PolicyNumber
	AND z.PolicyMainMemberKey = m.PolicyMainMemberKey

SELECT
	k.PolicyMainMemberKey
	,k.PolicyNumber
	,m.PolicyMainMemberKey
	,m.PolicyNumber
FROM (
	SELECT
		z.PolicyMainMemberKey
		,z.PolicyNumber
	FROM(
	SELECT 
		MAX(pol1.[PolicyMainMemberKey]) [PolicyMainMemberKey]
		,pol1.[PolicyNumber] 
	FROM [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol1
	WHERE pol1.IsActiveRecord=0 and pol1.PolicyNumber='611012922'
	GROUP BY 
		pol1.[PolicyNumber])z
	INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] m
		ON  z.PolicyNumber = m.PolicyNumber
		AND z.PolicyMainMemberKey = m.PolicyMainMemberKey
)k
INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] m
ON  k.PolicyNumber = m.PolicyNumber
AND k.PolicyMainMemberKey < m.PolicyMainMemberKey
--(
	SELECT 
		pol1.[PolicyMainMemberKey]
		,pol1.[PolicyNumber] 
		,s.DateOfBirth ,pol1.DateOfBirth
	FROM [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol1
	INNER JOIN [CG_P_DB_DATEDW].[DIM].[SPOUSE] s
		ON s.PolicyNumber = pol1.PolicyNumber
		AND s.DateOfBirth = pol1.DateOfBirth
	WHERE pol1.IsActiveRecord=1 and pol1.PolicyNumber='611012922'
--) m
--ON  k.PolicyNumber = m.PolicyNumber
--AND k.PolicyMainMemberKey < m.PolicyMainMemberKey