# exp_gdc_windows_patch
 !This workaround only helps to prevent some configuration issues which couse that you need to reinstall the gpu driver.!
 
 This should make it possible to switch between external gpu and internal without reinstalling drivers.
 
 ## Step 1:(patch.bat)
 First you need make a copy of
 HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\nvlddmkm
 (export it as reg)
 Open the saved file and replace every occurence of nvlddmkm with for example nvlddmkm1,then add it again to the registry.
 Check if the entry  HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\nvlddmkm1 exist.
 
 ## Step 2:
 Now go to HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Video . Search for your GPU:
 For example @oem142.inf,%nvidia_dev.1346.2245.1b0a%;NVIDIA GeForce 930M .
 The Geforce 930M is my intern GPU .
 Now look for the Reg_SZ :Service and replace the entry with nvlddmkm1
 
 Reboot.
 
 ## Nvidia Inspector:
 Exp GDC only support PCI x1, with this strong limited bandwidht right memory memory managment become even more important .
 Memroy Allocation Policy : 0x00000002 WKS_MEMORY_ALLOCATION_POLICY_AGGRESSIVE_PRE_ALLOCATION
 
 ## Preferred Codec Method (DXVA native):
Low bandwitdh , no copy back from GPU
