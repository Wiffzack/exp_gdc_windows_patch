##(Get-Content nvld.reg) | Foreach-Object {$_ -replace '\[nvlddmkm\]','nvlddmkm1'}  | Out-File nvld.reg
(Get-Content nvld.reg).replace('nvlddmkm', 'nvlddmkm1') | Set-Content nvld.reg
