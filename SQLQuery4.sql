
--SELECT
--	SUBSTRING(CONVERT(VARCHAR(11), pol.[RecordEffectiveStartDate], 113), 4, 8) AS [Mon YYYY]
--	,k.PolicyNumber
--	,MasterContract
--	,[ProductCode] [Policy Type]
--    ,[EnglishProductCodeDescription] [Policy Type Description]
--FROM (
SELECT 
	--MIN(pol1.[PolicyMainMemberKey]) [PolicyMainMemberKey]
	pol1.[PolicyMainMemberKey]
	,pol1.[PolicyNumber] 
FROM [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol1
INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol2
	ON pol1.PolicyNumber =pol2.PolicyNumber	
	--AND pol1.IDNumber != pol2.IDNumber  
	--AND pol1.FirstName != pol2.FirstName  
	AND pol1.DateOfBirth != pol2.DateOfBirth 
and year(pol1.[RecordEffectiveEndDate]) > 2014
and pol1.IsActiveRecord=0
INNER JOIN [CG_P_DB_DATEDW].[DIM].[SPOUSE] s
	ON s.PolicyNumber = pol1.PolicyNumber
	--AND s.DateOfBirth != pol1.DateOfBirth   
--WHERE pol1.PolicyNumber='13291487'
--GROUP BY 
--	pol1.[PolicyNumber]
	order by SUBSTRING(CONVERT(VARCHAR(11), pol1.[RecordEffectiveStartDate], 113), 4, 8) 
-- )k
--INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICYMAINMEMBER] pol
--	ON k.[PolicyMainMemberKey] = pol.[PolicyMainMemberKey]
--	AND k.PolicyNumber = pol.PolicyNumber
--INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICY] p
--	ON pol.PolicyNumber = p.PolicyNumber
--	AND p.[IsActiveRecord] = 1
--INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] Pr
--	ON pr.ProductKey = p.ProductKey