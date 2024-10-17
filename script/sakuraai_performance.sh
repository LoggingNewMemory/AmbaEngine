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
BASEDIR=/data/adb/modules/AmbaEngine
LOG=/storage/emulated/0/SakuraAi/Performance.log

# CPU SET

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
        echo 1 > "$cpus/cpu4/online"
        echo 1 > "$cpus/cpu5/online"
        echo 1 > "$cpus/cpu6/online"
        echo 1 > "$cpus/cpu7/online"
    done

#  Governor CPU0
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
#  Governor CPU6
chmod 644 /sys/devices/system/cpu/cpufreq/policy6/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor

# GPU Tweaks
chmod 644 /sys/class/devfreq/mtk-dvfsrc-devfreq/governor
chmod 644 /sys/class/devfreq/13000000.mali/governor
echo "performance" > /sys/class/devfreq/mtk-dvfsrc-devfreq/governor
echo "performance" > /sys/class/devfreq/13000000.mali/governor
chmod 444 /sys/class/devfreq/mtk-dvfsrc-devfreq/governor
chmod 444 /sys/class/devfreq/13000000.mali/governor

echo 0 > /proc/trans_scheduler/enable
echo 1 > /proc/game_state

echo "-1" > /proc/gpufreqv2/fix_target_opp_index
echo "always_on" > /sys/class/misc/mali0/device/power_policy
echo "enable" > /proc/gpufreqv2/aging_mode

chmod 644 /sys/class/devfreq/13000000.mali/min_freq
chmod 644 /sys/class/devfreq/mtk-dvfsrc-devfreq/min_freq

echo 1068000000 > /sys/class/devfreq/13000000.mali/min_freq
echo 4266000000 > /sys/class/devfreq/mtk-dvfsrc-devfreq/min_freq

echo 1068000000 > /sys/class/devfreq/13000000.mali/max_freq
echo 4266000000 > /sys/class/devfreq/mtk-dvfsrc-devfreq/max_freq

# Disable battery current limiter
echo "stop 1" > /proc/mtk_batoc_throttling/battery_oc_protect_stop

# CPU SET MIN FREQUENCY
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo "20000000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "20000000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo "20000000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo "20000000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
echo "20000000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "20000000" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo "24000000" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
echo "24000000" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq


# CPU SET MAX FREQUENCY
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo "20000000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "20000000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "20000000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo "20000000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
echo "20000000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo "20000000" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
echo "24000000" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
echo "24000000" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq

# CPU SET POLICY MAX FREQUENCY 
chmod 644 /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo "20000000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo "24000000" > /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq

for cs in /dev/cpuset
    do
        echo 0-7 > "$cs/cpus"
        echo 0-7 > "$cs/background/cpus"
        echo 0-3 > "$cs/system-background/cpus"
        echo 0-7 > "$cs/foreground/cpus"
        echo 0-7 > "$cs/top-app/cpus"
        echo 0-3 > "$cs/restricted/cpus"
        echo 0-7 > "$cs/camera-daemon/cpus"
        echo 0 > "$cs/memory_pressure_enabled"
        echo 0 > "$cs/sched_load_balance"
        echo 0 > "$cs/foreground/sched_load_balance"
    done

# CPU Tweaks

echo 0 > /dev/cpuset/memory_pressure_enabled
echo 0 > /dev/cpuset/sched_load_balance
echo 0 > /dev/cpuset/foreground/sched_load_balance
echo 0 > /dev/cpuset/foreground-l/sched_load_balance
echo 0 > /dev/cpuset/dex2oat/sched_load_balance
echo 1 > /dev/cpuctl/rt/cpu.uclamp.latency_sensitive
echo 1 > /dev/cpuctl/foreground/cpu.uclamp.latency_sensitive
echo 1 > /dev/cpuctl/nnapi-hal/cpu.uclamp.latency_sensitive
echo 1 > /dev/cpuctl/dex2oat/cpu.uclamp.latency_sensitive
echo 1 > /dev/cpuctl//top-app/cpu.uclamp.latency_sensitive
echo 1 > /dev/cpuctl/foreground-l/cpu.uclamp.latency_sensitive

echo 3 > /proc/cpufreq/cpufreq_power_mode
echo 1 > /proc/cpufreq/cpufreq_cci_mode
echo 1 > /proc/cpufreq/cpufreq_sched_disable

echo 1 > /sys/devices/system/cpu/perf/enable

# DRAM Tweaks
echo "0" > /sys/kernel/helio-dvfsrc/dvfsrc_force_vcore_dvfs_opp

# Memory Optimization

echo "always" > /sys/kernel/mm/transparent_hugepage/enabled
echo "always" > /sys/kernel/mm/transparent_hugepage/shmem_enabled

