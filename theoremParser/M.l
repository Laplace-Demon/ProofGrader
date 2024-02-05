%option noyywrap yylineno
%option outfile="flex.c" header-file="flex.h"
%{
#include "M.tab.h"
#include "func.h"
%}

%%

    /* natural language */
"is" {};

"at"|"on"|"in"|"by"|"of" {
    return PREP;
}

"continuous" {
    return TCONTINUOUS;
}

"uniformly continuous" {
    return TUNICONTINUOUS;
}

"monotonically increasing" {
    return TMONOINC;
}

"cauchy sequence" {
    return TCAUCHYSEQ;
}

"bounded" {
    return TBOUNDED;
}

"bounded above" {
    return TBOUNDEDABOVE;
}

"subsequence of" {
    return TSUBSEQ;
}

    /* numbers */

[0-9]+ {
    yylval.number = atoi(yytext);
    return TNUM;
}

    /* constants and variables */

"\\infty" {
    return TINFTY;
}

"+\\infty" {
    return TPINFTY;
}

"-\\infty" {
    return TNINFTY;
}

"\\pi"|"π" {
    return TCONSTPI;
}

"e" {
    return TCONSTE;
}

[A-Za-z][A-Za-z0-9_]* {
    yylval.str = strdup(yytext);
    return TVAR;
}

"\\delta" {
    yylval.str = "delta";
    return TVAR;
}

"\\epsilon"|"\\varepsilon" {
    yylval.str = "epsilon";
    return TVAR;
}

"\\phi" {
    yylval.str = "phi";
    return TVAR;
}

    /* operators */

"\\sup" {
    return TSUP;
}

"\\sin" {
    return TSIN;
}

"\\cos" {
    return TCOS;
}

"|"|"\\mid" {
    return TABS;
}

"\\lceil" {
    return LCEIL;
}

"\\rceil" {
    return RCEIL;
}

"\\lfloor" {
    return LFLOOR;
}

"\\rfloor" {
    return RFLOOR;
}

"+" {
    return TADD;
}

"\\times"|"\\cdot"|"\\ast"|"*" {
    return TTIME;
}

"\\div"|"/" {
    return TDIV;
}

"-" {
    return TMINUS;
}

"^" {
    return TPOWER;
}

"\\frac" {
    return TFRAC;
}

    /* predicates */

"=" {
    return TEQ;
}

"\\leq"|"\\le" {
    return TLEQ;
}

"\\geq"|"\\ge" {
    return TGEQ;
}

"\\lt"|"<" {
    return TLT;
}

"\\gt"|">" {
    return TGT;
}

"\\neq" {
    return TNEQ;
}

"\\in" {
    return TIN;
}

"\\lim\\limits\_" {
    return TLIM;
}

"\\to" {
    return TTO;
}

    /* quantifiers */

"\\forall " {
    return TFORALL;
}

"\\exists " {
    return TEXISTS;
}

"(" {
    return LB1L;
}

")" {
    return LB1R;
}

"\\["|"【"|"[" {
    return LB2L;
}

"\\]"|"】"|"]" {
    return LB2R;
}
"\{"|"{"|"\\lbrace" {
    return LB3L;
}

"\}"|"}"|"\\rbrace" {
    return LB3R;
}

    /* connectors */

"\\implies" {
    return PIMPLY;
}

    /* separators */

"," {
    return COMMA;    
}

[ \t\n\r] {};

.   {printf("%s", yytext);
     yyerror("Mystery Character.");}
%%