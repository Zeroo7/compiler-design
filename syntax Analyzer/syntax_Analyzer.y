%{
#include<stdio.h>
#include<stdlib.h>
%}

%token FOR EQUAL INC DEC alpha num GE LE GT LT NE AND OR END WHILE DO SWITCH CASE BREAK DEFAULT VOID MAIN INT FLOAT CHAR
%left '+''-'
%left '*''/'
%right '='
%right '^'
%nonassoc UMINUS
%nonassoc IF
%nonassoc ELSE
//%nonassoc WHILE
//%nonassoc DO
//%nonassoc SWITCH
//%nonassoc CASE
//%nonassoc BREAK
%left LT GT LE GE EQUAL NE
%left AND OR

%%
A: S END  {printf("\nAccepted\n"); exit(0);}
;
S: ST S
  |ST
;
ST:	IF'('F')''{'ST'}'%prec IF
	|IF'('F')''{'ST'}' ELSE'{'ST'}'
	|FOR '('E';'F';'E')''{'ST'}'
	|WHILE'('F')''{'ST'}'
	|DO'{'ST'}'WHILE'('F')'';'
	|DT declare';'
	|E';'
	|E';'ST
;
DT: INT 
;

declare:declare','declare
       |alpha
       |alpha'='num
;       

F:	C LO C
	|C
;

C:	E RELOP E
	|E
;

LO:	AND
	|OR
;

RELOP:	LT|
	GT|
	LE|
	GE|
	EQUAL|
	NE
;

E:	alpha '=' E	
	|E '+' E
	|E '-' E
	|E '*' E
	|E '/' E
	|E '^' E
	|'('E')'
	|'-'E %prec UMINUS
	|alpha
	|num
	|alpha INC
	|alpha DEC
;
%%

int main(){
	yyparse();
	return 0;
}

int yywrap(){
	return 0;
}

int yyerror(char*s){
	printf("Error");
}
