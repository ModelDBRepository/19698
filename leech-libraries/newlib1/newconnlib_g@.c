#include <stdio.h>
#include "newconn_ext.h"
#include "newconnlib_g@.h"

STARTUP_newconnlib() {
  GenesisObject* object;
  GenesisObject  tobject;
  char*          slotnames[50];
  char*          argv[50];

  /* Definition of object newspikegen */
  memset(&tobject,0,sizeof(GenesisObject));
  tobject.name = "newspikegen";
  tobject.type = "NSpikegen_type";
  tobject.size = sizeof(struct NSpikegen_type);
  { extern int NSpikegen(); tobject.function = NSpikegen; HashFunc("NSpikegen", NSpikegen, "int"); }
  ObjectAddClass(&tobject,ClassID("spiking"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("newspikegen");
  object->defaults->object = object;
  object->defaults->name = CopyString("newspikegen");
  object->author = "M.Wilson Caltech 6/88, Dave Bilitch 1/94";
  { extern int NSpikegen(); AddActionToObject(object, "PROCESS", NSpikegen, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'newspikegen'\n")); HashFunc("NSpikegen", NSpikegen, "int"); }
  { extern int NSpikegen(); AddActionToObject(object, "RESET", NSpikegen, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'newspikegen'\n")); HashFunc("NSpikegen", NSpikegen, "int"); }
  { extern int NSpikegen(); AddActionToObject(object, "CHECK", NSpikegen, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'newspikegen'\n")); HashFunc("NSpikegen", NSpikegen, "int"); }
  { extern int NSpikegen(); AddActionToObject(object, "SAVE2", NSpikegen, 0) ? 0 : (Error(), printf("adding action 'SAVE2' to object 'newspikegen'\n")); HashFunc("NSpikegen", NSpikegen, "int"); }
  { extern int NSpikegen(); AddActionToObject(object, "RESTORE2", NSpikegen, 0) ? 0 : (Error(), printf("adding action 'RESTORE2' to object 'newspikegen'\n")); HashFunc("NSpikegen", NSpikegen, "int"); }
  SetFieldListProt(object, "state", FIELD_READONLY);
  SetFieldListDesc(object, "state", "current state of object");
  SetFieldListProt(object, "thresh", FIELD_READWRITE);
  SetFieldListDesc(object, "thresh", "threshold for spike generation");
  SetFieldListProt(object, "output_amp", FIELD_READWRITE);
  SetFieldListDesc(object, "output_amp", "amplitude of spike event");
DirectSetElement(object->defaults, "output_amp", "1.0");
  SetFieldListProt(object, "abs_refract", FIELD_READWRITE);
  SetFieldListDesc(object, "abs_refract", "absolute refractory period");
  SetFieldListProt(object, "lastevent", FIELD_READWRITE);
  SetFieldListDesc(object, "lastevent", "time of last spike");
  slotnames[0] = "input";
  MsgListAdd(object, "INPUT", newspikegen_INPUT, slotnames, 1);
  slotnames[0] = "threshold";
  MsgListAdd(object, "THRESH", newspikegen_THRESH, slotnames, 1);
  object->description = "Performs threshold spike discrimination.\nGenerates an impulse each time an input crosses the\nspike threshold at a maximal rate set by abs_refract.\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

/* Script variables */

} /* STARTUP_newconnlib */
