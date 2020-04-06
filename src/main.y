

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token S N C TWOP I F IM FM

%%

V:
	ES {printf("VALIDO\n");};
	
ES:
	ES ES ;
	| I S TWOP ES F ;
	| I S TWOP S F ;
	| I S TWOP S C ;
	| S TWOP S F ;
	| S TWOP S C ;
	| I S TWOP N F ;
	| I S TWOP N C ;
	| S TWOP N F ;
	| S TWOP N C ;
	| LIST ;

LIST:
	IM SEQ FM ;
	| IM FM ;

SEQ:
	ELEM C SEQ  ;
	| ELEM ;

ELEM:
	S ;
	| N ;
	| LIST ;
	
%%

void yyerror(char *s) { 
	printf("INVALIDO\n");
	exit (1);
}

int main() {
	yyparse();
	return 0;
}