# Kernel Scheduler Tweaks

echo 500000 > /proc/sys/kernel/sched_migration_cost_ns
echo 5 > /proc/sys/kernel/perf_cpu_time_max_percent
echo 1000000 > /proc/sys/kernel/sched_latency_ns
echo 1024 > /proc/sys/kernel/sched_util_clamp_max
echo 1024 > /proc/sys/kernel/sched_util_clamp_min
echo 1 > /proc/sys/kernel/sched_tunable_scaling
echo 1 > /proc/sys/kernel/sched_child_runs_first
echo 0 > /proc/sys/kernel/sched_energy_aware
echo 1 > /proc/sys/kernel/sched_util_clamp_min_rt_default
echo 4194304 > /proc/sys/kernel/sched_deadline_period_max_us
echo 100 > /proc/sys/kernel/sched_deadline_period_min_us
echo 0 > /proc/sys/kernel/sched_schedstats

# Dislowpower
for dlp in /proc/displowpower
    do
        echo 1 > "$dlp/hrt_lp"
        echo 1 > "$dlp/idlevfp"
        echo 100 > "$dlp/idletime"
    done
    
# Kernel Scheduler
for sch in /proc/sys/kernel
do
    echo 100000 > "$sch/sched_migration_cost_ns"
    echo 5 > "$sch/perf_cpu_time_max_percent"
    echo 200000 > "$sch/sched_latency_ns"
    echo 1024 > "$sch/sched_util_clamp_max"
    echo 512 > "$sch/sched_util_clamp_min"
    echo 2 > "$sch/sched_tunable_scaling"
    echo 1 > "$sch/sched_child_runs_first"
    echo 0 > "$sch/sched_energy_aware"
    echo 8 > "$sch/sched_nr_migrate"
    echo 2 > "$sch/sched_pelt_multiplier"
    echo 25 > "$sch/sched_util_clamp_min_rt_default"
    echo 200 > "$sch/sched_deadline_period_max_us"
    echo 100 > "$sch/sched_deadline_period_min_us"
    echo 0 > "$sch/sched_schedstats"
    echo 3000000 > "$sch/sched_wakeup_granularity_ns"
    echo 1000000 > "$sch/sched_min_granularity_ns"
done

    for sda in /sys/block/sda/queue
    do
        echo 0 > "$sda/add_random"
        echo 0 > "$sda/iostats"
        echo 2 > "$sda/nomerges"
        echo 2 > "$sda/rq_affinity"
        echo 0 > "$sda/rotational"
        echo 256 > "$sda/nr_requests"
        echo 4096 > "$sda/read_ahead_kb"
    done
    for sdb in /sys/block/sdb/queue
    do
        echo 0 > "$sdb/add_random"
        echo 0 > "$sdb/iostats"
        echo 2 > "$sdb/nomerges"
        echo 2 > "$sdb/rq_affinity"
        echo 0 > "$sdb/rotational"
        echo 256 > "$sdb/nr_requests"
        echo 4096 > "$sdb/read_ahead_kb"
    done
    for sdc in /sys/block/sdc/queue
    do
        echo 0 > "$sdc/add_random"
        echo 0 > "$sdc/iostats"
        echo 2 > "$sdc/nomerges"
        echo 2 > "$sdc/rq_affinity"
        echo 0 > "$sdc/rotational"
        echo 256 > "$sdc/nr_requests"
        echo 4096 > "$sdc/read_ahead_kb"
    done
    for dm0 in /sys/block/dm-0/queue
    do
        echo 0 > "$dm0/add_random"
        echo 0 > "$dm0/iostats"
        echo 2 > "$dm0/nomerges"
        echo 2 > "$dm0/rq_affinity"
        echo 0 > "$dm0/rotational"
        echo 256 > "$dm0/nr_requests"
        echo 4096 > "$dm0/read_ahead_kb"
    done
    
