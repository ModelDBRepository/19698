// genesis

// $Id: newconn.g,v 1.14 1997/08/08 23:42:23 dhb Exp $
// Version EDS21b 96/08/02
//
// RCS Log messages at end of file


newclass synchannel 
newclass spiking
addaction RESETBUFFER 1001 

object	synchan	        Synchan_type Synchan segment channel synchannel              \
	-author 	"Mike Vanier 11/94"                                          \ 
	-actions 	CREATE INIT PROCESS HPROCESS RESET CHECK RECALC SAVE2 RESTORE2 EVENT  \
			ADDMSGIN DELETEMSGIN MSGINDELETED RESETBUFFER DELETE COPY    \
	-messages 	VOLTAGE 	0 	1 Vm                                 \	
			ACTIVATION 	1 	1 activation                         \
			RAND_ACTIVATION 2 	2 probability amplitude              \
			MOD		3	1 modulation                         \
			SPIKE	       -1	0                                    \
	-readonly       activation            "driving force for channel conductance"                    \
	-readwrite       Ik                    "channel current"                                          \
	-readwrite      Gk                    "conductance of channel"                                   \
	-readwrite      Ek                    "reversal potential of channel"                            \
	-readwrite		X                     "internal variable for implementing synaptic conductance"  \
	-readwrite		Y                     "internal variable for implementing synaptic conductance"  \
	-hidden		xconst1               "internal variable for synaptic conductances"              \
	-hidden		yconst1               "internal variable for synaptic conductances"              \
	-hidden		xconst2               "internal variable for synaptic conductances"              \
	-hidden		yconst2               "internal variable for synaptic conductances"              \
	-hidden		norm                  "normalization factor for psp amplitude"                   \
	-readwrite	tau1                  "first time constant of channel activation"                \
	-readwrite	tau2                  "second time constant of channel activation"               \
	-readwrite	gmax                  "peak conductance"                                         \
	-readwrite	frequency             "random activation frequency" 0.0                          \
	-readonly	nsynapses             "Number of incoming spike messages"                        \
	-hidden		synapse_size          "size of synapse in bytes"                                 \
	-readonly	event_buffer_size     "size of event buffer" 0                                   \
	-readonly       pending_events        "number of pending spike events in buffer" 0               \
	-hidden         FreeSynapticEvents    "free list of synaptic event nodes"                        \
	-hidden		PendingSynapticEvents "list of pending synaptic events"                          \
	-readwrite      nodes_per_synapse     "number of event nodes to allocate per synapse" 1.0        \
	-hidden         list_alloced          "flag for whether the freelist has been allocated" 0       \
        -hidden         allocednodes          "number of nodes that are the head of a malloced block" 0  \
	-readwrite	synapse               "synapse buffer"                                           \   
	-description    "Synaptically activated channel."


// This is a duplicate of synchan, for backwards-compatibility:

object	synchan2        Synchan_type Synchan segment channel synchannel              \
	-author 	"Mike Vanier 11/94"                                          \ 
	-actions 	CREATE INIT PROCESS HPROCESS RESET CHECK RECALC SAVE2 RESTORE2 EVENT  \
			ADDMSGIN DELETEMSGIN MSGINDELETED RESETBUFFER DELETE COPY    \
	-messages 	VOLTAGE 	0 	1 Vm                                 \	
			ACTIVATION 	1 	1 activation                         \
			RAND_ACTIVATION 2 	2 probability amplitude              \
			MOD		3	1 modulation                         \
			SPIKE	       -1	0                                    \
	-readonly       activation            "driving force for channel conductance"                    \
	-readonly       Ik                    "channel current"                                          \
	-readonly       Gk                    "conductance of channel"                                   \
	-readwrite      Ek                    "reversal potential of channel"                            \
	-hidden		X                     "internal variable for implementing synaptic conductance"  \
	-hidden		Y                     "internal variable for implementing synaptic conductance"  \
	-hidden		xconst1               "internal variable for synaptic conductances"              \
	-hidden		yconst1               "internal variable for synaptic conductances"              \
	-hidden		xconst2               "internal variable for synaptic conductances"              \
	-hidden		yconst2               "internal variable for synaptic conductances"              \
	-hidden		norm                  "normalization factor for psp amplitude"                   \
	-readwrite	tau1                  "first time constant of channel activation"                \
	-readwrite	tau2                  "second time constant of channel activation"               \
	-readwrite	gmax                  "peak conductance"                                         \
	-readwrite	frequency             "random activation frequency" 0.0                          \
	-readonly	nsynapses             "Number of incoming spike messages"                        \
	-hidden		synapse_size          "size of synapse in bytes"                                 \
	-readonly	event_buffer_size     "size of event buffer" 0                                   \
	-readonly       pending_events        "number of pending spike events in buffer" 0               \
	-hidden         FreeSynapticEvents    "free list of synaptic event nodes"                        \
	-hidden		PendingSynapticEvents "list of pending synaptic events"                          \
	-readwrite      nodes_per_synapse     "number of event nodes to allocate per synapse" 1.0        \
	-hidden         list_alloced          "flag for whether the freelist has been allocated" 0       \
        -hidden         allocednodes          "number of nodes that are the head of a malloced block" 0  \
	-readwrite	synapse               "synapse buffer"                                           \   
	-description    "Synaptically activated channel."



