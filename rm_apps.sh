# Remove unwanted system apps from the phone
#
# You may need to run this after every system update if apps get reinstalled

# Run as root and reboot after

# remount /system in read-write to allow changes
mount /system -o remount,rw

# Directory in your internal storage (or sdcard) where the packages will be moved
# IMPORTANT: if the app folder contains a symlink that won't be neither backed up or deleted
BACKUP_DIR=/sdcard/backup

# create backup dirs
mkdir -p $BACKUP_DIR/app
mkdir -p $BACKUP_DIR/priv-app

cd /system/app
mv -fv messaging CarrierDefaultApp CtsShimPrebuilt AntHalService Profiles LatinIME \
       BasicDreams LockClock Calendar Email PhotoTable PicoTts Jelly NfcNci HTMLViewer \
       EasterEgg FaceLock GoogleContactsSyncAdapter GoogleCalendarSyncAdapter $BACKUP_DIR/app/

cd /system/priv-app
mv -fv ManagedProvisioning CarrierConfig CtsShimPrivPrebuilt Velvet MmsService LineageSetupWizard \
       SetupWizard AudioFX Tag Turbo Eleven Snap CalendarProvider CallLogBackup WeatherProvider \
       Trebuchet GoogleBackupTransport GoogleOneTimeInitializer GooglePartnerSetup GoogleFeedback \
       EmergencyInfo $BACKUP_DIR/priv-app/

# remount /system in read-only
mount /system -o remount,ro
