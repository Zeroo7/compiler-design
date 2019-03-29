%{
	#include "cd5.tab.h"
%}

%%

"for" {return FOR;}
"if" {return IF;}
"else" {return ELSE;}
"while" {return WHILE;}
"do" {return DO;}
"switch" {return SWITCH;}
"case" {return CASE;}
"break" {return BREAK;}
"default" {return DEFAULT;}

[a-zA-Z]+ {return alpha;}
[0-9]+ {return num;}
[ \n\t] {;}
"==" {return EQUAL;}
"++" {return INC;}
"--" {return DEC;}
">=" {return GE;}
"<=" {return LE;}
">" {return GT;}
"<" {return LT;}
"!=" {return NE;}
"&&" {return AND;}
"||" {return OR;}
"$" {return END;}  
.  {return yytext[0];}  
%%  