object  hebbsynchan     HebbSynchan_type HebbSynchan segment channel synchannel                    \
        -author         "Mike Vanier 4/96 Caltech"                                                 \
        -actions        CREATE INIT PROCESS RESET RECALC CHECK SAVE2 RESTORE2 EVENT                \
                        ADDMSGIN DELETEMSGIN MSGINDELETED RESETBUFFER DELETE COPY                  \
        -messages       VOLTAGE         0       1 Vm                                               \
                        ACTIVATION      1       1 activation                                       \
                        RAND_ACTIVATION 2       2 probability amplitude                            \
                        MOD             3       1 modulation                                       \
                        WEIGHT_CHANGE_MOD  4    1 modulation                                       \
                        SPIKE          -1       0                                                  \
	-readonly       activation            "driving force for channel conductance"                    \
	-readonly       Ik                    "channel current"                                          \
	-readonly       Gk                    "conductance of channel"                                   \
	-readwrite      Ek                    "reversal potential of channel"                            \
        -hidden         X                     "internal variable for synaptic conductances"              \
        -hidden         Y                     "internal variable for synaptic conductances"              \
        -hidden         xconst1               "internal constant for synaptic conductances"              \
        -hidden         xconst2               "internal constant for synaptic conductances"              \
        -hidden         yconst1               "internal constant for synaptic conductances"              \
        -hidden         yconst2               "internal constant for synaptic conductances"              \
        -hidden         norm                  "normalization factor for psp amplitude"                   \
        -readwrite      tau1                  "first time constant of channel activation"                \
        -readwrite      tau2                  "second time constant of channel activation"               \
        -readwrite      gmax                  "peak conductance"                                         \
        -readwrite      frequency             "random activation frequency" 0.0                          \
        -readonly       nsynapses             "Number of incoming spike messages"                        \
	-hidden		synapse_size          "size of synapse in bytes"                                 \
        -readonly       event_buffer_size     "size of event buffer" 0                                   \
        -readonly       pending_events        "number of pending spike events in event buffer" 0         \
        -hidden         FreeSynapticEvents    "free list of synaptic event nodes"                        \
        -hidden         PendingSynapticEvents "list of pending synaptic events"                          \
        -readwrite      nodes_per_synapse     "number of event nodes to allocate per synapse" 1.0        \
        -hidden         list_alloced          "flag for whether the freelist has been allocated"   0     \
        -hidden         allocednodes          "number of nodes that are the head of a malloced block" 0  \ 
        -readwrite      synapse               "synapse buffer"                                           \
	-readwrite      pre_tau1              "first time constant for presynaptic averaging"   0.010    \
	-readwrite      pre_tau2              "second time constant for presynaptic averaging"  0.100    \
	-readwrite      pre_thresh_lo         "lower presynaptic threshold" 3.0                          \ 
        -readwrite      pre_thresh_hi         "upper presynaptic threshold" 3.0                          \ 
        -hidden         pre_xconst            "internal constant for presynaptic averaging"              \
	-hidden         pre_yconst1           "internal constant for presynaptic averaging"              \
	-hidden         pre_yconst2           "internal constant for presynaptic averaging"              \
	-hidden         pre_norm              "normalization factor for presynaptic averaging"           \
	-readonly       avg_Vm                "averaged membrane potential"                              \
	-readwrite      post_tau              "time constant of postsynaptic averaging"                  \
	-hidden         post_const            "internal constant for postsynaptic averaging"             \
	-readwrite      post_thresh_lo        "lower postsynaptic threshold" -0.065                      \
	-readwrite      post_thresh_hi        "upper postsynaptic threshold" -0.065                      \
	-readwrite      post_scale            "scaling factor for postsynaptic activities" 0.002         \
	-readwrite      weight_change_rate    "rate of weight change" 1.0                                \
	-readwrite      min_weight            "minimum weight" 0.0                                       \
	-readwrite      max_weight            "maximum weight" 100.0                                     \
	-readwrite      change_weights        "flag: nonzero means weights can be changed" 1             \
	-description    "Like synchan, but weights are dynamically modified"  \
                        "according to a function of the pre- and postsynaptic" \
                        "activations."  


object	spikegen	Spikegen_type Spikegen spiking               \
	-author 	"M.Wilson Caltech 6/88, Dave Bilitch 1/94"   \
	-actions 	PROCESS RESET CHECK                          \
	-readonly	state       "current state of object"        \
	-readwrite	thresh      "threshold for spike generation" \
	-readwrite	output_amp  "amplitude of spike event" 1.0   \
	-readwrite	abs_refract "absolute refractory period"     \
	-hidden		lastevent   "time of last spike"             \
	-messages	INPUT 0		1 input                      \
			THRESH 1	1 threshold                  \
	-description	"Performs threshold spike discrimination."   \
			"Generates an impulse each time an input crosses the"   \
			"spike threshold at a maximal rate set by abs_refract."



