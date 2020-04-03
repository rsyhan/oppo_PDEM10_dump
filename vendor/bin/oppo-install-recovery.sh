#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0b225f4ba2f8b6dcfa7f166261c29684467397da; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:67ad91be802cb97d7d4a7882a7dfe4c31d408159 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:0b225f4ba2f8b6dcfa7f166261c29684467397da && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
