VBoxManage modifyvm "macOS Ventura" --cpu-profile "Intel Core i7-6700K"
VBoxManage setextradata "macOS Ventura" "VBoxInternal/TM/TSCMode" "RealTSCOffset"

VBoxManage modifyvm "macOS Ventura" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "macOS Ventura" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,3"
VBoxManage setextradata "macOS Ventura" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0" 
VBoxManage setextradata "macOS Ventura" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple" 
VBoxManage setextradata "macOS Ventura" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" 
VBoxManage setextradata "macOS Ventura" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1


# VBoxManage setextradata "macOS Ventura" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 0