object	randomspike	Randomspike_type Randomspike spiking                       \
	-author 	"M.Wilson Caltech 6/88, Dave Bilitch 1/94"                 \
	-actions 	INIT PROCESS RESET SET                                     \
	-readonly	state       "current state of object"                      \
	-readwrite	rate        "rate of generation of events"                 \
	-readwrite      reset       "flag for whether to reset after each event" 1 \
	-readwrite	reset_value "what to reset state to" 0.0                   \
	-readwrite      min_amp     "minimum amplitude of event" 1.0               \
	-readwrite      max_amp     "maximum amplitude of event" 1.0               \
	-readwrite	abs_refract "absolute refractory period" 0.0               \
	-hidden		lastevent   "time of last spike"                           \
	-hidden		realrate    "rate corrected for refractory period"         \
	-messages	RATE 0		1 rate                                     \
			MINMAX 1	2 min max                                  \
	-description	"Generates a time series of events at a rate"              \
			"given by the rate parameter. The probability"             \
			"of an event for a single time step is adjusted"           \
			"based on the setting of abs_refract such that"            \
			"the requested rate is maintained.  No event will"         \
			"be generated during the refractory period defined"        \
			"by abs_refract.  When an event has been generated"        \
			"the amplitude of the event is a random variable"          \
			"uniformly distributed between min_amp and max_amp."       \
			"The state field has the value of the event amplitude"     \
			"if an event has been generated. If an event is not"       \
			"generated then the value of the state field"              \
			"depends on the reset field. If reset is non-zero"         \
			"(the default) then the state takes on the value given in" \
			"reset_value. Otherwise the state will behave like a"      \
			"latch containing the amplitude of the previous event."    \
			"A reset time, randomspike is initialized to a random"     \
			"phase of the refractory period to avoid artificial"       \
			"synchronization at high rate settings."

addfunc planardelay         PlanarDelay
addfunc volumedelay         VolumeDelay
addfunc syndelay            SynDelay 
addfunc planarweight        PlanarWeight
addfunc volumeweight        VolumeWeight
addfunc planarconnect       do_planarconnect
addfunc volumeconnect       do_volumeconnect
addfunc normalizeweights    NormalizeWeights
addfunc getsynindex         do_getsynindex int
addfunc getsyncount         do_getsyncount int 
addfunc getsynsrc           do_getsynsrc   char*
addfunc getsyndest          do_getsyndest  char*
addfunc resetsynchanbuffers ResetSynchanBuffers
addfunc planarweight2       PlanarWeight2
addfunc planardelay2        PlanarDelay2
addfunc volumedelay2        VolumeDelay2


/*
** $Log: newconn.g,v $
** Revision 1.14  1997/08/08 23:42:23  dhb
** Added SET action for randomspike and updated randomspike
** description to reflect change in handling of rate and abs_refract
** values and resulting spike generation
**
** Revision 1.13  1997/08/04 17:38:27  dhb
** Added HPROCESS to synchan2 actions
**
** Revision 1.12  1997/08/01 18:57:44  dhb
** Fix to randomspike to adjust for the rate damping effect of
** the refractory period.  (From Erik De Schutter)
**
** Revision 1.11  1997/07/29 00:58:02  dhb
** Added planardelay2 and volumedelay2 commands
**
** Revision 1.10  1997/07/23 22:01:11  dhb
** Added HPROCESS to synchan actions.
**
** Revision 1.9  1997/05/29 06:52:39  dhb
** Update from Antwerp GENESIS version 21e
**
** Version EDS21b 96/08/02
** MAEX added field normalize_weights to synchan2 object
**      added function planarweight2
**
# Revision 1.8  1996/07/23  00:03:40  dhb
# Merged in 1.6.1.1 changes
#
# Revision 1.7  1995/09/28  00:01:48  venkat
# Changes from Mike Vanier:
# Removed references to hebbsynchan2.
# Reorganized field positions to conform with newconn_struct.h
#
# Revision 1.6.1.1  1996/07/23  00:00:14  dhb
# Changes from Mike Vanier:
#   synchan2 --> synchan
#
# Revision 1.6  1995/08/03  20:02:17  dhb
# Changed hebbsynchan back to HebbSynchan implementation and commented
# hebbsynchan2 object.
#
# Revision 1.5  1995/08/03  00:53:44  dhb
# hebbsynchan is now the HebbSynChan2 version and there is no
# hebbsynchan2 object defined.
#
# Revision 1.4  1995/03/28  02:13:49  mvanier
# Cosmetic changes.
#
# Revision 1.3  1995/03/27  20:36:21  mvanier
# Changed order of fields in synchan object to conform
# to newconn_struct.h.
#
# Revision 1.2  1995/02/27  23:04:48  mvanier
# Spiking objects are no longer of class membrane.
#
# Revision 1.1  1995/01/11  23:09:02  dhb
# Initial revision
#
*/
