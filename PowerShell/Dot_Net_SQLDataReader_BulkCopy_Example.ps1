# Initialize Variables
$SourceServer         = 'server.database.windows.net'
$SourceDatabase       = 'Products'

$DestinationServer    = 'InternalServer'
$DestinationDatabase  = 'Products'
$DestinationTable     = 'Products_Load'

# Open a Connection to the SOURCE Database
$SQLSrcConnString = "Data Source=$SourceServer;Initial Catalog=$SourceDatabase;UID=SomeUser;Password=SomePassword;Application Name=Powershell Data Copier;encrypt=yes;Connection Timeout=60"
$SQLSrcCmd        = "SELECT ID,WhenRowAdded FROM dbo.Products order by ID"
$objSqlSrcConn    = New-Object System.Data.SqlClient.SqlConnection $SQLSrcConnString
$objSqlSrcCmd     = New-Object System.Data.SqlClient.SqlCommand($SQLSrcCmd, $objSqlSrcConn)
try
{
    $objSqlSrcConn.Open()
}
catch
{
    $SQLError = $PSItem.tostring()
    Throw('Error Connecting to Source Database - Error is:[{0}]' -f $SQLError)
}

# Da Magic Part
[System.Data.SqlClient.SqlDataReader]$SqlReader = $objSqlSrcCmd.ExecuteReader()

# Open a Connection to the DESTINATION Database
[string]$CnnStrTarget = "Data Source=$DestinationServer;Integrated Security=SSPI;Initial Catalog=$DestinationDatabase;Application Name=PowerShell Bulk Inserter"
$SqlBulkCopy                      = New-Object -TypeName System.Data.SqlClient.SqlBulkCopy($CnnStrTarget)
$SqlBulkCopy.EnableStreaming      = $true
$SqlBulkCopy.DestinationTableName = $DestinationTable
$SqlBulkCopy.BatchSize            = 10000 # rows per batch
$SqlBulkCopy.BulkCopyTimeout      = 0     # seconds, 0 (zero) = no timeout limit

# Do the Copy
try 
{
    $SqlBulkCopy.WriteToServer($SqlReader)
}
catch [System.Exception] 
{
    $SQLError = $PSItem.tostring()
    Throw('Error Copying rows - Error is:[{0}]' -f $SQLError)
}

# Cleanup SQL Objects
$SqlReader.Close()
$objSqlSrcConn.Close()
$objSqlSrcConn.Dispose()
$SqlBulkCopy.Close()
