
create Proc [dbo].[GetMemberDataForOutputFile] (@filerequestid uniqueidentifier)
as  

Select
--Header names should map what's the output of the header
--place holder should map where columns should be. it will append additional data columsn at the end.
	ClientId,
	BeneficiaryId,
	BeneficiaryIdentifier,
	FullName,
	Address1,
	Address2,	
	City,
	[State],	
	ZipCode,	
	Sex,
	DateOfBirth,
	Phone,
	AdditionalDataJson
From
	Beneficiary (NOLOCK)
WHere
	FileRequestId = @FileRequestId
