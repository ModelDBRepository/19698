function synconnect


// cell_4R

   // newspikegen 
   addmsg /cell_4R/soma /cell_4R/soma/spike INPUT Vm

   // SynS_object and synchan on cell_4R
   addmsg /cell_4L/soma /cell_4R/soma/mod_SynS4L4R VOLTAGE Vm
   addmsg /cell_4R/soma/mod_SynS4L4R /cell_4R/soma/SynS4L4R MOD m_SynS
   addmsg /cell_4L/soma/spike /cell_4R/soma/SynS4L4R SPIKE
   addmsg /cell_4R/soma/SynS4L4R /cell_4R/soma CHANNEL Gk Ek
   addmsg /cell_4R/soma /cell_4R/soma/SynS4L4R VOLTAGE Vm

   // graded synapses on cell_4R
   addmsg /cell_4R/soma/SynG cell_4R/soma CHANNEL Gk Ek
   addmsg /cell_4L/soma /cell_4R/soma/SynG VOLTAGE Vm 
   addmsg /cell_4L/soma/CaF_ron /cell_4R/soma/SynG CAF Ik 
   addmsg /cell_4L/soma/CaS_ron /cell_4R/soma/SynG CAS Ik
   addmsg /cell_4R/soma /cell_4R/soma/SynG POSTVOLTAGE Vm 

 
// cell_4L

   // newspikegen 
   addmsg /cell_4L/soma /cell_4L/soma/spike INPUT Vm

   // SynS_object and synchan on cell_4L
   addmsg /cell_4R/soma /cell_4L/soma/mod_SynS4R4L VOLTAGE Vm
   addmsg /cell_4L/soma/mod_SynS4R4L /cell_4L/soma/SynS4R4L MOD m_SynS
   addmsg /cell_4R/soma/spike /cell_4L/soma/SynS4R4L SPIKE
   addmsg /cell_4L/soma/SynS4R4L /cell_4L/soma CHANNEL Gk Ek
   addmsg /cell_4L/soma /cell_4L/soma/SynS4R4L VOLTAGE Vm

   // graded synapse on cell_4L
   addmsg /cell_4L/soma/SynG /cell_4L/soma CHANNEL Gk Ek
   addmsg /cell_4R/soma /cell_4L/soma/SynG VOLTAGE Vm  
   addmsg /cell_4R/soma/CaF_ron /cell_4L/soma/SynG CAF Ik 
   addmsg /cell_4R/soma/CaS_ron /cell_4L/soma/SynG CAS Ik 
   addmsg /cell_4L/soma /cell_4L/soma/SynG POSTVOLTAGE Vm 

/*
// cell_5L extra cell

   // SynS_object and synchan on cell_5L 
   addmsg /cell_4L/soma /cell_5L/soma/mod_SynS4L5L VOLTAGE Vm
   addmsg /cell_5L/soma/mod_SynS4L5L /cell_5L/soma/SynS4L5L MOD m_SynS
   addmsg /cell_4L/soma/spike /cell_5L/soma/SynS4L5L SPIKE
   addmsg /cell_5L/soma/SynS4L5L /cell_5L/soma CHANNEL Gk Ek
   addmsg /cell_5L/soma /cell_5L/soma/SynS4L5L VOLTAGE Vm

   // graded synapses on cell_5L
   addmsg /cell_5L/soma/SynG cell_5L/soma CHANNEL Gk Ek
   addmsg /cell_4L/soma /cell_5L/soma/SynG VOLTAGE Vm 
   addmsg /cell_4L/soma/CaF_ron /cell_5L/soma/SynG CAF Ik 
   addmsg /cell_4L/soma/CaS_ron /cell_5L/soma/SynG CAS Ik 
   addmsg /cell_5L/soma /cell_5L/soma/SynG POSTVOLTAGE Vm 
*/

end
































