/* Definition Section*/
%{

// file required by GCC yfile_name.tab.h that  contains the definitions that scanner needs.
#include "project.tab.h"

%}



/* Rules Section*/
/* returning specified tokens for matched strings based on rules defined on left side */
%%

"and"|"assert"|"break"|"class"|"def"|"del"|"elif"|"else"|"except"|"exec"|"finally"|"for"|"from"|"global" return RESK;
"if"|"import"|"in"|"is"|"lambda"|"not"|"or"|"pass"|"raise"|"return"|"try"|"while"|"with"|"yield"|"list"|"dict" return RESK;
[a-zA-Z_][a-zA-Z0-9_]* return VAR; 
"[" return OPEN_SQ; 
"]" return CLOS_SQ;
"=" return EQ;
"{" return OPEN_BR;
"}" return CLOS_BR;
"," return COMMA;
[ \t] ;
[\n] return 0;
(('([^'])*')|[0-9]*):(('([^'])*')|[0-9]*) return PAIR;
.     { printf("\nunidentified token \n");  exit(1);}
%%




/* Auxiliary functions*/
//yywrap is called by lex when input is exhausted 
//Return 1 if  done or 0 if more processing is required.

int yywrap()
{
return 1;
}

