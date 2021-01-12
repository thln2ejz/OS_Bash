# OS_Bash

## Delete (or fake) metadata

**del_metadata.sh**: bash script for deleting metadata (author name; date timestamps) from a docx (Word) document, which is basically a zip file of xml documents. The script modifies document.xml and comments.xml (if present). Metadata in the output file will appear empty (no author), (no date), including comments in the margin which will have no author and no timestamps. 

Usage: ./del_metadata.sh file1.docx 

**del_metadata.py**: python script that does the same as above, however with an additional (mask) option for faking timestamps of comments using numpy. If the mask option is specified, then timestamps of comments in the margin will be faked through randomization: the first will be the current OS datetime, and remaining comments will be assigned timestamps with an incremental component drawn from a uniform distribution so that consecutive comments appear as if anywhere between 1 to 2 minutes apart.      

Usage: ./del_metadata.py -m file1.docx <br>
Usage: ./del_metadata.py file1.docx 

## Download image files from xkcd site

**scrape_imgs.sh**: download all cartoon images from (inaccessible) xkcd.com directory; can be adapted to similar situations. 
Comic cartoons on xkcd.com can be viewed with URL: 

https://xkcd.com/[i]/index.html

where [i] is an integer from 1 to some number (which increases as more cartoons are added over time)

The cartoon image files can be downloaded one at a time by visiting all  consecutive index.html files, however the number of cartoons so far is a few thousands (>4000), and the directory on the web server which holds these images is forbidden: 

https://imgs.xkcd.com/comics/  ->  #403 Forbidden

With no permission to access the directory, its image files can still be downloaded with wget if their filenames are known; so these filenames would first need to be detected, i.e. scraped from index.html files. 

The cartoon images are located at: 

https://imgs.xkcd.com/comics/*.jpg	
or 
https://imgs.xkcd.com/comics/*.png

where * represents some variable filename for each cartoon.

This script fetches index.html files by incrementing [i] in a loop and detecting the URL in the html files pointing to the cartoon image (jpg or png file). The loop increments indefinitely until it fails to find an index.html file for some [i]. The images are stored in a specified directory or by default in ~/Downloads/xkcd_imgs/ 

Usage: ./scrape_xkcd.sh	path_to_directory <br>
       if unspecified, path_to_directory will be default: ~/Downloads/xkcd_imgs/
	
## Android Cleanup

### Device specifications:
Device name: HUAWEI nova 2 Plus
Model: BAC-L21
Build number: BAC-L21 8.0.0.349(C185)
EMUI version: 8.0.0
Android version: 8.0.0
CPU: Hisilicon Kirin 659
Kernel version: 4.4.23+

Commercial android phones are shipped with a few hundred (system and 3rd party) pre-installed packages of which the majority is bloatware.   

Optimal solution: select a phone which supports rooting and installing a custom ROM of your choice. However, sometimes the optimal solution isn't possible, eg having received your phone as a gift.  

Ubports' Ubuntu Touch which has no connections to Google and bloatware is an ideal choice. Unfortunately only few devices are supported although the list is growing. LineageOS is a second favorite, but for what concerns Huawei devices it only supports P20 Lite, Honor View 10, P20 Pro, P Smart, and Honor 5X. 

For the particular device specified above, not many options are possible: one cannot unlock the bootloader -> hence cannot root the device -> hence cannot install custom ROM. Modern Huawei phones do not allow unlocking the bootloader; moreover, even if you could unlock the bootloader through an exploit, it would be impossible to replace stock android on this particular phone model as no open source custom ROM is compatible (including Ubuntu Touch, LineageOS, and others). Even if you just want to root android systemless-ly with <a href="https://github.com/topjohnwu/Magisk">Magisk</a> (using stock ROM), Huawei's site simply does not provide a boot.img file that you can flash with fastboot onto this device! Additionally, Magisk will not work on Huawei devices as these use a different partition setup than most normal Android devices. 

The option left is to manually clean up the android system from all bloatware (to the extent possible) and replace these with open source apps; this is still far better than doing nothing; note: you do NOT need to root your device in order to do this.  
  
