#include <stdio.h>
#include "SynGS_ext.h"
#include "leech_g@.h"

STARTUP_leech() {
  GenesisObject* object;
  GenesisObject  tobject;
  char*          slotnames[50];
  char*          argv[50];

  argv[0] = "newclass";
  argv[1] = "SynGSclass";
  do_add_class(2, argv);

  /* Definition of object SynS_object */
  memset(&tobject,0,sizeof(GenesisObject));
  tobject.name = "SynS_object";
  tobject.type = "SynS_type";
  tobject.size = sizeof(struct SynS_type);
  { extern int SynS_f(); tobject.function = SynS_f; HashFunc("SynS_f", SynS_f, "int"); }
  ObjectAddClass(&tobject,ClassID("SynGSclass"),CLASS_PERMANENT);
  ObjectAddClass(&tobject,ClassID("device"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("SynS_object");
  object->defaults->object = object;
  object->defaults->name = CopyString("SynS_object");
  object->author = "ron  lab, 3/97 ";
  { extern int SynS_f(); AddActionToObject(object, "INIT", SynS_f, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'SynS_object'\n")); HashFunc("SynS_f", SynS_f, "int"); }
  { extern int SynS_f(); AddActionToObject(object, "PROCESS", SynS_f, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'SynS_object'\n")); HashFunc("SynS_f", SynS_f, "int"); }
  { extern int SynS_f(); AddActionToObject(object, "RESET", SynS_f, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'SynS_object'\n")); HashFunc("SynS_f", SynS_f, "int"); }
  { extern int SynS_f(); AddActionToObject(object, "CHECK", SynS_f, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'SynS_object'\n")); HashFunc("SynS_f", SynS_f, "int"); }
  { extern int SynS_f(); AddActionToObject(object, "SAVE2", SynS_f, 0) ? 0 : (Error(), printf("adding action 'SAVE2' to object 'SynS_object'\n")); HashFunc("SynS_f", SynS_f, "int"); }
  { extern int SynS_f(); AddActionToObject(object, "RESTORE2", SynS_f, 0) ? 0 : (Error(), printf("adding action 'RESTORE2' to object 'SynS_object'\n")); HashFunc("SynS_f", SynS_f, "int"); }
  slotnames[0] = "voltage";
  MsgListAdd(object, "VOLTAGE", SynS_object_VOLTAGE, slotnames, 1);
  SetFieldListProt(object, "m_SynS", FIELD_READWRITE);
  SetFieldListDesc(object, "m_SynS", "modulation factor");
  SetFieldListProt(object, "A", FIELD_READWRITE);
  SetFieldListDesc(object, "A", "A");
  SetFieldListProt(object, "B", FIELD_READWRITE);
  SetFieldListDesc(object, "B", "B");
  SetFieldListProt(object, "C", FIELD_READWRITE);
  SetFieldListDesc(object, "C", "C");
  SetFieldListProt(object, "D", FIELD_READWRITE);
  SetFieldListDesc(object, "D", "D");
  SetFieldListProt(object, "E", FIELD_READWRITE);
  SetFieldListDesc(object, "E", "E");
  SetFieldListProt(object, "Ek", FIELD_HIDDEN);
  SetFieldListDesc(object, "Ek", "Ek not used ");
  SetFieldListProt(object, "Ik", FIELD_HIDDEN);
  SetFieldListDesc(object, "Ik", "Ik not used ");
  SetFieldListProt(object, "Gk", FIELD_HIDDEN);
  SetFieldListDesc(object, "Gk", "Gk not used ");
  SetFieldListProt(object, "activation", FIELD_HIDDEN);
  SetFieldListDesc(object, "activation", "activation not used");
  object->description = "a new object for voltage-dependent modulation \nof spike-mediated synaptic transmission.\nModulation is a sigmoidal function of membrane\npotential given by \nModInf=A+B/(1+exp(C*(Vm+D)))\nE is the time constant\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

  /* Definition of object SynG_object */
  memset(&tobject,0,sizeof(GenesisObject));
  tobject.name = "SynG_object";
  tobject.type = "SynG_type";
  tobject.size = sizeof(struct SynG_type);
  { extern int SynG(); tobject.function = SynG; HashFunc("SynG", SynG, "int"); }
  ObjectAddClass(&tobject,ClassID("SynGSclass"),CLASS_PERMANENT);
  ObjectAddClass(&tobject,ClassID("device"),CLASS_PERMANENT);
  AddDefaultFieldList(&tobject);
  tobject.defaults = (Element*) calloc(1, tobject.size);
  AddObject(&tobject);
  object = GetObject("SynG_object");
  object->defaults->object = object;
  object->defaults->name = CopyString("SynG_object");
  object->author = "ron  lab,3/97 ";
  { extern int SynG(); AddActionToObject(object, "INIT", SynG, 0) ? 0 : (Error(), printf("adding action 'INIT' to object 'SynG_object'\n")); HashFunc("SynG", SynG, "int"); }
  { extern int SynG(); AddActionToObject(object, "PROCESS", SynG, 0) ? 0 : (Error(), printf("adding action 'PROCESS' to object 'SynG_object'\n")); HashFunc("SynG", SynG, "int"); }
  { extern int SynG(); AddActionToObject(object, "RESET", SynG, 0) ? 0 : (Error(), printf("adding action 'RESET' to object 'SynG_object'\n")); HashFunc("SynG", SynG, "int"); }
  { extern int SynG(); AddActionToObject(object, "CHECK", SynG, 0) ? 0 : (Error(), printf("adding action 'CHECK' to object 'SynG_object'\n")); HashFunc("SynG", SynG, "int"); }
  { extern int SynG(); AddActionToObject(object, "SAVE2", SynG, 0) ? 0 : (Error(), printf("adding action 'SAVE2' to object 'SynG_object'\n")); HashFunc("SynG", SynG, "int"); }
  { extern int SynG(); AddActionToObject(object, "RESTORE2", SynG, 0) ? 0 : (Error(), printf("adding action 'RESTORE2' to object 'SynG_object'\n")); HashFunc("SynG", SynG, "int"); }
  slotnames[0] = "voltage";
  MsgListAdd(object, "VOLTAGE", SynG_object_VOLTAGE, slotnames, 1);
  slotnames[0] = "FastCa";
  MsgListAdd(object, "CAF", SynG_object_CAF, slotnames, 1);
  slotnames[0] = "SlowCa";
  MsgListAdd(object, "CAS", SynG_object_CAS, slotnames, 1);
  slotnames[0] = "postvoltage";
  MsgListAdd(object, "POSTVOLTAGE", SynG_object_POSTVOLTAGE, slotnames, 1);
  SetFieldListProt(object, "A", FIELD_READWRITE);
  SetFieldListDesc(object, "A", "shunts effective Ca current");
  SetFieldListProt(object, "B", FIELD_READWRITE);
  SetFieldListDesc(object, "B", "buffering parameter ");
  SetFieldListProt(object, "P", FIELD_READWRITE);
  SetFieldListDesc(object, "P", "Ca factor governing transmitter release");
  SetFieldListProt(object, "C", FIELD_READWRITE);
  SetFieldListDesc(object, "C", "limit parameter(limits release to Gbar)");
  SetFieldListProt(object, "R", FIELD_READWRITE);
  SetFieldListDesc(object, "R", "release = p^3/(p^3+C)");
  SetFieldListProt(object, "Gbar", FIELD_READWRITE);
  SetFieldListDesc(object, "Gbar", "maximal conductance");
  SetFieldListProt(object, "A1", FIELD_READWRITE);
  SetFieldListDesc(object, "A1", "A1 in Ainf=A1+A2/(1+exp(A3+(Vm+A4)))");
  SetFieldListProt(object, "A2", FIELD_READWRITE);
  SetFieldListDesc(object, "A2", "A2");
  SetFieldListProt(object, "A3", FIELD_READWRITE);
  SetFieldListDesc(object, "A3", "A3");
  SetFieldListProt(object, "A4", FIELD_READWRITE);
  SetFieldListDesc(object, "A4", "A4");
  SetFieldListProt(object, "A5", FIELD_READWRITE);
  SetFieldListDesc(object, "A5", "A5 is the time constant");
  SetFieldListProt(object, "Ik", FIELD_READONLY);
  SetFieldListDesc(object, "Ik", "Ik");
  SetFieldListProt(object, "activation", FIELD_HIDDEN);
  SetFieldListDesc(object, "activation", "activation not used");
  object->description = "A new object specifically for\ngraded synaptic inhibition in the leech\n";
  FieldListMakePermanent(object);
  MsgListMakePermanent(object);

/* Script variables */

} /* STARTUP_leech */
