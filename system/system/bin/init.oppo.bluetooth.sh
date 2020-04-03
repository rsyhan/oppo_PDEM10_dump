#! /system/bin/sh
#***********************************************************
#** Copyright (C), 2008-2016, OPPO Mobile Comm Corp., Ltd.
#** VENDOR_EDIT
#**
#** Version: 1.0
#** Date : 2019/06/25
#** Author: Liangwen.Ke@PSW.CN.BT.Basic.Customize.2120948
#** Add  for supporting QC firmware update by sau_res
#**
#** ---------------------Revision History: ---------------------
#**  <author>    <data>       <version >       <desc>
#**  Liangwen.Ke 2019.6.25      1.0            build this module
#****************************************************************/

config="$1"

saufwdir="/data/oppo/common/sau_res/res/SAU-AUTO_LOAD_FW-10/"
pushfwdir="/data/vendor/bluetooth/fw/"
pushdatadir="data/misc/bluedroid/"

# cp bt sau file to data/vendor/bluetooth dir
function btfirmwareupdate() {

    if [ -f ${saufwdir}/htbtfw20.tlv ]; then
        cp  ${saufwdir}/htbtfw20.tlv ${pushfwdir}
        chown bluetooth:bluetooth ${pushfwdir}/htbtfw20.tlv
        chmod 0440 bluetooth:bluetooth ${pushfwdir}/htbtfw20.tlv
    fi

    if [ -f ${saufwdir}/htnv20.bin ]; then
        cp  ${saufwdir}/htnv20.bin  ${pushfwdir}
        chown bluetooth:bluetooth ${pushfwdir}/htnv20.bin
        chmod 0440 bluetooth:bluetooth ${pushfwdir}/htnv20.bin
    fi

    if [ -f ${saufwdir}/htbtfw20.ver ]; then
        cp  ${saufwdir}/htbtfw20.ver  ${pushfwdir}
        cp  ${saufwdir}/htbtfw20.ver  ${pushdatadir}
        chown bluetooth:bluetooth ${pushfwdir}/htbtfw20.ver
        chown bluetooth:bluetooth ${pushdatadir}/htbtfw20.ver
        chmod 0440 bluetooth:bluetooth ${pushfwdir}/htbtfw20.ver
        chmod 0440 bluetooth:bluetooth ${pushdatadir}/htbtfw20.ver
    fi
}

# delete all bt sau file
function btfirmwaredelete() {

    if [ -f ${saufwdir}/htbtfw20.tlv ]; then
        rm -rf  ${saufwdir}/htbtfw20.tlv
    fi

    if [ -f ${pushfwdir}/htbtfw20.tlv ]; then
        rm -rf  ${pushfwdir}/htbtfw20.tlv
    fi

    if [ -f ${saufwdir}/htnv20.bin ]; then
        rm -rf  ${saufwdir}/htnv20.bin
    fi

    if [ -f ${pushfwdir}/htnv20.bin ]; then
        rm -rf  ${pushfwdir}/htnv20.bin
    fi

    if [ -f ${saufwdir}/htbtfw20.ver ]; then
        rm -rf  ${saufwdir}/htbtfw20.ver
    fi

    if [ -f ${pushfwdir}/htbtfw20.ver ]; then
        rm -rf  ${pushfwdir}/htbtfw20.ver
    fi

    if [ -f ${pushdatadir}/htbtfw20.ver ]; then
        rm -rf  ${pushdatadir}/htbtfw20.ver
    fi
}

case "$config" in
    "btfirmwareupdate")
        btfirmwareupdate
    ;;

    "btfirmwaredelete")
        btfirmwaredelete
    ;;
esac
