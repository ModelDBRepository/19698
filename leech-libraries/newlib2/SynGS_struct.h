#include "struct_defs.h"   /*for compartment definition */
struct SynG_type
 { CHAN_TYPE
  struct SynG_type *channel;
  /* extra fields here */
  double A, B, P, C, R, Gbar, A1, A2, A3, A4, A5, POWER;
};

struct SynS_type
 {
  CHAN_TYPE
  struct SynS_type *channel;
  double m_SynS, A, B, C, D, E;
};











