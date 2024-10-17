#!/system/bin/sh

# Sync to data in the rare case a device crashes
sync

# Functions
read_file(){
  if [[ -f $1 ]]; then
    if [[ ! -r $1 ]]; then
      chmod +r "$1"
    fi
    cat "$1"
  else
    echo "File $1 not found"
  fi
}

# Path
BASEDIR=/data/adb/modules/SakuraAi
LOG=/storage/emulated/0/SakuraAi/Powersaver.log

# CPU SET ONLINE

for cpus in /sys/devices/system/cpu
    do
        chmod 644 $cpus/cpu0/online
        chmod 644 $cpus/cpu1/online
        chmod 644 $cpus/cpu2/online
        chmod 644 $cpus/cpu3/online
        chmod 644 $cpus/cpu4/online
        chmod 644 $cpus/cpu5/online
        chmod 644 $cpus/cpu6/online
        chmod 644 $cpus/cpu7/online

        echo 1 > "$cpus/cpu0/online"
        echo 1 > "$cpus/cpu1/online"
        echo 1 > "$cpus/cpu2/online"
        echo 1 > "$cpus/cpu3/online"
        echo 0 > "$cpus/cpu4/online"
        echo 0 > "$cpus/cpu5/online"
        echo 0 > "$cpus/cpu6/online"
        echo 0 > "$cpus/cpu7/online"
    done


# CPU SET MIN FREQUENCY
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo "1500000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "1500000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo "1500000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo "1500000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq


# CPU SET MAX FREQUENCY
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo "1500000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "1500000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "1500000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo "1500000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq

# CPU SET POLICY MAX FREQUENCY 
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo "1500000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq

# GPU Configure
echo "-1" > /proc/gpufreqv2/fix_target_opp_index

#  Governor CPU0
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
#  Governor CPU6
chmod 644 /sys/devices/system/cpu/cpufreq/policy6/scaling_governor
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor

# GPU Tweaks
chmod 644 /sys/class/devfreq/mtk-dvfsrc-devfreq/governor
chmod 644 /sys/class/devfreq/13000000.mali/governor
echo "powersave" > /sys/class/devfreq/mtk-dvfsrc-devfreq/governor
echo "powersave" > /sys/class/devfreq/13000000.mali/governor

echo "00" > /proc/gpufreqv2/fix_target_opp_index
echo "coarse_demand" > /sys/class/misc/mali0/device/power_policy
echo "enable" > /proc/gpufreqv2/aging_mode

chmod 644 /sys/class/devfreq/13000000.mali/min_freq
chmod 644 /sys/class/devfreq/mtk-dvfsrc-devfreq/min_freq
chmod 644 /sys/class/devfreq/13000000.mali/cur_freq
chmod 644 /sys/class/devfreq/mtk-dvfsrc-devfreq/cur_freq

echo 1068000000 > /sys/class/devfreq/13000000.mali/min_freq
echo 4266000000 > /sys/class/devfreq/mtk-dvfsrc-devfreq/min_freq

echo 1068000000 > /sys/class/devfreq/13000000.mali/max_freq
echo 4266000000 > /sys/class/devfreq/mtk-dvfsrc-devfreq/max_freq

#dislowpower
echo "1" > /proc/displowpower/hrt_lp
echo "1" > /proc/displowpower/idlevfp
echo "50" > /proc/displowpower/idletime

# scheduler

