#
# Copyright (C) 2020-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

import common
import re

def FullOTA_InstallEnd(info):
    OTA_InstallEnd(info, False)
    return

def IncrementalOTA_InstallEnd(info):
    OTA_InstallEnd(info, True)
    return

def AddImage(info, basename, dest, incremental):
    name = basename
    if incremental:
      input_zip = info.source_zip
    else:
      input_zip = info.input_zip
    data = input_zip.read("IMAGES/" + basename)
    common.ZipWriteStr(info.output_zip, name, data)
    info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))
    info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def OTA_InstallEnd(info, incremental):
    AddImage(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo", incremental)
    AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta", incremental)
    return
