static char rcsid[] = "$Id: newspikegen.c,v 1.2 1996/07/22 22:18:51 dhb Exp $";

/*
** $Log: spikegen.c,v $
 * Revision 1.2  1996/07/22  22:18:51  dhb
 * Whitespace changes (Mike Vanier)
 *
 * Revision 1.1  1995/01/11  23:09:02  dhb
 * Initial revision
 *
 * newspikegen.c modified from spikegen.c
 * 8/20/97
*/

#include "newconn_ext.h"

static int	DEBUG_Spikegen = 0;
static double savedata[2];

/* 6/88 Matt Wilson, 1/94 Dave Bilitch */

int NSpikegen (spikegen,action)
register struct NSpikegen_type *spikegen;
Action		*action;
{
double 	state;
double 	thresh;
MsgIn	*msg;
MsgOut	*mo;
int	stat;
int n;

    if (Debug(DEBUG_Spikegen) > 1){
	ActionHeader("Spikegen",spikegen,action);
    }
    SELECT_ACTION(action){
    case RESET:
	spikegen->lastevent = -spikegen->abs_refract;
	break;
    case PROCESS:
	/*
	** set the default values
	*/
	thresh = spikegen->thresh;
	state = thresh - 1.0;
	MSGLOOP(spikegen,msg){
	case 0:		/* potential */
	    state = MSGVALUE(msg,0);
	    break;
	case 1:		/* threshold */
	    thresh = MSGVALUE(msg,0);
	    break;
	}
	/*
	** evaluate the criteria for spiking.
	** has it exceeded threshold?
	** is it past its refractory state?
	*/
	if (state >= thresh &&
	    spikegen->lastevent + spikegen->abs_refract <=
				    SimulationTime() + ClockValue(0)/2.0) {
	    /*
	    ** Send event to destination elements
	    */
	    MSGOUTLOOP(spikegen, mo) {
                /* 
		** CallEventAction checks that the msgout is in fact an
		** active message before calling the spike action.  Non-
		** active messages usually have a no-op here.
		*/
	      CallEventAction(spikegen, mo);
	    }
	    spikegen->state = spikegen->output_amp;
	    spikegen->lastevent = SimulationTime();
	} else {
	    spikegen->state = 0;
	}
	break;
    case CHECK:
	stat = 0;
	MSGLOOP(spikegen, msg) {
	    case 0:
		stat = 1;
		break;
	}
	if (!stat){
	    ErrorMessage("Spikegen","State input is required.",spikegen);
	}
	break;
    case SAVE2:
	savedata[0] = (double)(spikegen->lastevent - SimulationTime());
	n=1;
	fwrite(&n,sizeof(int),1,(FILE*)action->data);
	fwrite(savedata,sizeof(double),1,(FILE*)action->data);
	break;
    case RESTORE2:
	fread(&n,sizeof(int),1,(FILE*)action->data);
	if (n != 1) {
	    ErrorMessage("Spikegen","Invalid savedata length",spikegen);
	    return(n);
	}
	fread(savedata,sizeof(double),1,(FILE*)action->data);
	spikegen->lastevent = SimulationTime() + (float)savedata[0];
	break;
    default:
	InvalidAction("Spikegen",spikegen,action);
	break;
    }
	return(0);
}