After experimentation, a few mistakes, and consequent factory resets, below is a summary for (safely) removing unwanted apps:  

(0) Backup any important files (eg music) onto your computer.
(1) Start a factory reset (this will wipe all your device data). Do not enter any account info or link in any way to Gmail/Outlook/etc. in case you have such accounts.
(2) Connect phone by usb cable and allow file trasfer.
(3) Settings -> System -> About phone -> tap 7 times on 'Build number' (to enable Developer options).
(4) Developer options (turn ON) -> USB debugging (turn ON). 
(5) Follow shell commands below (assuming Linux CLI).

sudo apt update
sudo apt install android-tools-adb	#android debug bridge (list of commands for android)    
adb devices				#check that device is detected (make sure phone is connected by usb cable)

adb shell pm list packages		#list all package names currently installed on your device (~couple hundreds) 														
adb shell pm list packages -f		#option -f shows, in addition, the associated apk files 

Packages typically include bloatware from google, facebook, huawei, gameloft, netflix, etc., not to mention a potential keylogger courtesy of Microsoft called Swiftkey (which is the default 'keyboard'). This isn't very surprising given the following default setting on Windows 10 desktops: "Send Microsoft info about how I write to help us improve typing and writing in the future". Windows is not an operating system; it's malware.   

Examples of built-in packages/apps: 

adb shell pm list packages | grep google	#check installed google packages	
adb shell pm list packages | grep facebook	#eg: facebook packages include these below:	

com.facebook.services
com.facebook.katana
com.facebook.orca
com.facebook.system
com.facebook.appmanager

adb shell pm list packages | grep gameloft   

com.gameloft.android.GloftANPH
com.gameloft.android.GloftDBMF
com.gameloft.android.GloftDMKF
com.gameloft.android.GloftPDMF
com.gameloft.android.GloftSMIF
com.gameloft.android.GloftSOMP

Android cleanup (ie nuke it out of orbit):

From experimentation, here is a list of pre-installed packages that can be safely removed (you can view and run this script as alternative to the below detailed steps): <a href="https://github.com/thln2ejz/OS_Bash/blob/main/android_cleanup.sh">android_cleanup.sh</a>

Detailed explanation: 

Remove all packages from google, huawei, facebook, gameloft, netflix, etc., but avoid removing system packages which can break your device (ie cause a factory reset). Note: it's likely that some of the exceptions below (listed after grep -Ev) can also be removed safely.   

#list packages to be removed and save package names temporarily in ~/tmp/
adb shell pm list packages | grep -E 'google|facebook|gameloft|wego|booking|netflix|zcamera|qeexo|igg|example|hicloud|stupeflix|daoke|playwing|simalliance|huawei' | grep -Ev 'packageinstaller|.gms|wifi|bluetooth|.camera|firstbootinfo|launcher|.autoinstall|securitymgr|systemserver|internal.app|hwasm|omacp|systemanager|hwaps|hwouc|mmitest|ims|dsdscardmanager' > ~/tmp/files_rm

Notice that when removing google packages, 2 exceptions were made for:

com.google.android.gms
com.google.android.packageinstaller  	

The first one cannot be removed anyway -> Failure [DELETE_FAILED_DEVICE_POLICY_MANAGER]
The second will (if removed) force your phone upon reboot to enter recovery mode for a factory reset.  

sed -i 's/package:/adb shell pm uninstall --user 0 /' ~/tmp/files_rm	#fix proper command for uninstalling packages
sed -i '1 i #!/bin/bash' ~/tmp/files_rm					#add a she-bang first line to execute as bash script			
cat ~/tmp/files_rm							#check that all is fine
cd ~/tmp/; chmod 700 files_rm 						#allow user owner permission (incl. execution)  	
./files_rm								#run script

More android packages that can be safely removed (such as chrome, email, vending, etc.):

