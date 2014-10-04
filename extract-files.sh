#!/bin/sh

VENDOR=micromax
DEVICE=a116

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi

cp /home/kashif/system/$FILE $BASE/$FILE

#adb pull /system/$FILE $BASE/$FILE
done

# some extra stuff
cp /home/kashif/system/lib/hw/audio_policy.default.so $BASE/lib/hw/audio_policy.mt6589.so
cp /home/kashif/system/lib/libaudio.primary.default.so $BASE/lib/hw/audio.primary.mt6589.so

#adb pull /system/lib/hw/audio_policy.default.so $BASE/lib/hw/audio_policy.mt6589.so
#adb pull /system/lib/libaudio.primary.default.so $BASE/lib/hw/audio.primary.mt6589.so

./setup-makefiles.sh
