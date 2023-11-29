%{
#include <stdio.h>
%}

%%

"//"(.)*$       { /*Ignorar comentarios de una sola linea*/ }
"/*"(.|\n)*"*/" { /*Ignorar comentarios de varias lineas*/ }
.|\n            { printf("%s", yytext); }

%%

int main(int argc, char *argv[]) {
        FILE *yyin = fopen(argv[1], "r");
        if(yyin == NULL) {
                printf("Error al abrir el archivo");
                return 1;
        }

        yyrestart(yyin);
        yylex();
        fclose(yyin);
        return 0;
}
