SELECT DISTINCT
	p.[PolicyNumber] POLICYNO
	,p.[ClientNumber]
	,b.[BusinessUnitCode] [BUSINESS UNIT]
	,[IFAAgentNumber] [IFA NO]
	,po.[EnglishProductCodeDescription] [LATEST PRODUCT]	
	,p.[FirstMovementCaptureDateKey] [POLICY CAPTURE DATE]
	,p.[DateOfCommencementKey] [POLICY COMMENCEMENT]
	,m.PolicyNumber [1ST POLICYNO]
	,m.FirstMovementCaptureDateKey [1ST POLICY CAPTURE DATE]
	,m.DateOfCommencementKey [1ST POLICY COMMENCEMENT]
	,CASE WHEN p.[PolicyNumber] = m.PolicyNumber THEN '1st Policy' ELSE '2nd+ Policy' END [POLICY TYPE]
	
FROM [CG_P_DB_DATEDW].[DIM].[POLICY] p
INNER JOIN [CG_P_DB_DATEDW].[DIM].[IFAAGENT] as I 
	ON p.IFAAgentNumberKey = I.IFAAgentKey
INNER JOIN [CG_P_DB_DATEDW].[DIM].[BUSINESSUNIT] b
	ON b.BusinessUnitKey = p.FirstBenefitBusinessUnitKey
INNER JOIN [CG_P_DB_DATEDW].[DIM].[PRODUCT] po
	ON po.ProductKey = p.ProductKey
INNER JOIN (
SELECT pol.PolicyNumber, pol.FirstMovementCaptureDateKey, k.ClientNumber,k.DateOfCommencementKey
FROM ( 
SELECT 
    [ClientNumber]
    ,MIN([DateOfCommencementKey]) [DateOfCommencementKey]
FROM [CG_P_DB_DATEDW].[DIM].[POLICY]
GROUP BY 
	[ClientNumber]
	) k
INNER JOIN [CG_P_DB_DATEDW].[DIM].[POLICY] Pol
ON Pol.ClientNumber = k.ClientNumber
and pol.DateOfCommencementKey = k.DateOfCommencementKey
	) m
on m.ClientNumber = p.ClientNumber
where  I.IntroducerIFAAgentNumber = 'A0000001' 
and p.isactiverecord = 1
