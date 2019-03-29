%{
#include<stdio.h>            //declarations translation
void yyerror(char *);
%}
%%


[ /t] ;                     /* Skip whitespace */

[ + | - | * | / | % | = ] { printf("\n%s is a arithmatic operator",yytext); }               /* Checks if token is an operator  */

[; | , | { | } | ( | )] { printf("\n%s is a separator",yytext); }                           /* Checks if token is a separator */

if |                                      /* Checks if token is a keyword */
for |
while |
goto |
do |
switch |
case |
break |
continue |
void |
auto |
char |
const |
default |
double |
else |
enum |
extern |
float |
int |
long |
register |
return |
short |
signed |
sizeof |
static |
struct |
typedef |
union |
unsigned |
volatile |
main |
include       { printf("\n%s is a keyword",yytext); }

[0-9]+  { printf("\n %s is a constant",yytext); }   /* To check if token is a constant */

[a-zA-Z_][a-zA-Z0-9_]* { printf("\n%s is an identifier",yytext); }  /* Checks if token is an identifier */

[.|\n] ECHO;
%%

void yyerror(char *s){
    printf("%s\n",s);
}

main()
{
yyin = fopen("code.txt","r");       /* Use fopen to open the text file in read mode */
if (yyin == NULL){
    yyerror("Error while opening file");     /* Display error message if file cannot be opened */
}
yylex();                        /* Used to call the lexical analyser */
}
int yywrap()
{
return 0;
}

/*
--------------------------------------------------------

Source Code:

void main ( )
{
int postition , initial , rate ;
postition = initial + rate * 60 ;
}

---------------------------------------------------------

Output:

void is a keyword
main is a keyword
( is a separator
) is a separator

{ is a separator

int is a keyword
postition is an identifier
, is a separator
initial is an identifier
, is a separator
rate is an identifier
; is a separator

postition is an identifier
= is a arithmatic operator
initial is an identifier
+ is a arithmatic operator
rate is an identifier
* is a arithmatic operator
 60 is a constant
; is a separator

} is a separator

*/
