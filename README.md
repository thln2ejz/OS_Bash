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
Device name: HUAWEI nova 2 Plus		<br>
Model: BAC-L21				<br>
Android version: 8.0.0			<br>
CPU: Hisilicon Kirin 659		<br>
Kernel version: 4.4.23+			<br>

Commercial android phones are shipped with a few hundred (system and 3rd party) pre-installed packages of which the majority is bloatware.   

Optimal solution: select a phone which supports rooting and installing a custom ROM of your choice. 

Ubports' Ubuntu Touch has no connection to Google and bloatware and could be an ideal choice. Unfortunately only few devices are supported (although the list is growing). LineageOS is a second favorite, but for what concerns Huawei devices it only supports P20 Lite, Honor View 10, P20 Pro, P Smart, and Honor 5X. 

For the particular device specified above, not many options are possible: one cannot unlock the bootloader, and therefore cannot root the device nor install custom ROM. Modern Huawei phones do not allow unlocking the bootloader; moreover, even if you could unlock the bootloader through an exploit, it would be impossible to replace stock android on this particular model as no open source custom ROM is compatible (including Ubuntu Touch, LineageOS, and others). Even if you just want to root android systemless-ly with <a href="https://github.com/topjohnwu/Magisk">Magisk</a> (using stock ROM), Huawei's site simply does not provide a boot.img file that you can flash with fastboot onto this device! Additionally, Magisk will not work on Huawei devices as these use a different partition setup than most normal Android devices. 

The option left is to manually clean up the android system from bloatware (to the extent possible) and replace these with open source apps; this is still far better than doing nothing; note: you do **not** need to root your device in order to do this.  
  
After experimentation, below is a summary for (safely) removing unwanted apps:  

(0) Backup any important files (eg music) onto your computer. <br>
(1) Start a factory reset (this will wipe all your device data). Do not enter any account info or link in any way to Gmail/Outlook/etc. <br>
(2) Connect phone by usb cable and allow file trasfer. <br>
(3) Settings -> System -> About phone -> tap 7 times on 'Build number' (to enable Developer options). <br>
(4) Developer options (turn ON) -> USB debugging (turn ON). <br>
(5) Install android debug bridge (adb) on your computer and run <a href="https://github.com/thln2ejz/OS_Bash/blob/main/android_cleanup.sh">android_cleanup.sh</a> script (assuming Linux CLI); <br>

sudo apt update <br>
sudo apt install android-tools-adb <br> 

adb devices <br>
adb shell pm list packages <br>
adb shell pm list packages -f  

Packages typically include bloatware from google, facebook, huawei, gameloft, netflix, etc., not to mention a potential keylogger (Microsoft's Swiftkey) which is the default 'keyboard'. This isn't surprising given the following default setting on Windows 10 desktops: "Send Microsoft info about how I write to help us improve typing and writing in the future".   

Examples of built-in packages: 

adb shell pm list packages | grep facebook <br>
	
#com.facebook.services	<br>
#com.facebook.katana	<br>
#com.facebook.orca	<br>
#com.facebook.system	<br>
#com.facebook.appmanager <br>

The list of pre-installed packages that can be safely removed is shown in <a href="https://github.com/thln2ejz/OS_Bash/blob/main/android_cleanup.sh">android_cleanup.sh</a> and was obtained after trial & error. The list includes packages from google, huawei, facebook, gameloft, netflix, etc., but avoids system packages which can break your device (ie cause a factory reset). Notice that when removing google packages, 2 exceptions were made for:

#com.google.android.gms			<br>
#com.google.android.packageinstaller	<br>  	

The first one cannot be removed in any case -> Failure [DELETE_FAILED_DEVICE_POLICY_MANAGER] 		<br>
The second will (if removed) force your phone upon reboot to enter recovery mode for a factory reset.	<br>  

After running android_cleanup.sh, remove Microsoft's swiftkey, but first install an open source alternative (eg <a href="https://f-droid.org/en/packages/rkr.simplekeyboard.inputmethod/">Simple Keyboard</a>):

adb install ./rkr.simplekeyboard.inputmethod_76.apk  <br>
adb shell pm uninstall --user 0 com.swiftkey.swiftkeyconfigurator <br>
adb shell pm uninstall --user 0 com.touchtype.swiftkey	<br>

Possible FOSS replacements for essential apps (simply install these either from your command line interface, or on your phone by downloading/transfering apk files and tapping on them):

* Simple lightweight apps for Dialer, Music-Player, Notes, File-Manager, Gallery, Flashflight, Clock, Voice-Recorder, Calculator, and Contacts can be obtained from https://github.com/SimpleMobileTools.  
 
The Contacts app in particular includes the ability to store contacts within the app without communicating with any other app, eg Telegram. The names of your contacts on Telegram will appear as specified by your contacts (and not as set by yourself in your phone's own contact list!). Note: SMS-Messenger, Camera, and Calendar apps from the above source are buggy and still under development.

* Other useful apps: <a href="https://f-droid.org/en/packages/com.fsck.k9/">K-9 Mail client*</a>, <a href="https://f-droid.org/en/packages/com.gsnathan.pdfviewer/">Pdf Viewer Plus</a> (replaces Adobe), <a href="https://f-droid.org/en/packages/com.termux/">Termux (terminal emulator)</a>, Firefox beta: unlike beta, the stable android version does not allow about:config (cannot enable/disable java etc.) <br>

\*K-9 Mail is a bit buggy over pop3 at least with a Yandex account (it crashes upon opening emails), but notification works well and allows setting a 6-line preview. Other app choices exist on F-Droid, Github, direct apk download, etc.; check project source code before downloading/installing an app or at least that it is visibile and supported by a large active community (> 5 developers).

You may turn off automatic system update through Developer options -> Automatic system updates (off).

**Unresolved issues**: default voice call volume in Huawei cannot be muted, only lowered to some minimum level. Also, Huawei's Settings -> Sound allows volume control for Ringtone, Media, and Alarms, but not for Calls! Installing 3rd party apps will not override this (as soon as you leave the muted setting, it immediately reverts back to minimum level).
