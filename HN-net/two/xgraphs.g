// graphs for simulation

function make_dataL

create xform /dataL [600,20,400,700]
create xlabel /dataL/label -hgeom 20 -bg cyan -label "HN_L(left)"

create xgraph /dataL/HN1 -hgeom 24%
setfield /dataL/HN1 xmax 20 ymax 0.03 ymin -0.07
addmsg /cell_1L/soma /dataL/HN1 PLOT Vm *soma *red

create xgraph /dataL/HN2 -hgeom 24%
setfield /dataL/HN2 xmax 20 ymax 0.03 ymin -0.07
addmsg /cell_2L/soma /dataL/HN2 PLOT Vm *soma *red

create xgraph /dataL/HN3 -hgeom 24%
setfield /dataL/HN3 xmax 20 ymax 0.005 ymin -0.06
addmsg /cell_3L/soma /dataL/HN3 PLOT Vm *soma *red

create xgraph /dataL/HN4 -hgeom 24%
setfield /dataL/HN4 xmax 20 ymax 0.005 ymin -0.06
addmsg /cell_4L/soma /dataL/HN4 PLOT Vm *soma *red

xshow /dataL
useclock /dataL/HN1 1
useclock /dataL/HN2 1
useclock /dataL/HN3 1
useclock /dataL/HN4 1
end 

function make_dataR
create xform /dataR [600,20,400,700]
create xlabel /dataR/label -hgeom 20 -bg cyan -label "HN_R(right)"

create xgraph /dataR/HN1 -hgeom 24%
setfield /dataR/HN1 xmax 20 ymax 0.03 ymin -0.07
addmsg /cell_1R/soma /dataR/HN1 PLOT Vm *soma *red

create xgraph /dataR/HN2 -hgeom 24%
setfield /dataR/HN2 xmax 20 ymax 0.03 ymin -0.07
addmsg /cell_2R/soma /dataR/HN2 PLOT Vm *soma *red

create xgraph /dataR/HN3 -hgeom 24%
setfield /dataR/HN3 xmax 20 ymax 0.005 ymin -0.06
addmsg /cell_3R/soma /dataR/HN3 PLOT Vm *soma *red

create xgraph /dataR/HN4 -hgeom 24%
setfield /dataR/HN4 xmax 20 ymax 0.005 ymin -0.06
addmsg /cell_4R/soma /dataR/HN4 PLOT Vm *soma *red

xshow /dataR
useclock /dataR/HN1 1
useclock /dataR/HN2 1
useclock /dataR/HN3 1
useclock /dataR/HN4 1

end 


function make_graph_volt4
str path, gpath
path = "/volt4"

create xform /volt4 [600,20,400,700]
//create xlabel /volt4/label -hgeom 20 -bg cyan -label "HN"

gpath = (path) @ "/HN4R"
create xgraph {gpath}\
     -hgeom 340 -title "HN(4,R)"
create xbutton {gpath}"/scale" \
          -title \
         "scale" -script "set_scale "{gpath}
    
setfield {gpath}"/scale" ygeom 0:parent.top  \
                           xgeom 334:parent.left  \
                           wgeom 50 hgeom 30  

    setfield {gpath} XUnits "t (sec)" YUnits "voltage (V)"
    setfield {gpath} xmax 20 ymin -0.06 ymax 0.005
    addmsg /cell_4R/soma {gpath} PLOT Vm *soma *red

gpath = (path) @ "/HN4L"
create xgraph {gpath}\
     -hgeom 340  -title "HN(4,L)"
setfield {gpath} ygeom 345:parent.top
create xbutton {gpath}"/scale" \
          -title \
         "scale" -script "set_scale "{gpath}
    
setfield {gpath}"/scale" ygeom 345:parent.top  \
                           xgeom 334:parent.left  \
                           wgeom 50 hgeom 30  

    setfield {gpath} XUnits "t (sec)" YUnits "voltage (V)"
    setfield {gpath} xmax 20 ymin -0.06 ymax 0.005
    addmsg /cell_4L/soma {gpath} PLOT Vm *soma *red

xshow /volt4
useclock /volt4/HN4R 1
useclock /volt4/HN4L 1
end 


function make_graph_HN4L_1
str path, gpath
path ="/HN4L_1"

create xform /HN4L_1 [600,5,400,730]
create xlabel /HN4L_1/label -hgeom 20 -bg cyan -label "HN(L,4)"

