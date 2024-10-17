ui_print "🗡--------------------------------🗡"
ui_print " AmbaEngine SakuraAI Port for D6080 "
ui_print "🗡--------------------------------🗡"
ui_print "         By: Kanagawa Yamada        "
ui_print "------------------------------------"
ui_print "      READ THE TELEGRAM MESSAGE     "
ui_print "------------------------------------"
ui_print " "

sleep 1
ui_print "------------------------------------"
ui_print "⚠️            WARNING             ⚠️"
ui_print "------------------------------------"
ui_print "    DO NOT COMBINE THIS WITH ANY    "
ui_print "        PERFORMANCE MODULE          "
ui_print "------------------------------------"
ui_print "  ALLOW TOAST APP IF DETECTED FROM  "
ui_print "           PLAY PROTECT             "
ui_print "------------------------------------"
ui_print " "

ui_print "-----------------📱-----------------"
ui_print "            DEVICE INFO             "
ui_print "-----------------📱-----------------"
ui_print "DEVICE : $(getprop ro.build.product) "
ui_print "MODEL : $(getprop ro.product.model) "
ui_print "MANUFACTURE : $(getprop ro.product.system.manufacturer) "
ui_print "PROC : $(getprop ro.product.board) "
ui_print "CPU : $(getprop ro.hardware) "
ui_print "ANDROID VER : $(getprop ro.build.version.release) "
ui_print "KERNEL : $(uname -r) "
ui_print "RAM : $(free | grep Mem |  awk '{print $2}') "
ui_print " "
sleep 1.5

ui_print "-----------------🗡-----------------"
ui_print "            MODULE INFO             "
ui_print "-----------------🗡-----------------"
ui_print "Name : AmbaEngine SakuraAI Port "
ui_print "Version : V1.0 Hotfix"
ui_print "Support Device : MT 6833 / D 6080"
ui_print "Support Root : Magisk / KernelSU"
ui_print " "
sleep 1.5

set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/script 0 0 0755 0755

# Install toast app
ui_print "Installing Toast app"
pm install $MODPATH/Toast.apk
ui_print " "

# Check rewrite directory
if [ ! -e /storage/emulated/0/SakuraAi ]; then
  mkdir /storage/emulated/0/SakuraAi
fi

# Check applist file
if [ ! -e /storage/emulated/0/SakuraAi/applist_perf.txt ]; then
  cp -f $MODPATH/script/applist_perf.txt /storage/emulated/0/SakuraAi
fi

am start -a android.intent.action.VIEW -d https://t.me/KanagawaLabAnnouncement/132 >/dev/null 2>&1 &
