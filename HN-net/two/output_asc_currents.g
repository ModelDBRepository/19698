// creates an ascii output file 
// adds ".dat" to the end of the filename

function output_asc_currents  (name)
str name
str data_out = "data"
name ={name} @ ".dat"

create asc_file /output/{data_out}
useclock /output/{data_out} 2

addmsg cell_4L/soma /output/{data_out} SAVE Vm
addmsg cell_4R/soma /output/{data_out} SAVE Vm
addmsg cell_4L/soma/SynG /output/{data_out} SAVE Ik
addmsg cell_4L/soma/SynG /output/{data_out} SAVE Gk
addmsg cell_4L/soma/SynS4R4L /output/{data_out} SAVE Ik
addmsg cell_4L/soma/SynS4R4L /output/{data_out} SAVE Gk

addmsg cell_4R/soma/SynG /output/{data_out} SAVE Ik
addmsg cell_4R/soma/SynG /output/{data_out} SAVE Gk
addmsg cell_4R/soma/SynS4L4R /output/{data_out} SAVE Ik
addmsg cell_4R/soma/SynS4L4R /output/{data_out} SAVE Gk

addmsg cell_4L/soma/CaS_ron /output/{data_out} SAVE Ik
addmsg cell_4L/soma/CaF_ron /output/{data_out} SAVE Ik

addmsg cell_4L/soma/P_ron /output/{data_out} SAVE Ik
addmsg cell_4L/soma/P_ron /output/{data_out} SAVE Gk

addmsg cell_4L/soma/Na_ron /output/{data_out} SAVE Ik
addmsg cell_4L/soma/Na_ron /output/{data_out} SAVE Gk

addmsg cell_4L/soma/h_ron /output/{data_out} SAVE Ik
addmsg cell_4L/soma/h_ron /output/{data_out} SAVE Gk

enable /output
setfield /output/{data_out} leave_open 1 flush 1 filename {name} initialize 1 append 1
enable /output/{data_out}
echo datafile {name}
reset
end









