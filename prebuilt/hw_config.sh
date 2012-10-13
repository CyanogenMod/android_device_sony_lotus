# HW configuration file for pepper
# Touch FW loader
dev=/sys/bus/spi/devices/spi9.0
app_id=`cat  $dev/appid`
case `cat /data/ttsp_fw_update` in
        "in_progress") flags=-force ;;
        *) flags=-no-downgrade ;;
esac
case "$app_id" in
	"0x3030")
		flags=-force
	;;
esac
echo "in_progress" > /data/ttsp_fw_update
cyttsp_fwloader -dev $dev -fw /system/etc/firmware/ttsp_fw.hex $flags
echo "done" > /data/ttsp_fw_update

# Audio jack configuration
dev=/sys/devices/platform/simple_remote.0
echo 0,301,1901 > $dev/accessory_min_vals
echo 300,1900  > $dev/accessory_max_vals
echo 0,51,251,511,851 > $dev/button_min_vals
echo 50,250,510,850,5000  > $dev/button_max_vals

# ALS configuration
dev=/sys/bus/i2c/devices/2-0040/
echo 250 > $dev/als_filter_up_speed_mHz
echo 250 > $dev/als_filter_down_speed_mHz
echo 46,1,34,173,35,255,0> $dev/als_group2
echo 255,35,-127,37,-128,0,0 > $dev/als_group3
echo 1 > $dev/leds/lcd-backlight/use_dls
echo 0x90=0x02 > $dev/debug

# Proximity sensor configuration
dev=/sys/bus/i2c/devices/2-0054/
val_cycle=0
val_nburst=1
val_freq=0
val_threshold=2
val_filter=0

echo $val_cycle > $dev/cycle    # Duration Cycle. Valid range is 0 - 3.
echo $val_nburst > $dev/nburst  # Numb er of pulses in burst. Valid range is 0 - 15.
echo $val_freq > $dev/freq      # Burst frequency. Valid range is 0 - 3.
echo $val_threshold > $dev/threshold # sensor threshold. Valid range is 0 - 15 (0.12V - 0.87V)
echo $val_filter > $dev/filter  # RFilter. Valid range is 0 - 3.
