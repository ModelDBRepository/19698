
#include "struct_defs.h"


/*
 * The following types are spike-generating objects.
 */


struct NSpikegen_type 
{
  ELEMENT_TYPE
  float	state;
  float thresh;
  float output_amp;
  float abs_refract; /* refractory period  */
  float	lastevent;   /* time of last spike */
};



