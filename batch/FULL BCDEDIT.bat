@echo off

bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /set tscsyncpolicy Legacy
bcdedit /set tpmbootentropy ForceDisable
bcdedit /set hypervisorlaunchtype off
bcdedit /set quietboot yes
bcdedit /timeout 0
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No
bcdedit /set nx alwaysoff
bcdedit /set bootux disabled
bcdedit /set bootmenupolicy legacy
bcdedit /set x2apicpolicy enable
bcdedit /set uselegacyapicmode no
bcdedit /deletevalue useplatformclock
bcdedit /set debug No
bcdedit /set ems No
bcdedit /set bootems No 
bcdedit /set integrityservices disable
bcdedit /set bootlog no
bcdedit /event off
bcdedit /bootdebug off
bcdedit /set firstmegabytepolicy UseAll
bcdedit /set avoidlowmemory 0x8000000
bcdedit /set nolowmem Yes
bcdedit /set vsmlaunchtype Off
bcdedit /set vm No
bcdedit /set usephysicaldestination No
bcdedit /set forcefipscrypto No
bcdedit /set perfmem 0 
bcdedit /set noumex Yes
bcdedit /set groupaware off 
bcdedit /set configaccesspolicy Default
bcdedit /set MSI Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No
bcdedit /set linearaddress57 OptOut
bcdedit /set increaseuserva 268435328
bcdedit /set hypervisorlaunchtype off
bcdedit /set ems no
bcdedit /set sos off
bcdedit /set disableelamdrivers yes
bcdedit /set pae ForceDisable
bcdedit /set {globalsettings} custom:16000067 true
bcdedit /set {globalsettings} custom:16000069 true
bcdedit /set {globalsettings} custom:16000068 true 
bcdedit /set loadoptions DISABLE_INTEGRITY_CHECKS 
bcdedit /set nointergritychecks On 
bcdedit /set useplatformclock No
bcdedit /set graphicsmodedisabled No
bcdedit /set extendedinput Yes
bcdedit /set highestmode Yes
bcdedit /set clustermodeaddressing 1
bcdedit /set configflags 0
bcdedit /set onecpu No
bcdedit /set halbreakpoint No
bcdedit /set forcelegacyplatform No
bcdedit /set recoveryenabled No
bcdedit /set flightsigning No
bcdedit /set useplatformclock No
bcdedit /deletevalue removememory
bcdedit /deletevalue safeboot
bcdedit /deletevalue safebootalternateshell
bcdedit /deletevalue truncatememory