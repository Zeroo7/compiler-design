%{  
#include<stdio.h>  
#include<stdlib.h>  
%}
%token num alpha INC DEC END  
%left '+''-'  
%left '*''/'  
%right '^'   
%nonassoc UMINUS  
%%
S : E END{printf("\n Accepted\n");exit(0);} 
;

E: E'+'E   
  |E'-'E   
  |E'*'E   
  |E'/'E  
  |E'^'E  
  |'('E')'   
  |'-'E %prec UMINUS  
  |alpha  
  |num  
  |alpha INC  
  |alpha DEC   
;  
%%

int yywrap()
{
return 0;
}
int main()  
{   
 yyparse();  
 return 0;  
}  
yyerror(char *s)  
{  
  printf("\nError");  
}  


