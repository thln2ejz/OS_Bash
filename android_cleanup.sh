#!/bin/bash
adb shell pm uninstall --user 0 com.google.android.youtube
adb shell pm uninstall --user 0 com.google.android.ext.services
adb shell pm uninstall --user 0 com.google.android.googlequicksearchbox		#Google search	
adb shell pm uninstall --user 0 com.google.android.apps.docs.editors.docs	
adb shell pm uninstall --user 0 com.google.android.onetimeinitializer
adb shell pm uninstall --user 0 com.google.android.ext.shared
adb shell pm uninstall --user 0 com.google.android.apps.docs.editors.sheets
adb shell pm uninstall --user 0 com.google.android.apps.docs.editors.slides
adb shell pm uninstall --user 0 com.google.android.configupdater
adb shell pm uninstall --user 0 com.google.android.marvin.talkback			#Talkback
adb shell pm uninstall --user 0 com.google.android.apps.work.oobconfig
adb shell pm uninstall --user 0 com.google.android.gm						#Gmail
adb shell pm uninstall --user 0 com.google.android.apps.tachyon				#Google Duo
adb shell pm uninstall --user 0 com.google.android.setupwizard
adb shell pm uninstall --user 0 com.google.android.music
adb shell pm uninstall --user 0 com.google.android.apps.docs				#Google Drive
adb shell pm uninstall --user 0 com.google.android.apps.maps				#Google Maps
adb shell pm uninstall --user 0 com.google.android.webview
adb shell pm uninstall --user 0 com.google.android.syncadapters.contacts
adb shell pm uninstall --user 0 com.google.android.backuptransport
adb shell pm uninstall --user 0 com.google.android.gsf
adb shell pm uninstall --user 0 com.google.android.tts
adb shell pm uninstall --user 0 com.google.android.partnersetup
adb shell pm uninstall --user 0 com.google.android.videos				#Google play movies
adb shell pm uninstall --user 0 com.google.android.feedback				#Google feedback	
adb shell pm uninstall --user 0 com.google.android.printservice.recommendation	#mobile printing service
adb shell pm uninstall --user 0 com.google.android.apps.photos					#Google Photos
adb shell pm uninstall --user 0 com.google.android.syncadapters.calendar		#calendar sync

#Huawei built-in
adb shell pm uninstall --user 0 com.huawei.hifolder						#cloud folder service
adb shell pm uninstall --user 0 com.huawei.novalivingwallpaper
adb shell pm uninstall --user 0 com.huawei.android.tips					#huawei tips
adb shell pm uninstall --user 0 com.huawei.synergy
adb shell pm uninstall --user 0 com.huawei.health
adb shell pm uninstall --user 0 com.huawei.hidisk
adb shell pm uninstall --user 0 com.huawei.hiview
adb shell pm uninstall --user 0 com.huawei.iaware						
adb shell pm uninstall --user 0 com.huawei.android.thememanager
adb shell pm uninstall --user 0 com.huawei.android.chr					#HwChrService
adb shell pm uninstall --user 0 com.huawei.android.hsf					#huawei services framework
adb shell pm uninstall --user 0 com.huawei.oceanlivingwallpaper
adb shell pm uninstall --user 0 com.huawei.nearby
adb shell pm uninstall --user 0 com.huawei.android.FloatTasks			#floating dock	
adb shell pm uninstall --user 0 com.huawei.motionservice
adb shell pm uninstall --user 0 com.huawei.appmarket					#huawei market app
adb shell pm uninstall --user 0 com.huawei.recsys
adb shell pm uninstall --user 0 com.huawei.android.totemweather			#huawei weather 
adb shell pm uninstall --user 0 com.huawei.gameassistant				#HiGame suite
adb shell pm uninstall --user 0 com.huawei.phoneservice					
adb shell pm uninstall --user 0 com.huawei.screenrecorder
adb shell pm uninstall --user 0 com.huawei.himovie.overseas				#videos app
adb shell pm uninstall --user 0 com.huawei.videoeditor
adb shell pm uninstall --user 0 com.huawei.iconnect
adb shell pm uninstall --user 0 com.huawei.KoBackup
adb shell pm uninstall --user 0 com.huawei.hiviewtunnel
adb shell pm uninstall --user 0 huawei.android.widget
adb shell pm uninstall --user 0 com.huawei.imedia.sws
adb shell pm uninstall --user 0 com.huawei.hwid
adb shell pm uninstall --user 0 com.huawei.tips
adb shell pm uninstall --user 0 com.huawei.android.instantshare
adb shell pm uninstall --user 0 com.huawei.gardenlivingwallpaper
adb shell pm uninstall --user 0 com.huawei.indexsearch.observer
adb shell pm uninstall --user 0 com.huawei.trustagent
adb shell pm uninstall --user 0 com.huawei.indexsearch
adb shell pm uninstall --user 0 com.huawei.systemmanager
adb shell pm uninstall --user 0 com.huawei.HwMultiScreenShot
adb shell pm uninstall --user 0 com.huawei.vassistant					#voice assistant
adb shell pm uninstall --user 0 com.huawei.watch.sync                   
adb shell pm uninstall --user 0 com.huawei.hwstartupguide
adb shell pm uninstall --user 0 com.huawei.fido.uafclient				#fast id online					
adb shell pm uninstall --user 0 com.huawei.android.mirrorshare
adb shell pm uninstall --user 0 com.huawei.contactscamcard				#business card reader
adb shell pm uninstall --user 0 com.huawei.android.totemweatherwidget
adb shell pm uninstall --user 0 com.huawei.compass
adb shell pm uninstall --user 0 com.huawei.android.wfdft
adb shell pm uninstall --user 0 com.huawei.powergenie
adb shell pm uninstall --user 0 com.huawei.android.instantonline
adb shell pm uninstall --user 0 com.huawei.android.projectmenu
adb shell pm uninstall --user 0 com.huawei.android.totemweatherapp
adb shell pm uninstall --user 0 com.huawei.android.pushagent
adb shell pm uninstall --user 0 com.huawei.scanner
adb shell pm uninstall --user 0 com.huawei.hwdetectrepair				#smart diagnosis app
adb shell pm uninstall --user 0 com.huawei.lbs
adb shell pm uninstall --user 0 com.huawei.rcsserviceapplication

