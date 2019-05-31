// this file is for saving parameters to an ascii file
// The resulting file can subsequently be used to set model parameters
// with the include command
// save_param adds ".g" to the filename

function save_param (file)
str file
str set ="setfield "

file = {file} @ ".g"
openfile {file} w

str path ="/cell_4L/soma"
str temp ={set}@{path}

writefile {file} {temp}" Em" {getfield {path} Em}
writefile {file} {temp}" Rm" {getfield {path} Rm}
writefile {file} {temp}" Cm" {getfield {path} Cm}
writefile {file} {temp}"/Na_ron Ek" {getfield {path}/Na_ron Ek}
writefile {file} {temp}"/Na_ron Gbar" {getfield {path}/Na_ron Gbar}
writefile {file} {temp}"/K1_ron Ek" {getfield {path}/K1_ron Ek}
writefile {file} {temp}"/K1_ron Gbar" {getfield {path}/K1_ron Gbar}
writefile {file} {temp}"/K2_ron Ek" {getfield {path}/K2_ron Ek}
writefile {file} {temp}"/K2_ron Gbar" {getfield {path}/K2_ron Gbar}
writefile {file} {temp}"/A_ron Ek" {getfield {path}/A_ron Ek}
writefile {file} {temp}"/A_ron Gbar" {getfield {path}/A_ron Gbar}
writefile {file} {temp}"/h_ron Ek" {getfield {path}/h_ron Ek}
writefile {file} {temp}"/h_ron Gbar" {getfield {path}/h_ron Gbar}
writefile {file} {temp}"/CaF_ron Ek" {getfield {path}/CaF_ron Ek}
writefile {file} {temp}"/CaF_ron Gbar" {getfield {path}/CaF_ron Gbar}
writefile {file} {temp}"/CaS_ron Ek" {getfield {path}/CaS_ron Ek}
writefile {file} {temp}"/CaS_ron Gbar" {getfield {path}/CaS_ron Gbar}
writefile {file} {temp}"/P_ron Ek" {getfield {path}/P_ron Ek}
writefile {file} {temp}"/P_ron Gbar" {getfield {path}/P_ron Gbar}
writefile {file} {temp}"/SynG Ek" {getfield  {path}/SynG Ek}
writefile {file} {temp}"/SynG Gbar" {getfield  {path}/SynG Gbar}
writefile {file} {temp}"/SynS4R4L Ek" {getfield {path}/SynS4R4L Ek}
writefile {file} {temp}"/SynS4R4L tau1" {getfield {path}/SynS4R4L tau1}
writefile {file} {temp}"/SynS4R4L tau2" {getfield {path}/SynS4R4L tau2}
writefile {file} {temp}"/SynS4R4L gmax" {getfield {path}/SynS4R4L gmax}


str path ="/cell_4R/soma"
str temp ={set}@{path}

writefile {file} {temp}" Em" {getfield {path} Em}
writefile {file} {temp}" Rm" {getfield {path} Rm}
writefile {file} {temp}" Cm" {getfield {path} Cm}
writefile {file} {temp}"/Na_ron Ek" {getfield {path}/Na_ron Ek}
writefile {file} {temp}"/Na_ron Gbar" {getfield {path}/Na_ron Gbar}
writefile {file} {temp}"/K1_ron Ek" {getfield {path}/K1_ron Ek}
writefile {file} {temp}"/K1_ron Gbar" {getfield {path}/K1_ron Gbar}
writefile {file} {temp}"/K2_ron Ek" {getfield {path}/K2_ron Ek}
writefile {file} {temp}"/K2_ron Gbar" {getfield {path}/K2_ron Gbar}
writefile {file} {temp}"/A_ron Ek" {getfield {path}/A_ron Ek}
writefile {file} {temp}"/A_ron Gbar" {getfield {path}/A_ron Gbar}
writefile {file} {temp}"/h_ron Ek" {getfield {path}/h_ron Ek}
writefile {file} {temp}"/h_ron Gbar" {getfield {path}/h_ron Gbar}
writefile {file} {temp}"/CaF_ron Ek" {getfield {path}/CaF_ron Ek}
writefile {file} {temp}"/CaF_ron Gbar" {getfield {path}/CaF_ron Gbar}
writefile {file} {temp}"/CaS_ron Ek" {getfield {path}/CaS_ron Ek}
writefile {file} {temp}"/CaS_ron Gbar" {getfield {path}/CaS_ron Gbar}
writefile {file} {temp}"/P_ron Ek" {getfield {path}/P_ron Ek}
writefile {file} {temp}"/P_ron Gbar" {getfield {path}/P_ron Gbar}
writefile {file} {temp}"/SynG Ek" {getfield  {path}/SynG Ek}
writefile {file} {temp}"/SynG Gbar" {getfield  {path}/SynG Gbar}
writefile {file} {temp}"/SynS4L4R Ek" {getfield {path}/SynS4L4R Ek}
writefile {file} {temp}"/SynS4L4R tau1" {getfield {path}/SynS4L4R tau1}
writefile {file} {temp}"/SynS4L4R tau2" {getfield {path}/SynS4L4R tau2}
writefile {file} {temp}"/SynS4L4R gmax" {getfield {path}/SynS4L4R gmax}


closefile {file}
end


















