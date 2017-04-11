
ALTER PROCEDURE [dbo].[sp_RegistrationList] 
AS
BEGIN 

--declare @res nvarchar(max)='['
--select @res+='[ 
--"'+convert(nvarchar(max),[UserLogin])+'",
--"'+convert(nvarchar(max),[CTID])+'",
--"'+isnull(PhoneNumber,'')+'",
--"'+isnull(convert(nvarchar(max),CrtDt),'')+'",
--"'+isnull(Email,'')+'",
--],'
--from UserObj
--set @res= SUBSTRING(@res,3,(LEN(@res)-1))
--select @res+']'

select '[' + STUFF((
        select 
            ',{
			"UserLogin":"'+isnull(UserLogin,'')+'",
			"CTID":"'+isnull(CTID,'')+'",
			"CrtDt":"'+isnull(convert(nvarchar(max),CrtDt),'not available')+'",
			"Email":"'+isnull(Email,'not available')+'",
			"PhoneNumber":"'+isnull(convert(nvarchar(max),PhoneNumber),'not available')+'"'
            +'}'
        from UserObj
        for xml path(''), type
    ).value('.', 'varchar(max)'), 1, 1, '') + ']'	
END
--exec [sp_RegistrationList]