#android built-in
adb shell pm uninstall --user 0 com.android.wallpapercropper
adb shell pm uninstall --user 0 com.android.partnerbrowsercustomizations.tmobile
adb shell pm uninstall --user 0 com.android.vending						#Google play store
adb shell pm uninstall --user 0 com.android.egg							#android's easter egg feature
adb shell pm uninstall --user 0 com.android.dreams.basic				#screensaver mode
adb shell pm uninstall --user 0 com.android.bips						#print service
adb shell pm uninstall --user 0 com.android.managedprovisioning
adb shell pm uninstall --user 0 com.android.dreams.phototable			#photo screensaver
adb shell pm uninstall --user 0 com.android.wallpaper.livepicker
adb shell pm uninstall --user 0 com.android.bookmarkprovider			#chrome boomark service
adb shell pm uninstall --user 0 com.android.vpndialogs					#VPN
adb shell pm uninstall --user 0 com.android.wallpaperbackup
adb shell pm uninstall --user 0 com.android.emergency					#emergency contacts
adb shell pm uninstall --user 0 com.android.email						#default (stock) email app 	
adb shell pm uninstall --user 0 com.android.gallery3d					#Gallery

#3rd-party apps
#facebook
adb shell pm uninstall --user 0 com.facebook.services
adb shell pm uninstall --user 0 com.facebook.katana
adb shell pm uninstall --user 0 com.facebook.orca
adb shell pm uninstall --user 0 com.facebook.system
adb shell pm uninstall --user 0 com.facebook.appmanager
#gameloft
adb shell pm uninstall --user 0 com.gameloft.android.GloftANPH
adb shell pm uninstall --user 0 com.gameloft.android.GloftDBMF
adb shell pm uninstall --user 0 com.gameloft.android.GloftDMKF
adb shell pm uninstall --user 0 com.gameloft.android.GloftPDMF
adb shell pm uninstall --user 0 com.gameloft.android.GloftSMIF
adb shell pm uninstall --user 0 com.gameloft.android.GloftSOMP
#more junk
adb shell pm uninstall --user 0 com.daoke.ar
adb shell pm uninstall --user 0 com.wego.android
adb shell pm uninstall --user 0 com.netflix.partner.activation
adb shell pm uninstall --user 0 com.netflix.mediaclient
adb shell pm uninstall --user 0 com.stupeflix.replay
adb shell pm uninstall --user 0 com.hicloud.android.clone			
adb shell pm uninstall --user 0 com.example.android.notepad				#notepad	
adb shell pm uninstall --user 0 com.qeexo.smartshot
adb shell pm uninstall --user 0 com.igg.android.lordsmobile
adb shell pm uninstall --user 0 com.playwing.acu.huawei
adb shell pm uninstall --user 0 com.booking								#Booking.com
adb shell pm uninstall --user 0 com.jb.zcamera
