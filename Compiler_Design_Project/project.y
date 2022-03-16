/* Definition section */
%{

//required header files and functions
#include <stdio.h> // used for standard input output
int yylex(); // including this would eliminate the warnings about yylex
void yyerror(); //discussed below

%}

//defining tokens
// VAR = valid variable name for list
// PAIR = represents key value pair in dictionary eg "anand":1  
// RESK = reserved keyword
// OPEN_SQ represents "[" similarly other tokens are defined see lex file for reference 


%token VAR PAIR OPEN_SQ CLOS_SQ EQ OPEN_BR CLOS_BR COMMA RESK

// Defining precedence and associativity
// refer this-> https://climserv.ipsl.polytechnique.fr/documentation/idl_help/Operator_Precedence.html
%left '[' ']'
%left '{' '}'
%right EQ


//grammar productions and the actions for each production
%%

lst:  LNAME EQ T{printf("VALID EXPRESSION\n");return 0;}
T: OPEN_SQ  CLOS_SQ 
 | OPEN_SQ DICT CLOS_SQ
; 

DICT: OPEN_BR  REP_PAIR CLOS_BR 
    | OPEN_BR  REP_PAIR CLOS_BR COMMA X
    | OPEN_BR CLOS_BR COMMA X
    | OPEN_BR CLOS_BR
    ;
    
	   
X: DICT
 |
 ;    

REP_PAIR:  PAIR
        |  PAIR COMMA Y
		; 

		
Y: REP_PAIR
 |
 ;

LNAME : VAR 
      | CHECK{yyerror(); YYABORT;};

CHECK : RESK
      ;      
		  
%%



//driver code
void main()
{
printf("define list :\n");
//call yyparse() to initiate the parsing process.
yyparse();
}

//yyerror() function is called when all productions in the grammar in second section doesn't match to the input statement.
void yyerror()
{
printf("list declaration is Invalid \n\n");
}

