#!/bin/bash

# based on https://github.com/BlackMesa123/proprietary_vendor_samsung_a52sxq/blob/main/.github/workflows/check.yml#L137

# extract vbmeta.img
lz4 -d vbmeta.img.lz4 vbmeta.img

# remove old lz4 file
rm vbmeta.img.lz4

# create empty vbmeta
printf "$(printf '\\x%02X' 3)" | dd of="vbmeta.img" bs=1 seek=123 count=1 conv=notrunc &> /dev/null

# pack to tar
tar cvf patched_vbmeta.tar vbmeta.img

# remove vbmeta.img
rm vbmeta.img