adb shell pm list packages | grep -E '.bips|.dreams|.egg|.email|.chrome|.emergency|.managedprovisioning|.bookmarkprovider|.vending|.vpndialogs|.wallpaper|callogbackup|tmobile|gallery3d' > ~/tmp/files_rm_android
sed -i 's/package:/adb shell pm uninstall --user 0 /' ~/tmp/files_rm_android
sed -i '1 i #!/bin/bash' ~/tmp/files_rm_android
cat ~/tmp/files_rm_android
cd ~/tmp/; chmod 700 files_rm_android 
./files_rm_android

adb shell pm list packages						#list remaining packages

Finally, remove Microsoft's swiftkey, but first install an open source alternative (eg <a href="https://f-droid.org/en/packages/rkr.simplekeyboard.inputmethod/">Simple Keyboard</a>):

adb install ./rkr.simplekeyboard.inputmethod_76.apk   			#install replacement for keyboard
													  	
adb shell pm uninstall --user 0 com.swiftkey.swiftkeyconfigurator 	#uninstall swiftkey configurator first before executing next line 
adb shell pm uninstall --user 0 com.touchtype.swiftkey			#remove Microsoft's keylogger (swiftkey)

Possible free open source replacements for essential apps (best way to install these is either from your linux command line interface): 

adb shell pm install package_name.apk           

...or just download or transfer the apk file of the package you want (from Github or F-Droid) to your phone (eg Download folder) and then install by tapping on the file (android's packageinstaller will take care of the rest).

Simple-Contacts	  ... includes ability to store contacts within app only! ie does not communicate with other apps, eg Telegram; perfect privacy feature. 
		  ... I was able to see the name of one of my contacts on Telegram as specified by that person (and not as set by myself in my own contact list!).  
Simple-Dialer
Simple-Music-Player
Simple-Notes
Simple-File-Manager
Simple-Gallery
Simple-Flashflight
Simple-Voice-Recorder
Simple-Calculator
Simple-SMS-Messenger     ... is buggy (can receive sms, but can only send if I receive first: report to developers)
Simple-Camera 		 ... wasn't able to function (because I did not risk removing Huawei's camera app)
Simple-Calendar 	 ... wasn't working well when I tried it, but was undergoing active maintenance/bug fixes

Source for all simple apps above: https://github.com/SimpleMobileTools 

Additional basic apps:

K-9 Mail client* 		    	 ... https://f-droid.org/en/packages/com.fsck.k9/
Pdf Viewer Plus (replaces Adobe)  	 ... https://f-droid.org/en/packages/com.gsnathan.pdfviewer/
Termux (terminal emulator)        	 ... https://f-droid.org/en/packages/com.termux/	 
Telegram for Android (Download APK File) ... https://telegram.org/
Firefox beta 				 ... yes beta! because stable android version does not allow about:config (cannot enable/disable java etc.). 

\*K-9 Mail is a bit buggy over pop3 at least with a Yandex account (it crashes upon opening emails), but notification works well and allows setting a 6-line preview; you can always login your account if you spot an important email!  

Other app choices exist on F-Droid, Github, direct apk download... 
Note: check project source code before downloading/installing an app or at least ensure some minimum safety measures:  source code visibility and a large active community > 5 developers!)

Screenshot after clean-up:
<a href="https://github.com/thln2ejz/OS_Bash/blob/main/screenshot1.png">Screenshot1</a>
<a href="https://github.com/thln2ejz/OS_Bash/blob/main/screenshot2.png">Screenshot2</a>

With fewer apps and background processes, the battery will now last significantly longer.
You can turnoff automatic system update through Developer options -> Automatic system updates (turn off).

**Issues I could not solve**: strangely, default voice call volume in Huwawei cannot be muted, only lowered to some minimum level! What practical application is there for this, apart for the obvious one? Even Huawei's Settings -> Sound allows volume control for Ringtone, Media, and Alarms, but not for Calls! Installing 3rd party apps will not override this (as soon as you leave the muted setting, it immediately reverts back to minimum level). 

In case you're bothered by the stock camera app but would still like to keep it functioning (eg for scanning documents or taking photos when needed), then a small section of black scotch tape patched on the front and back sides does the trick. Additionally, if you're worried about other hardware built-in features that cannot be controlled (GPS, internal mic), then just lose your smart phone!
