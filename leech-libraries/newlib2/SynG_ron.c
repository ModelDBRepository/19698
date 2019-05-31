static char rcsid[] = "$Id: SynG_ron.c,v 1.0 1997/08/18 23:57:06 venkat Exp $";
#define VOLTAGE 0
#define CAF   1
#define CAS   2
#define POSTVOLTAGE 3
#define EK 4
#define TH 1000 

#include "SynGS_ext.h" 
static int      DEBUG_SynG = 0;
static double   savedata[3];

/*
 * Graded synaptic transmission designed specifically for leech HN cells.
 * Needs presynaptic calcium currents (ICaF and ICaS) and presynaptic membrane
 * potential as input.  The output is the synaptic conductance.  In addition,
 * this object can calculate the synpatic current if it is given the 
 * postsynaptic membrane potential.  This is useful only for the purpose of 
 * plotting the synaptic current.  The simuation will work without calculating
 * synaptic current because the postsynaptic compartment calculates the 
 * current based on the postsynaptic Vm and the synaptic reversal potential.
 *
 * This object was modified from synchan.c by J. Lu and A. Hill
 */

int SynG(channel,action)
   register struct SynG_type *channel;
   Action  *action;
{
   double  dt;
   int CAS_msg_in = 1,CAF_msg_in = 1,volt_msg_in = 1,pvolt_msg_in =1; /*CHECK*/
   MsgIn   *msg;
   long double  V, ICaF, ICaS, I_Ca, Ainf, Atau, tmp, PV, g;
   int	n;
  
   if(Debug(DEBUG_SynG) > 1)
      ActionHeader("SynG",channel,action);
    
   SELECT_ACTION(action)
   {
   case INIT:
      channel->Gk = 0;
      break;
 
   case PROCESS:
      MSGLOOP(channel,msg)
         {
         case VOLTAGE:           /* get presynaptic membrane potential */
            V = MSGVALUE(msg,0);
	    break;

	 case CAF:               /* get presynaptic ICaF   */ 
            ICaF= MSGVALUE(msg,0);
            break;
	 
         case CAS:               /* get presynaptic ICaS   */
	    ICaS= MSGVALUE(msg, 0);
	    break;

         case POSTVOLTAGE:       /* get postsynaptic membrane potential */
            PV = MSGVALUE(msg,0);
            break;

         case EK:                /* reversal potential Ek */
            channel->Ek = MSGVALUE(msg,0);
            break;
	 }  

      /* calculate state variables and conductance */ 
      dt = Clockrate(channel);

      /* calculate Ainf, a voltage dependent threshold */  
      /* Ainf=A1+A2/(1+exp(A3*(V+A4))); units=Amperes */
      Ainf=channel->A1+channel->A2/(1+exp(channel->A3*(V+channel->A4)));

       /* exponential euler; A5 = tau, units =sec */
      channel->A=(channel->A)*exp(-dt/channel->A5)+Ainf*(1-exp(-dt/channel->A5));

      /* calculte the effective Ca influx
       * I_Ca is the total Ca minus the threshold
       * units=Amperes*/
      I_Ca=ICaF+ICaS-(channel->A);  
      if (I_Ca < 0) I_Ca=0.0;

      /* calculate P; d[P]/dt=ICa-B[P]; exponential euler */
      channel->P=(channel->P)*exp(-(channel->B)*dt)+ \
      I_Ca/(channel->B)*(1-exp(-(channel->B)*dt));

      /* raise P to a power; P^POWER/(P^POWER+C) is a function
       * that rises exponetially, but is saturating */
      tmp=pow(channel->P, channel->POWER);
      channel->R =tmp/(tmp+channel->C);   
      g = channel->Gbar * channel->R; 

      /* calculate the transmembrane current using the postsynaptic Vm */
      channel->Gk = g;
      channel->Ik = (channel->Ek - PV) * g;
      break;      /* end of case PROCESS */

   case RESET:
      channel->Gk  = 0;
      channel->Ik  = 0;
      channel->A   = 0;
      channel->P   = 0;
      channel->R   = 0;
      break;

   case CHECK:
      volt_msg_in = 0;
      CAF_msg_in = 0;
      CAS_msg_in = 0;
      pvolt_msg_in = 0;

      MSGLOOP(channel,msg)
         {
	 case VOLTAGE: 
	    volt_msg_in = 1;
	    break;
          
	 case CAF:            
            CAF_msg_in = 1;
            break;
	 
         case CAS:            
	    CAS_msg_in = 1;
	    break;

         case POSTVOLTAGE:
            pvolt_msg_in = 1;
            break;

	 }  

         if (volt_msg_in == 0)
	    ErrorMessage("SynG","No membrane potential.", channel);
	   
         if (CAF_msg_in == 0)
	    ErrorMessage("SynG","No ICaF.", channel);

         if (CAS_msg_in == 0)
	    ErrorMessage("SynG","No ICaS.", channel);

         if (pvolt_msg_in == 0)
            ErrorMessage("SynG","No postsynaptic memb. potential.", channel);
        
         if ((channel->Gbar) < 0)
            ErrorMessage("SynG","Gbar must be >= 0.", channel);
        

      break; /* CHECK */  

case SAVE2:
      savedata[0] = (double)(channel->A);
      savedata[1] = (double)(channel->P);
      n=2;
      fwrite(&n,sizeof(int),1,(FILE*)action->data);
      fwrite(savedata,sizeof(double),2,(FILE*)action->data);
      break; /* SAVE2 */

case RESTORE2:
	fread(&n,sizeof(int),1,(FILE*)action->data);
	if (n != 2) {
	    ErrorMessage("SynG_ron","Invalid savedata length",channel);
	    return(n);
	}
	fread(savedata,sizeof(double),2,(FILE*)action->data);
	channel->A = savedata[0];
	channel->P = savedata[1];
	break;  /* RESTORE2 */

default:
	InvalidAction("SynG_ron", channel ,action);
	break;

 
   }
      
      return (0);
}















