SELECT a.*
FROM OPENROWSET('SQLNCLI', 'Server=server\sqlexpress;Trusted_Connection=yes;',
     'SELECT * FROM [Database].[dbo].[Table]') AS a;