gpath=(path)@"/Ih"
create xgraph {gpath} -hgeom 175
setfield {gpath} ygeom 20:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 20:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -1e-10 ymax 5e-11
addmsg /cell_4L/soma/h_ron {gpath} PLOTSCALE Ik *Ih *red -1 0
                                    //PLOTSCALE data name color scale yoffset
                        //Similar to PLOT, except that the scale and yoffset

gpath=(path) @"/ICaF"                
create xgraph {gpath} -hgeom 175
setfield {gpath} ygeom 195:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 195:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -.5e-10 ymax 1e-12
addmsg /cell_4L/soma/CaF_ron {gpath} PLOTSCALE Ik *ICaF *red -1 0


gpath=(path) @"/ICaS"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 370:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 370:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -1e-10 ymax 1e-12
addmsg /cell_4L/soma/CaS_ron {gpath} PLOTSCALE Ik *ICaS *red -1 0


gpath=(path) @"/Ip"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 545:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 545:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -4e-10 ymax 0
addmsg /cell_4L/soma/P_ron {gpath} PLOTSCALE Ik *Ip *red -1 0


xshow /HN4L_1
useclock /HN4L_1/Ih 1
useclock /HN4L_1/ICaF 1
useclock /HN4L_1/ICaS 1
useclock /HN4L_1/Ip 1
end 

function make_graph_HN4L_2
str path, gpath
path ="/HN4L_2"

create xform /HN4L_2 [600,5,400,730]
create xlabel /HN4L_2/label -hgeom 20 -bg cyan -label "HN(L,4)"

gpath=(path)@"/INa"
create xgraph {gpath} -hgeom 175
setfield {gpath} ygeom 20:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 20:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -7e-9 ymax 1e-12
addmsg /cell_4L/soma/Na_ron {gpath} PLOTSCALE Ik *INa *red -1 0
                                    //PLOTSCALE data name color scale yoffset
                        //Similar to PLOT, except that the scale and yoffset
                
gpath=(path) @"/IK1"                
create xgraph {gpath} -hgeom 175
setfield {gpath} ygeom 195:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 195:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -1e-12 ymax 4e-9
addmsg /cell_4L/soma/K1_ron {gpath} PLOTSCALE Ik *IK1 *red -1 0



gpath=(path) @"/IK2"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 370:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 370:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -1e-12 ymax 5e-10
addmsg /cell_4L/soma/K2_ron {gpath} PLOTSCALE Ik *IK2 *red -1 0

gpath=(path) @"/IA"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 545:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 545:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -1e-12 ymax 2e-10
addmsg /cell_4L/soma/A_ron {gpath} PLOTSCALE Ik *IA *red -1 0


xshow /HN4L_2
useclock /HN4L_2/INa 1
useclock /HN4L_2/IK1 1
useclock /HN4L_2/IK2 1
useclock /HN4L_2/IA 1
end 

function make_graph_HN4L_3
str path, gpath
path ="/HN4L_3"
  
create xform /HN4L_3 [600,5,400,730]
create xlabel /HN4L_3/label -hgeom 20 -bg cyan -label "HN(L,4)"

gpath=(path)@"/GSynG"
create xgraph {gpath} -hgeom 175
setfield {gpath} ygeom 20:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 20:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "conductance (S)"
setfield {gpath} xmax 20 ymin -1e-12 ymax 4e-9
addmsg /cell_4L/soma/SynG {gpath} PLOTSCALE Gk *GSynG *red 1 0
                                    //PLOTSCALE data name color scale yoffset
                        //Similar to PLOT, except that the scale and yoffset
                
gpath=(path) @"/ISynG"                
create xgraph {gpath} -hgeom 175
setfield {gpath} ygeom 195:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 195:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -1e-12 ymax 5e-11
addmsg /cell_4L/soma/SynG {gpath} PLOTSCALE Ik *ISynG *red -1 0

gpath=(path) @"/GSynS4R4L"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 370:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 370:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "conductnace (S)"
setfield {gpath} xmax 20 ymin -1e-11 ymax 5e-8
addmsg /cell_4L/soma/SynS4R4L {gpath} PLOTSCALE Gk *GSynS4R4L *red 1 0

gpath=(path) @"/ISynS4R4L"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 545:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 545:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "current (A)"
setfield {gpath} xmax 20 ymin -1e-11 ymax 2e-9
addmsg /cell_4L/soma/SynS4R4L {gpath} PLOTSCALE Ik *ISynS4R4L *red -1 0

xshow /HN4L_3
useclock /HN4L_3/GSynG 1
useclock /HN4L_3/ISynG 1
useclock /HN4L_3/GSynS4R4L 1
useclock /HN4L_3/ISynS4R4L 1
end 












