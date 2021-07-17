@echo off
reg export  HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\ nvld.reg
Powershell.exe -executionpolicy remotesigned -File replace.ps1
reg add nvld.reg
