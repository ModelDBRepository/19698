function make_spiketrig

float threshold  = -.005 // spike detection threshold
float refract = 6.0 // .005 refractory time of spike detection

str chanpath = "/cell_1L/soma/spike2"
create newspikegen {chanpath}
setfield {chanpath}        \
          thresh {threshold}    \
	  abs_refract {refract} \ 
          output_amp 1


str chanpath = "/cell_1R/soma/spike2"
create newspikegen {chanpath}
setfield {chanpath}        \
          thresh {threshold}     \
	  abs_refract {refract} \ 
          output_amp 1

addmsg /cell_1L/soma /cell_1L/soma/spike2 INPUT Vm
addmsg /cell_1L/soma/spike2 /pulse0 INPUT state
addmsg /cell_1R/soma /cell_1R/soma/spike2 INPUT Vm
addmsg /cell_1R/soma/spike2 /pulse1 INPUT state


end


