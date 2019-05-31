// creates an ascii output file 
// adds ".dat" to the end of the filename

function output_asc_syn  (name)
str name
str data_out = "data"
name ={name} @ ".dat"

create asc_file /output/{data_out}
useclock /output/{data_out} 2

addmsg cell_1L/soma /output/{data_out} SAVE Vm
addmsg cell_1R/soma /output/{data_out} SAVE Vm
addmsg cell_2L/soma /output/{data_out} SAVE Vm
addmsg cell_2R/soma /output/{data_out} SAVE Vm
addmsg cell_4L/soma /output/{data_out} SAVE Vm
addmsg cell_4R/soma /output/{data_out} SAVE Vm

addmsg cell_4L/soma/SynS1L4L /output/{data_out} SAVE Ik
addmsg cell_4L/soma/SynS1L4L /output/{data_out} SAVE Gk

addmsg cell_4L/soma/SynS2L4L /output/{data_out} SAVE Ik
addmsg cell_4L/soma/SynS2L4L /output/{data_out} SAVE Gk

addmsg cell_4L/soma/SynG /output/{data_out} SAVE Gk
addmsg cell_4L/soma/SynG /output/{data_out} SAVE Ik

addmsg cell_4L/soma/SynS4R4L /output/{data_out} SAVE Gk
addmsg cell_4L/soma/SynS4R4L /output/{data_out} SAVE Ik

addmsg cell_4L/soma/h_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/h_ron /output/{data_out} SAVE Ik

addmsg cell_4L/soma/P_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/P_ron /output/{data_out} SAVE Ik

addmsg /pulse0 /output/{data_out} SAVE output
addmsg /pulse1 /output/{data_out} SAVE output

addmsg cell_4R/soma/SynS1R4R /output/{data_out} SAVE Ik
addmsg cell_4R/soma/SynS1R4R /output/{data_out} SAVE Gk

addmsg cell_4R/soma/SynS2R4R /output/{data_out} SAVE Ik
addmsg cell_4R/soma/SynS2R4R /output/{data_out} SAVE Gk


/*
addmsg cell_4L/soma/CaF_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/CaF_ron /output/{data_out} SAVE Ik

addmsg cell_4L/soma/CaS_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/CaS_ron /output/{data_out} SAVE Ik

addmsg cell_4L/soma/Na_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/Na_ron /output/{data_out} SAVE Ik

addmsg cell_4L/soma/K1_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/K1_ron /output/{data_out} SAVE Ik

addmsg cell_4L/soma/K2_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/K2_ron /output/{data_out} SAVE Ik

addmsg cell_4L/soma/A_ron /output/{data_out} SAVE Gk
addmsg cell_4L/soma/A_ron /output/{data_out} SAVE Ik
*/

enable /output
setfield /output/{data_out} leave_open 1 flush 1 filename {name} initialize 1 append 1
enable /output/{data_out}
echo datafile {name}
reset
end









