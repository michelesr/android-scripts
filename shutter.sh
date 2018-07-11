# Disable video recording shutter sound
#
# You may need to run this after every system update

# Run as root and reboot after

# remount /system in read-write to allow changes
mount /system -o remount,rw

# sounds to disable
target=/system/media/audio/ui/Video{Record,Stop}*

# make audio files readable only by root to prevented their playback
chmod 600 $target

# list the directory for visual verification
ls -l $target

# remount /system in read-only
mount /system -o remount,ro
