VBoxManage modifyvm "macOSVentura" --cpu-profile "Intel Core i7-6700K"
VBoxManage modifyvm "macOSVentura" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "macOSVentura" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,3"
VBoxManage setextradata "macOSVentura" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0" 
VBoxManage setextradata "macOSVentura" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple" 
VBoxManage setextradata "macOSVentura" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" 
VBoxManage setextradata "macOSVentura" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1