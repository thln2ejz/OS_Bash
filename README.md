# Mini Projects

## Delete (or fake) metadata

**del_metadata.sh**: bash script for deleting metadata (author name; date timestamps) from a docx (Word) document. Metadata in the output file will appear empty (no author), (no date), including comments in the margin which will have no author and no timestamps. 

**del_metadata.py**: python script that does the same as above, however with an additional (mask) option for faking timestamps of comments using numpy. If the mask option is specified, then timestamps of comments in the margin will be faked through randomization where timestamps are assigned with an incremental component drawn from a uniform distribution.   

## Random web traffic generator

**traffic_gen.sh**: generates random web traffic for obfuscating real traffic while browsing. 

## Scrape image files from xkcd site

**scrape_imgs.sh**: download cartoon images from an (inaccessible) xkcd directory.
	
## Android cleanup

**Device specifications**:		<br>
Device name: HUAWEI nova 2 Plus		<br>
Model: BAC-L21				<br>
Android version: 8.0.0			<br>

Android phones are shipped with tens of (system and 3rd party) pre-installed packages of which many are bloatware. For the particular device specified above, one cannot unlock the bootloader and therefore cannot root the device nor install custom ROM. Moreover, no open source custom ROM is compatible with this particular model (including Ubuntu Touch, LineageOS, and others). Even systemless rooting using <a href="https://github.com/topjohnwu/Magisk">Magisk</a> (using stock ROM) is not possible since Huawei's site does not provide a 'boot.img' file that you can flash onto this device. Additionally, Magisk will not work on Huawei devices as these use a different partition setup than most normal Android devices. The option left is to manually clean up the android system from bloatware and replace these with open source apps.
  
**Cleanup**: <br>

(0) Backup any important files onto your computer. <br>
(1) Start a factory reset (this will wipe all your device data). Do not enter any account info. <br>
(2) Connect phone by usb cable and allow file trasfer. <br>
(3) Enable Developer options and USB debugging. <br>
(4) Install android debug bridge (adb) on your computer:

sudo apt update <br>
sudo apt install android-tools-adb <br> 

(5) Run <a href="https://github.com/thln2ejz/Scripting_Bash/blob/main/android_cleanup.sh">android_cleanup.sh</a> script <br>

#useful check: device detection and listing of packages (switch -f is for also showing associated apk files) <br> 
adb devices <br>
adb shell pm list packages <br>
adb shell pm list packages -f  
adb shell pm list packages | grep google <br>

Packages typically include bloatware from google, facebook, huawei, gameloft, netflix, etc., not to mention a potential keylogger (Microsoft's Swiftkey) which is the default 'keyboard'. The list avoids system packages which can cause a factory reset such as:

#com.google.android.gms			<br>
#com.google.android.packageinstaller	<br>  	

After running android_cleanup.sh, remove Microsoft swiftkey, but first install an open source alternative (eg <a href="https://f-droid.org/en/packages/rkr.simplekeyboard.inputmethod/">Simple Keyboard</a>):

adb install ./rkr.simplekeyboard.inputmethod_76.apk  <br>
adb shell pm uninstall --user 0 com.swiftkey.swiftkeyconfigurator <br>
adb shell pm uninstall --user 0 com.touchtype.swiftkey	<br>

**Alternative apps**: <br>
Possible FOSS replacements for essential apps:

* Simple, lightweight apps for Dialer, Music-Player, Notes, File-Manager, Gallery, Flashflight, Clock, Voice-Recorder, Calculator, and Contacts can be obtained from https://github.com/SimpleMobileTools. The Contacts app in particular includes the ability to store contacts without communicating with any other app.

* Other useful apps: <a href="https://f-droid.org/en/packages/com.fsck.k9/">K-9 Mail client</a>, <a href="https://f-droid.org/en/packages/com.gsnathan.pdfviewer/">Pdf Viewer Plus</a> (replaces Adobe Reader), <a href="https://f-droid.org/en/packages/com.termux/">Termux (terminal emulator)</a>, Firefox. Other app choices exist on F-Droid, Github, direct apk download, etc.
