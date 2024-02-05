%{
	// this part is copied to the beginning of the parser 
	#include "func.h"
	#include <stdio.h>
	#include "flex.h"
	void yyerror(char*);
	int yylex(void);
	struct AstNode *root;
%}

%union {
    int number;
    char *str;
    struct AstNode *node;
    struct LimitHeadNode *head;
    struct QuantifierNode *quantHead;
} 

// Natural Language
%token <str> PREP TCONTINUOUS TUNICONTINUOUS TMONOINC TCAUCHYSEQ TBOUNDED TBOUNDEDABOVE TSUBSEQ

// Terms
%token <number> TNUM

%token <str> TCONSTPI TCONSTE TVAR TINFTY TPINFTY TNINFTY

// Term operators:
%token <str> TADD TTIME TDIV TMINUS TPOWER TSQRT TSIN TCOS TLN TDERI TFRAC TLIM TSUP

// Predicates:
%token <str> TEQ TLEQ TGEQ TLT TGT TNEQ TIN

// Limit Operators:
%token <str> TTO

// Marks:
%token <str> COMMA

// Quantifiers:
%token <str> TFORALL TEXISTS

// Connectives:
%token <str> PIMPLY

// Brackets:
%token <str> LB1L LB1R LB2L LB2R LB3L LB3R

// Separated operators:
%token <str> TABS LCEIL RCEIL LFLOOR RFLOOR

//high
%right TVAR
%left TMINUS TADD
%left TTIME TDIV
%right TPOWER
%right PIMPLY
//low

%type <node> TERM PROPOSITION
%type <head> LIM_HEAD
%type <quantHead> QUANTIFIER

%%

PROPOSITION: TERM TCONTINUOUS
    {
        printf("->TCONTINUOUS");
        $$ = createUnaryPredNode(CONTINUE, $1);
        root = $$;
    }
    | TERM TUNICONTINUOUS
    {
        printf("->TUNICONTINUOUS");
        $$ = createUnaryPredNode(UNICONTINUE, $1);
        root = $$;
    }
    | TERM TBOUNDEDABOVE
    {
        printf("->TBOUNDEDABOVE");
        $$ = createUnaryPredNode(BOUNDEDABOVE, $1);
        root = $$;
    }
    | TERM TMONOINC
    {
        printf("->TMONOINC");
        $$ = createUnaryPredNode(MONOINC, $1);
        root = $$;
    }
    | TERM TBOUNDED
    {
        printf("->TBOUNDED");
        $$ = createUnaryPredNode(BOUNDED, $1);
        root = $$;
    }
    | TERM TCAUCHYSEQ
    {
        printf("->TCAUCHYSEQ");
        $$ = createUnaryPredNode(CAUCHYSEQ, $1);
        root = $$;
    }
    | TERM TEQ TERM
    {
        printf("->TEQ");
        $$ = createBinaryPredNode(EQ, $1, $3);
        root = $$;
    }
    | TERM TLEQ TERM
    {
        printf("->TLEQ");
        $$ = createBinaryPredNode(LEQ, $1, $3);
        root = $$;
    }
    | TERM TGEQ TERM
    {
        printf("->TGEQ");
        $$ = createBinaryPredNode(GEQ, $1, $3);
        root = $$;
    }
    | TERM TLT TERM
    {
        printf("->TLT");
        $$ = createBinaryPredNode(LT, $1, $3);
        root = $$;
    }
    | TERM TGT TERM
    {
        printf("->TGT");
        $$ = createBinaryPredNode(GT, $1, $3);
        root = $$;
    }
    | TERM TNEQ TERM
    {
        printf("->TNEQ");
        $$ = createBinaryPredNode(NEQ, $1, $3);
        root = $$;
    }
    | TERM TCONTINUOUS PREP TERM
    {
        printf("->TCONTINUOUSON");
        $$ = createBinaryPredNode(CONTINUEON, $1, $4);
        root = $$;
    }
    | TERM TUNICONTINUOUS PREP TERM
    {
        printf("->TUNICONTINUOUSON");
        $$ = createBinaryPredNode(UNICONTINUEON, $1, $4);
        root = $$;
    }
    | TERM TIN TERM
    {
        printf("->TIN");
        $$ = createBinaryPredNode(IN, $1, $3);
        root = $$;
    }
    | TERM TBOUNDEDABOVE PREP TERM
    {
        printf("->TBOUNDEDABOVEBY");
        $$ = createBinaryPredNode(BOUNDEDABOVEBY, $1, $4);
        root = $$;
    }
    | TERM TSUBSEQ PREP TERM
    {
        printf("->TSUBSEQ");
        $$ = createBinaryPredNode(ISSUBSEQ, $1, $4);
        root = $$;
    }
    | QUANTIFIER COMMA PROPOSITION
    {
        printf("->PROP_QUANT");
        $$ = createQuantifiedPropNode($1, $3);
        root = $$;
    }
    | LB1L PROPOSITION PIMPLY PROPOSITION LB1R
    {
        printf("->IMPLY");
        $$ = createBinaryConNode(IMPLY, $2, $4);
        root = $$;
    }
    | LB1L PROPOSITION LB1R
    {
        printf("->PARENTHESE");
        $$ = $2;
        root = $$;
    }
