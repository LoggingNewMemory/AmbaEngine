#!/system/bin/sh

sleep 1

# Path
BASEDIR=/data/adb/modules/AmbaEngine
INT=/storage/emulated/0/
RWD=$INT/SakuraAi
LOG=$RWD/SakuraAi.log
MSC=$BASEDIR/script
BAL=$MSC/sakuraai_balance.sh
PERF=$MSC/sakuraai_performance.sh
SAV=$MSC/sakuraai_powersaver.sh

# Check rewrite directory
if [ ! -e $RWD ]; then
  mkdir $RWD
fi

echo " " > $LOG
echo " Device info: " >> $LOG
echo " • Brand           : $(getprop ro.product.system.brand) " >> $LOG
echo " • Device          : $(getprop ro.product.system.model) " >> $LOG
echo " • Processor       : $(getprop ro.product.board) " >> $LOG
echo " • Android Version : $(getprop ro.system.build.version.release)" >> $LOG
echo " • SDK Version     : $(getprop ro.build.version.sdk) " >> $LOG
echo " • Architecture    : $(getprop ro.product.cpu.abi) " >> $LOG
echo " • Kernel Version  : $(uname -r)" >> $LOG
echo " " >> $LOG

echo " Profile Mode:" >> $LOG

# Check applist file
if [ ! -e $RWD/applist_perf.txt ]; then
  cp -f $MSC/applist_perf.txt $RWD
fi

# Begin of AI
sed -Ei 's/^description=(\[.*][[:space:]]*)?/description=[⚙️ AmbaEngine Starting] /g' "$BASEDIR/module.prop"
am start -a android.intent.action.MAIN -e toasttext "⚙️ AmbaEngine Starting" -n bellavita.toast/.MainActivity

# Start AI
setprop sakuraai.mode notset
prev_screen_status=""

while true; do
   app_list_filter="grep -o -e applist.app.add"
   while IFS= read -r applist || [[ -n "$applist" ]]; do
        filter=$(echo "$applist" | awk '!/ /')
        if [[ -n "$filter" ]]; then
          app_list_filter+=" -e "$filter
        fi
   done < "$RWD/applist_perf.txt"
   window=$(dumpsys window | grep package | $app_list_filter | tail -1)
   if [[ "$window" ]]; then
     if [[ $(getprop sakuraai.mode) == "performance" ]]; then
       echo " "
     else
       sh $PERF
     fi
   else
     if [[ $(getprop sakuraai.mode) == "balance" ]]; then
       echo " "
     else
       sh $BAL
     fi
   fi

   screen_status=$(dumpsys window | grep "mScreenOn" | grep false)
   if [[ "$screen_status" != "$prev_screen_status" ]]; then
      prev_screen_status="$screen_status"
   fi

   # Trigger powersaver mode if the screen is off
   if [[ "$screen_status" ]]; then
      if [[ $(getprop sakuraai.mode) == "powersaver" ]]; then
         echo " "
      else
         sh $SAV
      fi
   fi
done