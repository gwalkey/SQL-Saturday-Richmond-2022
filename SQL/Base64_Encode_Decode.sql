-- Base64 Encode/Decode in SQL
SELECT CAST('BadPassword' as varbinary(max)) FOR XML PATH(''), BINARY BASE64
SELECT CAST( CAST( 'QmFkUGFzc3dvcmQ=' as XML ).value('.','varbinary(max)') AS varchar(max) ) AS 'Password'