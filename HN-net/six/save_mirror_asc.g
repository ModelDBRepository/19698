// This file is for saving state variables to an ascii file
// The resulting file can then be used to set the state variables of the 
// objects with the include commmand
// This method is not as complete as the binary method because the state
// variables of the synchan object are not saved (these fields are readonly
// or are hidden)

function save_mirror_asc (file)
str file
str set ="setfield "

openfile {file} w


str path ="/cell_3L/soma"
str path2 ="/cell_4L/soma"
str temp ={set}@{path2}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/A_ron X" {getfield {path}/A_ron X}
writefile {file} {temp}"/A_ron Y" {getfield {path}/A_ron Y}
writefile {file} {temp}"/h_ron X" {getfield {path}/h_ron X}
writefile {file} {temp}"/CaF_ron X" {getfield {path}/CaF_ron X}
writefile {file} {temp}"/CaF_ron Y" {getfield {path}/CaF_ron Y}
writefile {file} {temp}"/CaS_ron X" {getfield {path}/CaS_ron X}
writefile {file} {temp}"/CaS_ron Y" {getfield {path}/CaS_ron Y}
writefile {file} {temp}"/P_ron X" {getfield {path}/P_ron X}
writefile {file} {temp}"/SynG A" {getfield  {path}/SynG A}
writefile {file} {temp}"/SynG P" {getfield {path}/SynG P}
writefile {file} {temp}"/mod_SynS4R4L m_SynS" {getfield {path}/mod_SynS3R3L m_SynS}
writefile {file} {temp}"/SynS4R4L Gk" {getfield {path}/SynS3R3L Gk}
writefile {file} {temp}"/SynS4R4L X" {getfield {path}/SynS3R3L X}
writefile {file} {temp}"/SynS4R4L Y" {getfield {path}/SynS3R3L Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}

str path ="/cell_3R/soma"
str path2 ="/cell_4R/soma"
str temp ={set}@{path2}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/A_ron X" {getfield {path}/A_ron X}
writefile {file} {temp}"/A_ron Y" {getfield {path}/A_ron Y}
writefile {file} {temp}"/h_ron X" {getfield {path}/h_ron X}
writefile {file} {temp}"/CaF_ron X" {getfield {path}/CaF_ron X}
writefile {file} {temp}"/CaF_ron Y" {getfield {path}/CaF_ron Y}
writefile {file} {temp}"/CaS_ron X" {getfield {path}/CaS_ron X}
writefile {file} {temp}"/CaS_ron Y" {getfield {path}/CaS_ron Y}
writefile {file} {temp}"/P_ron X" {getfield {path}/P_ron X}
writefile {file} {temp}"/SynG A" {getfield  {path}/SynG A}
writefile {file} {temp}"/SynG P" {getfield {path}/SynG P}
writefile {file} {temp}"/mod_SynS4L4R m_SynS" {getfield {path}/mod_SynS3L3R m_SynS}
writefile {file} {temp}"/SynS4L4R Gk" {getfield {path}/SynS3L3R Gk}
writefile {file} {temp}"/SynS4L4R X" {getfield {path}/SynS3L3R X}
writefile {file} {temp}"/SynS4L4R Y" {getfield {path}/SynS3L3R Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}


str path ="/cell_4L/soma"
str path2 ="/cell_3L/soma"
str temp ={set}@{path2}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/A_ron X" {getfield {path}/A_ron X}
writefile {file} {temp}"/A_ron Y" {getfield {path}/A_ron Y}
writefile {file} {temp}"/h_ron X" {getfield {path}/h_ron X}
writefile {file} {temp}"/CaF_ron X" {getfield {path}/CaF_ron X}
writefile {file} {temp}"/CaF_ron Y" {getfield {path}/CaF_ron Y}
writefile {file} {temp}"/CaS_ron X" {getfield {path}/CaS_ron X}
writefile {file} {temp}"/CaS_ron Y" {getfield {path}/CaS_ron Y}
writefile {file} {temp}"/P_ron X" {getfield {path}/P_ron X}
writefile {file} {temp}"/SynG A" {getfield  {path}/SynG A}
writefile {file} {temp}"/SynG P" {getfield {path}/SynG P}
writefile {file} {temp}"/mod_SynS3R3L m_SynS" {getfield {path}/mod_SynS4R4L m_SynS}
writefile {file} {temp}"/SynS3R3L Gk" {getfield {path}/SynS4R4L Gk}
writefile {file} {temp}"/SynS3R3L X" {getfield {path}/SynS4R4L X}
writefile {file} {temp}"/SynS3R3L Y" {getfield {path}/SynS4R4L Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}

