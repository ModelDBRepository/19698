include defaults.g   // PI, generating library, make_Vclamp tweak
include filltable.g  // fill table functions for tabchannels
include userprefs_lowNa.g  // makes prototypes for library (includes HNchan)
include xforms.g     // control bar functions 
include xgraphs.g    // graph functions
include output_asc.g // function output_asc -save sim ouput to ascci file
include output_asc_volt.g // function output_asc_volt -saves just voltages
include save_param.g // function save_param  -saves parameters to ascii file
include save_state_bin.g // function save_state_bin -save state variable binary
include save_state_asc.g // function save_state_asc -save state HN3,4 ascii
include save_table_asc.g // has functions for saving channel tables to ascii

readcell cell_4L.p /cell_4L
readcell cell_4R.p /cell_4R
readcell cell_5L.p /cell_5L

include syncreate.g
syncreate
include synconnect.g
synconnect

float dt=1e-4
setclock 0 {dt*1}
setclock 1 {dt*20}  //for graphics
setclock 2 {dt*20}  //for data ouput

// make control and graphs (functions in xgraphs)
//make_scale_forms  // make form for scaling graphs 
//make_graph_volt4  // HN 4s
//make_graph_HN4L_1 // HN4 left Ih, ICaF, ICaS, Ip  
//make_graph_HN4L_2 // HN4 left INa IK1, IK2, IA  
//make_graph_HN4L_3 // HN4 left Graded G, I; Spike mediated G, I
//make_control

//include voltage_clamp.g // voltage clamp circuit

// to create ascii output files uncomment 
//output_asc_volt s98217000

// to save tab channel values to ascii file with .m as extension
// save_table_X chan_P /cell_4L/soma/P_ron  
// save_table_XY chan_Na /cell_4L/soma/Na_ron 

// set parameters with a file
//include default_param.g

reset
check

// initialize state variables from a binary file
//restore start_state.bin
















