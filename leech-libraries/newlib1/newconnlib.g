// genesis

//newclass synchannel 
//newclass spiking
//addaction RESETBUFFER 1001 


object	newspikegen	NSpikegen_type NSpikegen spiking               \
	-author 	"M.Wilson Caltech 6/88, Dave Bilitch 1/94"   \
        -actions        PROCESS RESET CHECK SAVE2 RESTORE2           \
	-readonly	state       "current state of object"        \
	-readwrite	thresh      "threshold for spike generation" \
	-readwrite	output_amp  "amplitude of spike event" 1.0   \
	-readwrite	abs_refract "absolute refractory period"     \
	-readwrite		lastevent   "time of last spike"             \
	-messages	INPUT 0		1 input                      \
			THRESH 1	1 threshold                  \
	-description	"Performs threshold spike discrimination."   \
			"Generates an impulse each time an input crosses the"   \
			"spike threshold at a maximal rate set by abs_refract."