echo "2" > /proc/sys/vm/drop_caches
echo "1" > /proc/sys/kernel/sched_migration_cost_ns
echo "75" > /proc/sys/kernel/perf_cpu_time_max_percent
echo "1000000" > /proc/sys/kernel/sched_latency_ns
echo "256" > /proc/sys/kernel/sched_util_clamp_max
echo "256" > /proc/sys/kernel/sched_util_clamp_min
echo "1" > /proc/sys/kernel/sched_child_runs_first
echo "1" > /proc/sys/kernel/sched_tunable_scaling
echo "1" > /proc/sys/kernel/sched_energy_aware
echo "1" > /proc/sys/kernel/sched_util_clamp_min_rt_default
echo "2000000" > /proc/sys/kernel/sched_deadline_period_max_us
echo "200000" > /proc/sys/kernel/sched_deadline_period_min_us

    for sda in /sys/block/sda/queue
    do
        echo 0 > "$sda/add_random"
        echo 0 > "$sda/iostats"
        echo 2 > "$sda/nomerges"
        echo 2 > "$sda/rq_affinity"
        echo 0 > "$sda/rotational"
        echo 128 > "$sda/nr_requests"
        echo 512 > "$sda/read_ahead_kb"
    done
    for sdb in /sys/block/sdb/queue
    do
        echo 0 > "$sdb/add_random"
        echo 0 > "$sdb/iostats"
        echo 2 > "$sdb/nomerges"
        echo 2 > "$sdb/rq_affinity"
        echo 0 > "$sdb/rotational"
        echo 128 > "$sdb/nr_requests"
        echo 512 > "$sdb/read_ahead_kb"
    done
    for sdc in /sys/block/sdc/queue
    do
        echo 0 > "$sdc/add_random"
        echo 0 > "$sdc/iostats"
        echo 2 > "$sdc/nomerges"
        echo 2 > "$sdc/rq_affinity"
        echo 0 > "$sdc/rotational"
        echo 128 > "$sdc/nr_requests"
        echo 512 > "$sdc/read_ahead_kb"
    done
    for dm0 in /sys/block/dm-0/queue
    do
        echo 0 > "$dm0/add_random"
        echo 0 > "$dm0/iostats"
        echo 2 > "$dm0/nomerges"
        echo 2 > "$dm0/rq_affinity"
        echo 0 > "$dm0/rotational"
        echo 128 > "$dm0/nr_requests"
        echo 512 > "$dm0/read_ahead_kb"
    done
    
    # I/O scheduler
    for queue in /sys/block/*/queue
    do
        echo 512 > "$queue/read_ahead_kb"
        echo 128 > "$queue/nr_requests"
        echo 2 > "$queue/rq_affinity"
        echo 2 > "$dm0/nomerges"
        echo 0 > "$queue/add_random"
        echo 0 > "$queue/iostats"
        echo 0 > "$dm0/rotational"
    done

# Power Level
echo "on" > /sys/devices/system/cpu/power/control
echo "0" > /sys/devices/system/cpu/perf/gpu_pmu_enable
echo "100000" > /sys/devices/system/cpu/perf/gpu_pmu_period
echo "0" > /sys/devices/system/cpu/perf/fuel_gauge_enable
echo "teo" > /sys/devices/system/cpu/cpuidle/current_governor
echo "0" > /sys/devices/system/cpu/perf/enable
echo "1" > /sys/devices/system/cpu/perf/charger_enable

# VirtualMemory
echo "15" > /proc/sys/vm/dirty_background_ratio
echo "25" > /proc/sys/vm/dirty_ratio
echo "10" > /proc/sys/vm/vfs_cache_pressure
echo "30" > /proc/sys/vm/dirty_expire_centisecs
echo "50" > /proc/sys/vm/dirty_writeback_centisecs
echo "0" > /proc/sys/vm/oom_dump_tasks
echo "0" > /proc/sys/vm/page-cluster
echo "0" > /proc/sys/vm/block_dump
echo "10" > /proc/sys/vm/stat_interval
echo "50" > /proc/sys/vm/compaction_proactiveness
echo "0" > /proc/sys/vm/watermark_boost_factor
echo "20" > /proc/sys/vm/watermark_scale_factor
echo "35" > /dev/memcg/memory.swappiness
echo "30" > /dev/memcg/apps/memory.swappiness
echo "80" > /dev/memcg/system/memory.swappiness

# CPU SET
echo "0-6" > /dev/cpuset/cpus
echo "0-1" > /dev/cpuset/background/cpus
echo "0-3" > /dev/cpuset/system-background/cpus
echo "0-6" > /dev/cpuset/foreground/cpus
echo "0-6" > /dev/cpuset/top-app/cpus
echo "0-2" > /dev/cpuset/restricted/cpus
echo "0-6" > /dev/cpuset/camera-daemon/cpus
echo "0" > /dev/cpuset/memory_pressure_enabled

# Power Save Mode On
settings put global low_power 1

# Set powersave
setprop sakuraai.mode powersaver
echo " •> AmbaEngine Powersave activated at $(date "+%H:%M:%S")" >> $LOG

# Report
sed -Ei 's/^description=(\[.*][[:space:]]*)?/description=[🔋 AmbaEngine Powersave] /g' "$BASEDIR/module.prop"
am start -a android.intent.action.MAIN -e toasttext "🔋 AmbaEngine Powersave" -n bellavita.toast/.MainActivity

exit 0