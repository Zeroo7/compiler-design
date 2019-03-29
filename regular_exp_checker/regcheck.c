#include<stdio.h>
#include<regex.h>
#include<stdlib.h>

int main()
{
char src[100];
char pat[20];
size_t nmatch=1;
regmatch_t pmatch[1];
int rc;
regex_t preg;
printf("\n Enter the string to check");
scanf("%s",src);
printf("\n Enter the pattern to check");
scanf("%s",pat);
printf("\n Enterd String : %s",src);
printf("\n Enterd Regular Expr : %s",pat);
rc=regcomp(&preg,pat,REG_EXTENDED);
if(rc!=0)
{
printf("regcomp() failed.returning nonzero %d",rc);
exit(1);
}
rc=regexec(&preg,src,nmatch,pmatch,0);
if(rc!=0)
{
printf("regexec() failed.returning nonzero %d",rc);
}
else
{
printf("\nmatched\n");
}
return 0;
}
