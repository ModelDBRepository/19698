float a=.3
float b=.7
float c=1500
float d=.04
float e=0.2

str chanpath = "/cell_4R/soma/mod_SynS1R4R"
//create SynS_object  {chanpath}
setfield  {chanpath}  m_SynS     0.0      
setfield {chanpath} A {a}
setfield {chanpath} B {b}
setfield {chanpath} C {c}
setfield {chanpath} D {d}
setfield {chanpath} E {e}

str chanpath = "/cell_4R/soma/mod_SynS2R4R"
//create SynS_object  {chanpath}
setfield  {chanpath}  m_SynS     0.0      
setfield {chanpath} A {a}
setfield {chanpath} B {b}
setfield {chanpath} C {c}
setfield {chanpath} D {d}
setfield {chanpath} E {e}

str chanpath = "/cell_4L/soma/mod_SynS1L4L"
//create SynS_object  {chanpath}
setfield  {chanpath}  m_SynS     0.0      
setfield {chanpath} A {a}
setfield {chanpath} B {b}
setfield {chanpath} C {c}
setfield {chanpath} D {d}
setfield {chanpath} E {e}

str chanpath = "/cell_4L/soma/mod_SynS2L4L"
//create SynS_object  {chanpath}
setfield  {chanpath}  m_SynS     0.0      
setfield {chanpath} A {a}
setfield {chanpath} B {b}
setfield {chanpath} C {c}
setfield {chanpath} D {d}
setfield {chanpath} E {e}


