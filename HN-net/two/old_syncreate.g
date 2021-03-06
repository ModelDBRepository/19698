//genesis

/* FILE INFORMATION
** 
** This file creates the various synaptic objects of the 
** HN simulation.  
** 
** 
**
** 
*/

function syncreate

// CONSTANTS

float Es = -0.0625 // rev pot of inhibitory synapses
float G_gbar = 3e-8 // gbar of graded synapses
float C = 1e-32 // C of graded synapse
float S_gbar = 6e-8 // gbar of spiked mediated synapses within one ganglion
float S2_gbar = 8e-9 // gbar of spiked mediated synapses between 1,2 ->3,4
float S3_gbar = 6e-9 // gbar of spiked mediated synapses between 3,4 ->1,2
float S_tau1 = 1.1e-2 // tau1 of spike mediated synapse
float S_tau2 = 2e-3 // tau2 of spike mediated synapse

float S3_tau1 = 55e-3 // tau1 of spike mediated synapse onto 1,2
float S3_tau2 = 10e-3 // tau2 of spike mediated synapse onto 1,2
float threshold  = -.005 // spike detection threshold
float refract = .005 // refractory time of spike detection


// right cell 4

str chanpath = "/cell_4R/soma/mod_SynS4L4R"
create SynS_object  {chanpath}
setfield  {chanpath}  m_SynS     0.0      

str chanpath = "/cell_4R/soma/SynS4L4R"   
create	synchan	{chanpath}
    	setfield	        {chanpath} \
	Ek			{Es} \
	tau1		        {S_tau1} \	// sec
	tau2		        {S_tau2} \	// sec
	gmax		        {S_gbar}		// Siemens

str chanpath = "/cell_4R/soma/SynG"
create SynG_object {chanpath}
setfield {chanpath} \    
         Ek      {Es}   \
         Gbar    {G_gbar}   
//         C   	 {C}   

str chanpath = "/cell_4R/soma/spike"
create newspikegen {chanpath}
setfield {chanpath}        \
          thresh {threshold}     \
	  abs_refract {refract} \ 
          output_amp 1



// left cell 4

str chanpath = "/cell_4L/soma/mod_SynS4R4L"
create SynS_object  {chanpath}
setfield  {chanpath}  m_SynS     0.0      

str chanpath = "/cell_4L/soma/SynS4R4L"
create	synchan	{chanpath}
    	setfield	        {chanpath} \
	Ek			{Es} \
	tau1		        {S_tau1} \	// sec
	tau2		        {S_tau2} \	// sec
	gmax		        {S_gbar}		// Siemens

str chanpath = "/cell_4L/soma/SynG"
create SynG_object {chanpath}
setfield {chanpath} \    
         Ek      {Es}   \
         Gbar    {G_gbar}   
//         C       {C}

str chanpath = "/cell_4L/soma/spike"
create newspikegen {chanpath}
setfield {chanpath}        \
          thresh {threshold}     \
	  abs_refract {refract} \ 
          output_amp 1


//cell 5L  extra cell 
str chanpath = "/cell_5L/soma/mod_SynS4L5L"
create SynS_object  {chanpath}
setfield  {chanpath}  m_SynS     0.0      

str chanpath = "/cell_5L/soma/SynS4L5L"   
create	synchan	{chanpath}
    	setfield	        {chanpath} \
	Ek			{Es} \
	tau1		        {S_tau1} \	// sec
	tau2		        {S_tau2} \	// sec
	gmax		        {S_gbar}		// Siemens

str chanpath = "/cell_5L/soma/SynG"
create SynG_object {chanpath}
setfield {chanpath} \    
         Ek      {Es}   \
         Gbar    {G_gbar}   
//         C   	 {C}   


end // syncreate