# I/O scheduler

    for queue in /sys/block/*/queue
    do
        echo 4096 > "$queue/read_ahead_kb"
        echo 256 > "$queue/nr_requests"
        echo 2 > "$queue/rq_affinity"
        echo 2 > "$dm0/nomerges"
        echo 0 > "$queue/add_random"
        echo 0 > "$queue/iostats"
        echo 0 > "$dm0/rotational"
    done

# Kernel Tweaks

echo "-1" > /proc/sys/kernel/sched_rt_period_us
echo "-1" > /proc/sys/kernel/sched_rt_runtime_us
echo "-1" > /proc/sys/kernel/sched_rt_runtime_us
echo "-1" > /proc/sys/kernel/sched_rt_period_us
echo "-1" > /proc/sys/kernel/sched_rt_period_us
echo "4" > /proc/sys/kernel/sched_pelt_multiplier
echo "teo" > /sys/devices/system/cpu/cpuidle/current_governor

echo "0" > /proc/sys/kernel/panic
echo "0" > /proc/sys/kernel/panic_on_oops
echo "0" > /proc/sys/kernel/panic_on_rcu_stall
echo "0" > /proc/sys/kernel/panic_on_warn
echo "0" > /sys/module/kernel/parameters/panic_on_warn
echo "0 0 0 0" > /proc/sys/kernel/printk
echo "off" > /proc/sys/kernel/printk_devkmsg

# RAM Tweaks

echo "2048" > /sys/block/ram0/bdi/read_ahead_kb
echo "2048" > /sys/block/ram1/bdi/read_ahead_kb
echo "2048" > /sys/block/ram2/bdi/read_ahead_kb
echo "2048" > /sys/block/ram3/bdi/read_ahead_kb
echo "2048" > /sys/block/ram4/bdi/read_ahead_kb
echo "2048" > /sys/block/ram5/bdi/read_ahead_kb
echo "2048" > /sys/block/ram6/bdi/read_ahead_kb
echo "2048" > /sys/block/ram7/bdi/read_ahead_kb
echo "2048" > /sys/block/ram8/bdi/read_ahead_kb
echo "2048" > /sys/block/ram8/bdi/read_ahead_kb
echo "2048" > /sys/block/ram9/bdi/read_ahead_kb
echo "2048" > /sys/block/ram10/bdi/read_ahead_kb
echo "2048" > /sys/block/ram11/bdi/read_ahead_kb
echo "2048" > /sys/block/ram12/bdi/read_ahead_kb
echo "2048" > /sys/block/ram13/bdi/read_ahead_kb
echo "2048" > /sys/block/ram14/bdi/read_ahead_kb
echo "2048" > /sys/block/ram15/bdi/read_ahead_kb

# Mali Tweaks

echo "0" > /sys/class/misc/mali0/device/js_ctx_scheduling_mode
echo "-1" > /sys/module/task_turbo/parameters/feats
echo "1" > /sys/kernel/helio-dvfsrc/dvfsrc_qos_mode

# Power Level
for pl in /sys/devices/system/cpu/perf
    do
        echo 1 > "$pl/gpu_pmu_enable"
        echo 1000000 > "$pl/gpu_pmu_period"
        echo 1 > "$pl/fuel_gauge_enable"
        echo 1 > "$pl/enable"
        echo 1 > "$pl/charger_enable"
    done

# VirtualMemory
    for sw in /dev/memcg
    do
        echo 30 > "$sw/memory.swappiness"
        echo 30 > "$sw/apps/memory.swappiness"
        echo 55 > "$sw/system/memory.swappiness"
    done

# Disable Battery Efficient

cmd power set-adaptive-power-saver-enabled false
cmd looper_stats disable

# FPSGo & GED Parameter

chmod 644 /sys/module/sspm/holders/ged/parameters/is_GED_KPI_enabled
echo '0' > /sys/module/sspm/holders/ged/parameters/is_GED_KPI_enabled

chmod 644 /sys/kernel/fpsgo/fbt/*
chmod 644 /sys/kernel/fpsgo/fstb/*

echo 1 > /sys/kernel/fpsgo/fbt/enable_uclamp_boost

echo "1" > /sys/pnpmgr/fpsgo_boost/boost_mode
echo "0" > /sys/pnpmgr/mwn
echo "2" > /sys/module/mtk_fpsgo/parameters/bhr_opp
echo "1" > /sys/module/mtk_fpsgo/parameters/bhr_opp_l
echo "1" > /sys/module/mtk_fpsgo/parameters/boost_affinity
echo "1" > /sys/module/mtk_fpsgo/parameters/xgf_uboost
echo "-1" > /sys/module/mtk_fpsgo/parameters/uboost_enhance_f
echo "1" > /sys/module/mtk_fpsgo/parameters/gcc_fps_margin
echo "1" > /sys/module/mtk_fpsgo/parameters/rescue_enhance_f
echo "1" > /sys/module/mtk_fpsgo/parameters/qr_mod_frame
echo "1" > /sys/module/mtk_fpsgo/parameters/fstb_separate_runtime_enable
echo "1" > /sys/module/mtk_fpsgo/parameters/fstb_consider_deq
echo "0" > /sys/pnpmgr/fpsgo_boost/fstb/fstb_tune_quantile
echo "1" > /sys/pnpmgr/fpsgo_boost/fstb/fstb_tune_error_threshold
echo "1" > /sys/pnpmgr/fpsgo_boost/fstb/margin_mode
echo "2" > /sys/pnpmgr/fpsgo_boost/fbt/bhr_opp
echo "-1" > /sys/pnpmgr/fpsgo_boost/fbt/adjust_loading
echo "-1" > /sys/pnpmgr/fpsgo_boost/fbt/dyn_tgt_time_en
echo "2" > /sys/pnpmgr/fpsgo_boost/fbt/floor_opp
echo "-1" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_enhance_f
echo "-1" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_opp_c
echo "-1" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_opp_f
echo "-1" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_percent
echo "1" > /sys/pnpmgr/fpsgo_boost/fbt/ultra_rescue
echo "0" > /sys/kernel/fpsgo/xgf/xgf_trace_enable
echo "1" > /sys/kernel/fpsgo/fstb/tfps_to_powerhal_enable
echo "1" > /sys/kernel/fpsgo/fstb/set_cam_active
echo "1" > /sys/kernel/fpsgo/fbt/boost_ta
echo "1" > /sys/module/ged/parameters/ged_smart_boost
echo "-1" > /sys/module/ged/parameters/gpu_cust_upbound_freq
echo "1" > /sys/module/ged/parameters/enable_gpu_boost
echo "1" > /sys/module/ged/parameters/ged_boost_enable
echo "1" > /sys/module/ged/parameters/boost_gpu_enable
echo "1" > /sys/module/ged/parameters/gpu_dvfs_enable
echo "1" > /sys/module/ged/parameters/gpu_idle
echo "1" > /sys/module/ged/parameters/ged_monitor_3D_fence_systrace
echo "-1" > /sys/module/ged/parameters/g_fb_dvfs_threshold
echo "0" > /sys/module/ged/parameters/g_gpu_timer_based_emu
echo "-1" > /sys/module/ged/parameters/gpu_cust_boost_freq
echo "101" > /sys/kernel/ged/hal/gpu_boost_level
echo "0" > /sys/module/ged/parameters/is_GED_KPI_enabled
echo "-1" > /sys/kernel/ged/hal/custom_boost_gpu_freq
echo "-1" > /sys/kernel/ged/hal/custom_upbound_gpu_freq
echo "0" > /sys/kernel/ged/hal/dvfs_loading_mode
echo "0" > /sys/kernel/ged/hal/dvfs_workload_mode
echo "-1" > /sys/kernel/ged/hal/dvfs_margin_value

# Advanced FPSGO & GED

echo "15" > /sys/module/mtk_fpsgo/parameters/bhr_opp
echo "1" > /sys/module/mtk_fpsgo/parameters/bhr_opp_l
echo "90" > /sys/module/mtk_fpsgo/parameters/uboost_enhance_f
echo "1" > /sys/module/mtk_fpsgo/parameters/gcc_fps_margin
echo "90" > /sys/module/mtk_fpsgo/parameters/rescue_enhance_f
echo "1" > /sys/module/mtk_fpsgo/parameters/qr_mod_frame
echo "1" > /sys/module/mtk_fpsgo/parameters/fstb_separate_runtime_enable
echo "1" > /sys/module/mtk_fpsgo/parameters/fstb_consider_deq
echo "100" > /sys/pnpmgr/fpsgo_boost/fstb/fstb_tune_quantile
echo "0" > /sys/pnpmgr/fpsgo_boost/fstb/fstb_tune_error_threshold
echo "1" > /sys/pnpmgr/fpsgo_boost/fstb/margin_mode
echo "10" > /sys/pnpmgr/fpsgo_boost/fbt/bhr_opp
echo "1" > /sys/pnpmgr/fpsgo_boost/fbt/adjust_loading
echo "1" > /sys/pnpmgr/fpsgo_boost/fbt/dyn_tgt_time_en
echo "0" > /sys/pnpmgr/fpsgo_boost/fbt/floor_opp
echo "90" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_enhance_f
echo "80" > /sys/module/mtk_fpsgo/parameters/run_time_percent
echo "1" > /sys/module/mtk_fpsgo/parameters/loading_ignore_enable
echo "80" > /sys/module/mtk_fpsgo/parameters/kmin
echo "90" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_opp_c
echo "90" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_opp_f
echo "90" > /sys/pnpmgr/fpsgo_boost/fbt/rescue_percent
echo "1" > /sys/pnpmgr/fpsgo_boost/fbt/ultra_rescue

# Power Save Mode Off
settings put global low_power 0

# Set perf
setprop sakuraai.mode performance
echo " •> AmbaEngine Game Mode activated at $(date "+%H:%M:%S")" >> $LOG

# Report
sed -Ei 's/^description=(\[.*][[:space:]]*)?/description=[🎮 AmbaEngine Game Mode] /g' "$BASEDIR/module.prop"
am start -a android.intent.action.MAIN -e toasttext "🎮 AmbaEngine Game Mode" -n bellavita.toast/.MainActivity

exit 0