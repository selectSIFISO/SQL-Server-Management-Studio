--SELECT DISTINCT
SELECT
	[PolicyNumber] POLICYNO
	,b.[BusinessUnitCode] [BUSINESS UNIT]
	,[IFAAgentNumber] [IFA NO]
	,po.[EnglishProductCodeDescription] [LATEST PRODUCT]	
	,p.[FirstMovementCaptureDateKey] [POLICY CAPTURE DATE]
	,p.[DateOfCommencementKey] [POLICY COMMENCEMENT]
	,'' [1ST POLICYNO]
	,'' [1ST POLICY CAPTURE DATE]
	,'' [1ST POLICY COMMENCEMENT]
	,'' [POLICY TYPE]
	,[PostalCode] PCODE
FROM [CG_P_DB_DATEDW].[DIM].[POLICY] p
INNER JOIN [CG_P_DB_DATEDW].[DIM].[IFAAGENT] as I 
	ON p.IFAAgentNumberKey = I.IFAAgentKey
INNER JOIN [CG_P_DB_DATEDW].[DIM].[BUSINESSUNIT] b
	ON b.BusinessUnitKey = p.FirstBenefitBusinessUnitKey
INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] po
	ON po.ProductKey = p.ProductKey
where [PolicyNumber] in ('405727545','405728063','405728897')