str path ="/cell_4R/soma"
str path2 ="/cell_3R/soma"
str temp ={set}@{path2}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/A_ron X" {getfield {path}/A_ron X}
writefile {file} {temp}"/A_ron Y" {getfield {path}/A_ron Y}
writefile {file} {temp}"/h_ron X" {getfield {path}/h_ron X}
writefile {file} {temp}"/CaF_ron X" {getfield {path}/CaF_ron X}
writefile {file} {temp}"/CaF_ron Y" {getfield {path}/CaF_ron Y}
writefile {file} {temp}"/CaS_ron X" {getfield {path}/CaS_ron X}
writefile {file} {temp}"/CaS_ron Y" {getfield {path}/CaS_ron Y}
writefile {file} {temp}"/P_ron X" {getfield {path}/P_ron X}
writefile {file} {temp}"/SynG A" {getfield  {path}/SynG A}
writefile {file} {temp}"/SynG P" {getfield {path}/SynG P}
writefile {file} {temp}"/mod_SynS3L3R m_SynS" {getfield {path}/mod_SynS4L4R m_SynS}
writefile {file} {temp}"/SynS3L3R Gk" {getfield {path}/SynS4L4R Gk}
writefile {file} {temp}"/SynS3L3R X" {getfield {path}/SynS4L4R X}
writefile {file} {temp}"/SynS3L3R Y" {getfield {path}/SynS4L4R Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}

str path ="/cell_1L/soma"
str temp ={set}@{path}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/mod_SynS4L1L m_SynS" {getfield {path}/mod_SynS3L1L m_SynS}
writefile {file} {temp}"/SynS4L1L Gk" {getfield {path}/SynS3L1L Gk}
writefile {file} {temp}"/SynS4L1L X" {getfield {path}/SynS3L1L X}
writefile {file} {temp}"/SynS4L1L Y" {getfield {path}/SynS3L1L Y}
writefile {file} {temp}"/mod_SynS3L1L m_SynS" {getfield {path}/mod_SynS4L1L m_SynS}
writefile {file} {temp}"/SynS3L1L Gk" {getfield {path}/SynS4L1L Gk}
writefile {file} {temp}"/SynS3L1L X" {getfield {path}/SynS4L1L X}
writefile {file} {temp}"/SynS3L1L Y" {getfield {path}/SynS4L1L Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}

str path ="/cell_2L/soma"
str temp ={set}@{path}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/mod_SynS4L2L m_SynS" {getfield {path}/mod_SynS3L2L m_SynS}
writefile {file} {temp}"/SynS4L2L Gk" {getfield {path}/SynS3L2L Gk}
writefile {file} {temp}"/SynS4L2L X" {getfield {path}/SynS3L2L X}
writefile {file} {temp}"/SynS4L2L Y" {getfield {path}/SynS3L2L Y}
writefile {file} {temp}"/mod_SynS3L2L m_SynS" {getfield {path}/mod_SynS4L2L m_SynS}
writefile {file} {temp}"/SynS3L2L Gk" {getfield {path}/SynS4L2L Gk}
writefile {file} {temp}"/SynS3L2L X" {getfield {path}/SynS4L2L X}
writefile {file} {temp}"/SynS3L2L Y" {getfield {path}/SynS4L2L Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}

str path ="/cell_1R/soma"
str temp ={set}@{path}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/mod_SynS4R1R m_SynS" {getfield {path}/mod_SynS3R1R m_SynS}
writefile {file} {temp}"/SynS4R1R Gk" {getfield {path}/SynS3R1R Gk}
writefile {file} {temp}"/SynS4R1R X" {getfield {path}/SynS3R1R X}
writefile {file} {temp}"/SynS4R1R Y" {getfield {path}/SynS3R1R Y}

writefile {file} {temp}"/mod_SynS3R1R m_SynS" {getfield {path}/mod_SynS4R1R m_SynS}
writefile {file} {temp}"/SynS3R1R Gk" {getfield {path}/SynS4R1R Gk}
writefile {file} {temp}"/SynS3R1R X" {getfield {path}/SynS4R1R X}
writefile {file} {temp}"/SynS3R1R Y" {getfield {path}/SynS4R1R Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}

str path ="/cell_2R/soma"
str temp ={set}@{path}

writefile {file} {temp}" Vm" {getfield {path} Vm}
writefile {file} {temp}"/Na_ron X" {getfield {path}/Na_ron X}
writefile {file} {temp}"/Na_ron Y" {getfield {path}/Na_ron Y}
writefile {file} {temp}"/K1_ron X" {getfield {path}/K1_ron X}
writefile {file} {temp}"/K1_ron Y" {getfield {path}/K1_ron Y}
writefile {file} {temp}"/K2_ron X" {getfield {path}/K2_ron X}
writefile {file} {temp}"/mod_SynS4R2R m_SynS" {getfield {path}/mod_SynS3R2R m_SynS}
writefile {file} {temp}"/SynS4R2R Gk" {getfield {path}/SynS3R2R Gk}
writefile {file} {temp}"/SynS4R2R X" {getfield {path}/SynS3R2R X}
writefile {file} {temp}"/SynS4R2R Y" {getfield {path}/SynS3R2R Y}
writefile {file} {temp}"/mod_SynS3R2R m_SynS" {getfield {path}/mod_SynS4R2R m_SynS}
writefile {file} {temp}"/SynS3R2R Gk" {getfield {path}/SynS4R2R Gk}
writefile {file} {temp}"/SynS3R2R X" {getfield {path}/SynS4R2R X}
writefile {file} {temp}"/SynS3R2R Y" {getfield {path}/SynS4R2R Y}
writefile {file} {temp}"/spike lastevent" \
-{{getstat -time}-{getfield {path}/spike lastevent}}


closefile {file}
end


















