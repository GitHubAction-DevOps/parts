param ($pool_name, $app_name, $workspace, $packagepath )

#navigate to the app pools root
cd IIS:\AppPools\

#check if the app pool exists
if (!(Test-Path $pool_name -pathType container))
{
    #create the app pool
    New-WebAppPool -Name $pool_name -Force
}
else {
    echo "Pool exists"
}

#navigate to the sites root
cd IIS:\Sites\

#check if the site exists
if (!(Test-Path $app_name -pathType container))
{
   New-Website -Name $app_name -ApplicationPool $iisAppPoolName -Force -PhysicalPath $workspace\webapp\$packagepath -Port 8083
}
else {
    echo "site exists"
}
