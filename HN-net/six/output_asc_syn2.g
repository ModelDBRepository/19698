// creates an ascii output file 
// adds ".dat" to the end of the filename

function output_asc_syn2  (name)
str name
str data_out = "data"
name ={name} @ ".dat"

create asc_file /output/{data_out}
useclock /output/{data_out} 2

addmsg cell_1L/soma /output/{data_out} SAVE Vm
addmsg cell_1R/soma /output/{data_out} SAVE Vm
addmsg cell_4L/soma /output/{data_out} SAVE Vm
addmsg cell_4R/soma /output/{data_out} SAVE Vm

addmsg /pulse0 /output/{data_out} SAVE output
addmsg /pulse1 /output/{data_out} SAVE output

enable /output
setfield /output/{data_out} leave_open 1 flush 1 filename {name} initialize 1 append 1
enable /output/{data_out}
echo datafile {name}
reset
end









