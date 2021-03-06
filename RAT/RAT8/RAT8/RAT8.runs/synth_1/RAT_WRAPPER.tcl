# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/victor/CPE233/RAT/RAT8/RAT8/RAT8.cache/wt [current_project]
set_property parent.project_path /home/victor/CPE233/RAT/RAT8/RAT8/RAT8.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/victor/CPE233/RAT/RAT8/RAT8/RAT8.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  /home/victor/CPE233/RAT/RAT4/ALU.sv
  /home/victor/CPE233/RAT/RAT8/CONTROL_UNIT.sv
  /home/victor/CPE233/RAT/RAT8/FLAGS.sv
  /home/victor/CPE233/RAT/RAT8/I.sv
  /home/victor/CPE233/RAT/RAT2/ProgCounter.sv
  /home/victor/CPE233/RAT/RAT1/ProgRom.sv
  /home/victor/CPE233/RAT/RAT3/REG_FILE.sv
  /home/victor/CPE233/RAT/RAT3/SCRATCH_RAM.sv
  /home/victor/CPE233/RAT/RAT7/Stack_Pointer.sv
  /home/victor/CPE233/RAT/RAT8/debounce_one_shot.sv
  /home/victor/CPE233/RAT/RAT8/RAT_MCU.sv
  /home/victor/CPE233/RAT/RAT8/RAT_WRAPPER.sv
}
read_verilog -library xil_defaultlib {
  /home/victor/CPE233/Modules/mux_2t1_nb.v
  /home/victor/CPE233/Modules/mux_4t1_nb.v
  /home/victor/CPE233/Modules/univ_sseg.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/victor/CPE233/RAT/RAT8/hardwareConfig.xdc
set_property used_in_implementation false [get_files /home/victor/CPE233/RAT/RAT8/hardwareConfig.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top RAT_WRAPPER -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef RAT_WRAPPER.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file RAT_WRAPPER_utilization_synth.rpt -pb RAT_WRAPPER_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
