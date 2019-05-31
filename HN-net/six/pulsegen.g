function make_pulse0(width)
float width

create pulsegen /pulse0
setfield ^ level1 9.8e-10 width1 {width} delay1 0 level2 -20.0 width2 5.0  delay2 1e10 baselevel 0 trig_mode 1

addfield /pulse0 Ek
setfield /pulse0 Ek -.0625
addmsg /pulse0 /cell_4L/soma CHANNEL output Ek 

end

function make_pulse1(width)
float width

create pulsegen /pulse1
setfield ^ level1 9.8e-10 width1 {width} delay1 0 level2 -20.0 width2 5.0  delay2 1e10 baselevel 0 trig_mode 1

addfield /pulse1 Ek
setfield /pulse1 Ek -.0625
addmsg /pulse1 /cell_4R/soma CHANNEL output Ek 

end


function make_pulsegen_graph
str path, gpath
path = "pulsegen_graph"

//create xform /pulsegen_graph [600,5,400,730]
create xform /pulsegen_graph [600,5,400,500]
create xlabel /pulsegen_graph/label -hgeom 20 -bg cyan -label "Pulsegen"

gpath=(path) @"/pulsegen0"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 20:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 20:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "Gk"
setfield {gpath} xmax 20 ymin 0 ymax 2e-9
addmsg /pulse0 {gpath} PLOT output *Gk  *red


gpath=(path) @"/pulsegen1"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 195:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 195:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "Gk"
setfield {gpath} xmax 20 ymin 0 ymax 2e-9
addmsg /pulse1 {gpath} PLOT output *Gk *red


xshow /pulsegen_graph
useclock /pulsegen_graph 1

end 










