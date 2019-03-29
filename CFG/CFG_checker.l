%{  
#include "myfile.tab.h"  
%}  
%%  
"++" {return INC;}  
"--" {return DEC;}  
[0-9]+ {return num;}  
[a-zA-Z]+ {return alpha;}  
[ \t\n]+     {;} 
"$" { return END; }
.  {return yytext[0];}  
%%  
