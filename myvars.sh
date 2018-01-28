#!/bin/bash
my_tool="/proj/xhdsswstaff/murrahma/tool/source/skeleton_dist"
my_full_tool="/scratch/sdb1/tool"
my_patches="/proj/xhdsswstaff/murrahma/tool/source/patches"
all_scripts="tools/common/petalinux/bin/scripts/petalinux-* tools/common/petalinux/bin/scripts/utils"
my_alias="/proj/xhdsswstaff/murrahma/my_work/learn/bash/scripts"
my_builds="/scratch/sdb1/builds"
sdk_installers="/proj/petalinux/yocto/yocto_sdk_latest_2017.3/sdk-installers"
all_vars()
{
echo "\$my_tool - My Tool sources directoty"
echo "\$my_full_tool - My full Tool sources directoty"
echo "\$all_scripts - to search in all scripts"
echo "\$my_alias - All my alias scripts"
echo "\$my_patches - All my patches directoty"
echo "\$my_builds - All builds directoty"
echo "\$sdk_installers - All sdk installers directoty"
}