;

TERM: TNUM
    {
        printf("->NUMBER");
        $$ = createNumberNode($1);
    }
    | TCONSTPI
    {
        printf("->CONSTPI");
        $$ = createConstNode(PI);
    }
    | TCONSTE
    {
        printf("->TCONSTE");
        $$ = createConstNode(E);
    }
    | TVAR
    {
        printf("->TVAR%s", $1);
        $$ = createVariableNode($1);
    }
    | TERM TADD TERM
    {
        printf("->TADD");
        $$ = createBinaryOpNode(ADD, $1, $3);
    }
    | TERM TMINUS TERM
    {
        printf("->TMINUS");
        $$ = createBinaryOpNode(MINUS, $1, $3);
    }
    | TERM TTIME TERM
    {
        printf("->TTIME");
        $$ = createBinaryOpNode(TIME, $1, $3);
    }
    | TERM TDIV TERM
    {
        printf("->TDIV");
        $$ = createBinaryOpNode(DIV, $1, $3);
    }
    | TERM TPOWER TERM
    {
        printf("->TPOWER");
        $$ = createBinaryOpNode(POWER, $1, $3);
    }
    | TFRAC LB3L TERM LB3R LB3L TERM LB3R
    {
        printf("->TFRAC");
        $$ = createBinaryOpNode(DIV, $3, $6);
    }
    | TSUP LB3L TERM LB3R {
        printf("->TSUP");
        $$ = createUnaryOpNode(SUP, $3);
    }
    | TSIN LB3L TERM LB3R
    {
        printf("->TSIN");
        $$ = createUnaryOpNode(SIN, $3);
    }
    | TCOS LB3L TERM LB3R
    {
        printf("->TCOS");
        $$ = createUnaryOpNode(COS, $3);
    }
    | TABS TERM TABS
    {
        printf("->TABS");
        $$ = createUnaryOpNode(ABS, $2);
    }
    | LCEIL TERM RCEIL
    {
        printf("->CEIL");
        $$ = createUnaryOpNode(CEIL, $2);
    }
    | LFLOOR TERM RFLOOR
    {
        printf("->FLOOR");
        $$ = createUnaryOpNode(FLOOR, $2);
    }
    | TINFTY
    {
        printf("->INFTY");
        $$ = createInftyNode(INFTY);
    }
    | TPINFTY
    {
        printf("->INFTY");
        $$ = createInftyNode(P_INFTY);
    }
    | TNINFTY
    {
        printf("->INFTY");
        $$ = createInftyNode(N_INFTY);
    }
    | LIM_HEAD LB3L TERM LB3R
    {
        printf("->LIM");
        $$ = createLimitNode($1, $3);
    }
    | TVAR LB1L TERM LB1R
    {
        printf("->APPLY");
        $$ = createFunctionNode($1, $3);
    }
    | LB1L TERM LB1R
    {
        printf("->PARENTHESE");
        $$ = $2;
    }
;

LIM_HEAD: TLIM LB3L TVAR TTO TERM LB3R
   {
        printf("->LIM_HEAD");
        $$ = createLimitHeadNode($3, $5);
   }
;

QUANTIFIER: TFORALL TVAR
    {
        printf("->FORALL");
        $$ = createQuantifierNode(FORALL, $2);
    }
    | TEXISTS TVAR
    {
        printf("->EXISTS");
        $$ = createQuantifierNode(EXISTS, $2);
    }
    | TFORALL PROPOSITION
    {
        printf("->PROP_FORALL");
        $$ = createPropQuantifierNode(FORALL, $2);
    }
    | TEXISTS PROPOSITION
    {
        printf("->PROP_EXISTS");
        $$ = createPropQuantifierNode(EXISTS, $2);
    }
;

%%

void yyerror(char* s)
{
    fprintf(stderr , "%s\n",s);
}
