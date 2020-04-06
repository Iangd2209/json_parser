
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[{] { return I; }

[0-9]+[,][0-9]+ {yyerror("INVALIDO");};

[0-9]+([.][0-9]+)? { return N; }

["][a-zA-Z0-9[:space:]]+["] { return S; }

(:) { return TWOP; }

(,) { return C; }

[[] { return IM; }

[]]+ { return FM; }

[}] { return F; }

\n ;

[[:space:]]+ ;


. {yyerror("INVALIDO");};

%%

int yywrap() {
  return 1;
}
