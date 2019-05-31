
function make_funcgen1(freq)
float freq

create funcgen /funcgen1

setfield /funcgen1 mode 1

setfield /funcgen1 amplitude 20e-9
setfield /funcgen1 dc_offset 0

setfield /funcgen1 phase 0
setfield /funcgen1 frequency {freq}

addfield /funcgen1 Ek
setfield /funcgen1 Ek -.040
addmsg /funcgen1 /cell_4L/soma CHANNEL output Ek 

end


function make_funcgen2(freq)
float freq

create funcgen /funcgen2

setfield /funcgen2 mode 1

setfield /funcgen2 amplitude 20e-9
setfield /funcgen2 dc_offset 0

setfield /funcgen2 phase 180
setfield /funcgen2 frequency {freq}

addfield /funcgen2 Ek
setfield /funcgen2 Ek -.055
addmsg /funcgen2 /cell_4L/soma CHANNEL output Ek 

end


function make_funcgen_graph
str path, gpath
path = "funcgen_graph"

create xform /funcgen_graph [600,5,400,730]
create xlabel /funcgen_graph/label -hgeom 20 -bg cyan -label "Funcgen"

gpath=(path) @"/funcgen1"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 20:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 20:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "Gk"
setfield {gpath} xmax 20 ymin 0 ymax 1e-8
addmsg /funcgen1 {gpath} PLOT output *Ek=-.04 *red


gpath=(path) @"/funcgen2"
create xgraph {gpath} -hgeom 175 
setfield {gpath} ygeom 195:parent.top
create xbutton {gpath}"/scale" \
	-title "scale" -script "set_scale "{gpath}

setfield {gpath}"/scale" ygeom 195:parent.top \
			 xgeom 334:parent.left  \
			 wgeom 50 hgeom 22

setfield {gpath} XUnits "t (sec)" YUnits "Gk"
setfield {gpath} xmax 20 ymin 0 ymax 1e-8
addmsg /funcgen2 {gpath} PLOT output *Ek=-.06 *red



xshow /funcgen_graph
useclock /funcgen_graph 1

end 

