// genesis

/* Now deal with the new object
**
** new class definitions can be added using the 'newclass' command
** Note that classes are simply used for grouping of related elements
** and do not alter the element functionality in any way
** See scheduling (genesis/startup/schedule.g) for an example of class use
*/

newclass	SynGSclass


/*
******************************************************************************
**                          Example OBJECT TABLE                            **
******************************************************************************
*/

//============================================================================
//	name		data_type	function	class		
//============================================================================


object  SynS_object     SynS_type       SynS_f  SynGSclass  device \
        -author         "ron  lab, 3/97 " \
        -actions        INIT PROCESS RESET CHECK SAVE2 RESTORE2  \
        -messages       VOLTAGE 0       1  voltage \
        -readwrite      m_SynS     "modulation factor" \
	-readwrite      A          "A"           \
        -readwrite      B          "B"           \
        -readwrite      C          "C"           \
        -readwrite      D          "D"           \
        -readwrite      E          "E"      \
	-hidden		Ek         "Ek not used " \
	-hidden 	Ik         "Ik not used " \
	-hidden         Gk         "Gk not used " \
	-hidden    	activation "activation not used" \
        -description    "a new object for voltage-dependent modulation " \
                        "of spike-mediated synaptic transmission." \
                        "Modulation is a sigmoidal function of membrane" \
                        "potential given by " \
                        "ModInf=A+B/(1+exp(C*(Vm+D)))" \
                        "E is the time constant"


object	SynG_object	SynG_type	SynG	SynGSclass  device \
	-author 	"ron  lab,3/97 " \
	-actions	INIT PROCESS RESET CHECK SAVE2 RESTORE2 \
	-messages	VOLTAGE 0       1  voltage \
			CAF     1       1  FastCa  \
                        CAS     2       1  SlowCa  \
                        POSTVOLTAGE 3   1  postvoltage \
        -readwrite      A          "shunts effective Ca current"  \
        -readwrite      B          "buffering parameter "  \
        -readwrite      P          "Ca factor governing transmitter release"  \
        -readwrite      C          "limit parameter(limits release to Gbar)"  \
        -readwrite      R          "release = p^3/(p^3+C)"    \
        -readwrite      Gbar       "maximal conductance" \
        -readwrite      A1         "A1 in Ainf=A1+A2/(1+exp(A3+(Vm+A4)))" \
        -readwrite      A2         "A2" \
        -readwrite      A3         "A3" \
        -readwrite      A4         "A4" \
        -readwrite      A5         "A5 is the time constant" \
	-readonly       Ik         "Ik" \
	-hidden 	activation "activation not used" \
	-description	"A new object specifically for" \
			"graded synaptic inhibition in the leech"





















