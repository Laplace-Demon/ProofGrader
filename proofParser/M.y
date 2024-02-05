%{
	// this part is copied to the beginning of the parser 
	#include "func.h"
	#include <stdio.h>
	#include "flex.h"
	void yyerror(char*);
	int yylex(void);
	struct ast *root;
%}

%union {
//no special need for double ,just to make a union to define the type as node.
struct ast* a;
double d;
}

// Terms
%token <a> TCONST TFUNC TNUM TVAR

// Term operations
%token <a> Tadd Ttimes Tdiv Tminus Tfrac Tsqrt Tsin Tcos  Tsup Tln Tderi DERI BOTH

// Term relations , like '\leq' '\geq'
%token <a> Teq Tleq Tgeq Tneq Tequiv Tlt Tgt Deq

// Limit Terms
%token <a> Tlim Tto Tinfty TPinfty TNinfty
// Marks:
%token <a> GOAL MATH1 MATH2 PROOF CODEBOX QED ASSUM GIVEN COMMA 
// methods
%token <a> PWP PAP CWP CAP CS PS
// Known things
%token <a> KASaverage KSGaverage KAGaverage 
// Actions:
%token <a> REMEMBER CONCLUDE EQUNADD SINCE TRANS THEN SAME FOR
// Brackets:
%token <a> LB1L LB1R LB2L LB2R LB3L LB3R ABS MIN
// For Limit sample:
%token <a> LCEIL RCEIL LFLOOR RFLOOR LIM_DEF TO_PROVE
//action statement
%token <a> INTROS SUPPOSE SET AUTO_CONC AUTO_NOHINT USE Tforall Texists Tpower BECAUSE
//FOr continue
%token <a> IN IF IS HAVE CONTINUE CONTINUE_DEF UCONTINUE UC_DEF FSqueeze SUPRE_THEOREM SUPRE_DEF BOUND_BELOW BOUND_ABOVE
//properties of sequence
%token<a> MONOINC MONODEC TBELONG
//Line Number
%token <a> TLINE
//nonterminal leaf (have line number)
%type <a> LPAP
%type <a> TLCONST TLVAR TLNUM  TLsqrt TLln TLderi TLfrac TLeq DLeq TLleq TLgeq TLlt TLgt TLneq TLequiv TLlim TLto TLinfty TLPinfty TLNinfty TLsin TLcos TLsup TLforall TLexists
%type <a> LGOAL LMATH1 LMATH2 LPROOF LQED LGIVEN LUSE LKASaverage LKSGaverage LKAGaverage LREMEMBER LCONCLUDE LEQUNADD LSINCE  LTRANS LTHEN LSAME LLB1L LLB1R LLB2L LLB2R LLB3L LLB3R LABS LMIN LCOMMA LBOTH LFOR LDERI LMONOINC LMONODEC
%type <a> LLCEIL LRCEIL LLFLOOR LRFLOOR LLIM_DEF LTO_PROVE LCONTINUE_DEF  LUC_DEF LFSqueeze LINTROS LSUPPOSE LSET LIN LIS LIF LHAVE LAUTO_CONC LAUTO_NOHINT  LCONTINUE LUCONTINUE FUNC_HEAD LSUPRE_THEOREM LSUPRE_DEF LBECAUSE LBOUND_ABOVE LBOUND_BELOW TLBELONG
//to reduce conflicts and let Mult priorer to add.
//high
%right TVAR
%right KSGaverage KAGaverage KASaverage
%left Tminus Tadd 
%left Ttimes Tdiv
%right Tpower 

%left TO_PROVE

//low

%type <a> PROGRAM STATEMENT PROOF_STATEMENT_LIST PROOF_STATEMENT GOAL_STATEMENT GIVEN_STATEMENT MATH_EQUATION_LIST MATH_EQUATION EQUATION ACTION  EXPR LIM_HEAD KNOWLEDGE SINCE_CLAUSE MEMORY_TERM CONTINUED_EQUATION CONTINUED_VAR EQS TEQ ACTION_STATEMENT INTERVAL  FUNC_EQUATION 

%%
PROGRAM: STATEMENT
	{
	printf("->PROGRAM\n");
	$$ = (newast(nt_PROGRAM,NULL,prog_single,$1,NULL,$1->lineNum));
	root=$$;
	}
	| STATEMENT PROGRAM
	{
	printf("->PROGRAM\n");
	$$ = (newast(nt_PROGRAM,NULL,prog_list,$1,$2,$2->lineNum));
	root=$$;
	}
    

;

STATEMENT: GOAL_STATEMENT
    {
        printf("->STATEMENT\n");
        $$ = (newast(nt_STATEMENT,NULL,stmt_goal,$1,NULL,$1->lineNum));
    }
    | GIVEN_STATEMENT
    {
        printf("->STATEMENT\n");
        $$ = (newast(nt_STATEMENT,NULL,stmt_given,$1,NULL,$1->lineNum));
    }
    | PROOF_STATEMENT_LIST
    {
        printf("->STATEMENT\n");
        $$ = (newast(nt_STATEMENT,NULL,stmt_proof_list,$1,NULL,$1->lineNum));
    }
    | LPROOF
    {
        printf("STATEMENT\n");
        $$ = (newast(nt_STATEMENT,NULL,stmt_proof,$1,NULL,$1->lineNum));
    }
 
;

PROOF_STATEMENT_LIST : PROOF_STATEMENT
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_list_single)\n");
        $$ = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_list_single,$1,NULL,$1->lineNum));
    }
    | PROOF_STATEMENT LCOMMA PROOF_STATEMENT_LIST
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_list)\n");
        struct ast *label = newast(others_remember,NULL,0,$1,$3,$3->lineNum);
        $$ = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_list,$2,label,label->lineNum));
    }
    | LPAP MATH_EQUATION LLB3L PROOF_STATEMENT_LIST LLB3R PROOF_STATEMENT_LIST
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_PoseAndProve)\n");
        struct ast *label = newast(others_remember,NULL,0,$4,$6,$6->lineNum);
        $$ = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_PoseAndProve,$2,label,$5->lineNum));
    }
    | ACTION_STATEMENT LLB3L PROOF_STATEMENT_LIST LLB3R PROOF_STATEMENT_LIST
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_PoseVar)\n");
        struct ast *label = newast(others_remember,NULL,0,$3,$5,$5->lineNum);
        $$ = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_PoseVar,$1,label,$4->lineNum));
    }
;

PROOF_STATEMENT : LQED
    {
        printf("->PROOF_STATEMENT\n");
        $$ = (newast(nt_PROOF_STATEMENT,NULL,stmt_qed,$1,NULL,$1->lineNum));
    }
    | SINCE_CLAUSE LTHEN MATH_EQUATION LREMEMBER MEMORY_TERM
    {
        printf("->PROOF_STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,$3,$5,$5->lineNum);
        $$ = newast(nt_PROOF_STATEMENT,NULL,stmt_since_remember_as,$1,label,label->lineNum);
    }
    | ACTION LTHEN MATH_EQUATION LREMEMBER MEMORY_TERM
    {
        printf("->PROOF_STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,$3,$5,$5->lineNum);
        $$ = newast(nt_PROOF_STATEMENT,NULL,stmt_action_math_equation,$1,label,label->lineNum);
    }
    | ACTION LTHEN LCONCLUDE
    {
        printf("->PROOF_STATEMENT\n");
        $$ = (newast(nt_PROOF_STATEMENT,NULL,stmt_action_conclude,$1,$3,$3->lineNum));
    }
    | LUSE LLIM_DEF LTO_PROVE
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        $$ = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_limit_to_prove,$1,$2,$3->lineNum));
    }
    | LUSE LCONTINUE_DEF LTO_PROVE
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        $$ = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_continue_to_prove,$1,$2,$3->lineNum));
    }
    | LUSE LUC_DEF LTO_PROVE
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        $$ = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_uc_to_prove,$1,$2,$3->lineNum));
    }
    | ACTION_STATEMENT
    {
        printf("->proof_statement:action_statement\n");
        $$ = (newast(nt_PROOF_STATEMENT,NULL,stmt_action,$1,NULL,$1->lineNum));
    }
    |SINCE_CLAUSE MATH_EQUATION
    {
        printf("->PROOF_STATEMENT no remember\n");
        $$ = newast(nt_PROOF_STATEMENT,NULL,stmt_since_no_remember,$1,$2,$2->lineNum); 
    }
    |SINCE_CLAUSE LTHEN MATH_EQUATION
    {
        printf("->PROOF_STATEMENT no remember\n");
        $$ = newast(nt_PROOF_STATEMENT,NULL,stmt_since_no_remember,$1,$3,$3->lineNum); 
    }    
 
;


MATH_EQUATION_LIST: MATH_EQUATION 
    {
        printf("->MATH_LIST\n");
        $$ = (newast(nt_MATH_LIST,NULL,math_list_two,$1,NULL,$1->lineNum));

    }
    |  MATH_EQUATION  MATH_EQUATION_LIST 
    {
        printf("->MATH_LIST\n");
        $$ = (newast(nt_MATH_LIST,NULL,math_list_n,$1,$2,$2->lineNum));

    } 
;

GIVEN_STATEMENT: LGIVEN MATH_EQUATION_LIST
    {
        printf("->GIVEN_STATEMENT\n");
        $$ = (newast(nt_GIVEN_STATEMENT,NULL,given_list,$2,NULL,$2->lineNum));
        
    }
;  

GOAL_STATEMENT: LGOAL MATH_EQUATION
    {
        printf("->GOAL_STATEMENT\n");
        $$ = (newast(nt_GOAL_STATEMENT,NULL,goal_math_equa,$2,NULL,$2->lineNum));
    }
;

ACTION_STATEMENT: LINTROS TLVAR
    {
        //引入变量
        printf("->ACTION_statement");
        $$ = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros,$1,$2,$2->lineNum)); 
    }
    | LINTROS LMATH1 TLVAR LMATH1  MATH_EQUATION_LIST
    {
        //引入满足一系列条件的变量
        printf("->ACTION_statement");
        $$ = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros_suppose_list_equation, $3,$5,$5->lineNum)); 
    }
    | LINTROS LMATH1 TLVAR LMATH1
    {
        //引入变量
        printf("->ACTION_statement");
        $$ = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros,$1,$3,$4->lineNum)); 
    }
    | LSUPPOSE MATH_EQUATION
    {
        printf("->ACTION_statement");
        $$ = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_suppose,$1,$2,$2->lineNum)); 
    }
    | LSET TLVAR TLeq LMATH1 EXPR LMATH1
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,$2,$5,$6->lineNum);
        $$ = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr1,$1,to_set,to_set->lineNum);
    }
    | LSET TLVAR TLeq LMATH2 EXPR LMATH2
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,$2,$5,$6->lineNum);
        $$ = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr2,$1,to_set,to_set->lineNum);
    };






MATH_EQUATION: LMATH1 EQUATION LMATH1
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_math1,$1,$2,$3->lineNum));
    }
    | LMATH2 EQUATION LMATH2
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_math2,$1,$2,$3->lineNum));
    }
    | LMATH2 CONTINUED_EQUATION LMATH2
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_continued2,$1,$2,$3->lineNum));
    }
    | LMATH1 CONTINUED_EQUATION LMATH1
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_continued2,$1,$2,$3->lineNum));
    }
    | LMATH1 INTERVAL LMATH1
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_interval1,$2,NULL,$3->lineNum));
    }
    | LMATH2 INTERVAL LMATH2
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_interval2,$2,NULL,$3->lineNum));
    }
    | FUNC_EQUATION
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_func,$1,NULL,$1->lineNum));
    }
    | LMATH1 TLforall CONTINUED_VAR LMATH1 MATH_EQUATION 
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,$3,$5,$5->lineNum));
    }
    | LMATH1 TLexists CONTINUED_VAR LMATH1 MATH_EQUATION 
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,$3,$5,$5->lineNum));
    }
    | LMATH2 TLforall CONTINUED_VAR LMATH2 MATH_EQUATION 
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,$3,$5,$5->lineNum));
    }
    | LMATH2 TLexists CONTINUED_VAR LMATH2 MATH_EQUATION 
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,$3,$5,$5->lineNum));
    }   

    | LMATH1 TLexists CONTINUED_VAR LMATH1 LSUPPOSE MATH_EQUATION 
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,$3,$6,$6->lineNum));
    }
    | TLexists LMATH1 EXPR LMATH1 MATH_EQUATION
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_exists_sets,$3,$5,$5->lineNum));
    }
    | TLexists LMATH1 EXPR LMATH1 LSUPPOSE MATH_EQUATION
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_exists_sets,$3,$5,$5->lineNum));
    }
    | TLforall LMATH1 EXPR LMATH1 MATH_EQUATION
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_forall_sets,$3,$5,$5->lineNum));
    }
    | TLforall LMATH1 EXPR LMATH1 LSUPPOSE MATH_EQUATION
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_forall_sets,$3,$5,$5->lineNum));
    }
    | FUNC_HEAD LIN LMATH1 EXPR LMATH1 LCONTINUE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_in_var_continue,$1,$4,$6->lineNum));  
    }
    | FUNC_HEAD LIN MATH_EQUATION LCONTINUE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_in_interval_continue,$1,$3,$4->lineNum));  
    }
    | FUNC_HEAD  LCONTINUE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_continue,$1,NULL,$2->lineNum));  
    }
    | FUNC_HEAD LIN LMATH1 EXPR LMATH1 LUCONTINUE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_in_var_ucontinue,$1,$4,$6->lineNum));  
    }
    | FUNC_HEAD LIN MATH_EQUATION LUCONTINUE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_in_interval_ucontinue,$1,$3,$4->lineNum));  
    }
    | FUNC_HEAD  LUCONTINUE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_ucontinue,$1,NULL,$2->lineNum));  
    }
    | LMATH1 EXPR LMATH1 LMONOINC
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_monoinc,$2,NULL,$4->lineNum));  
    }
    | LMATH1 EXPR LMATH1 LMONODEC
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_monodec,$2,NULL,$4->lineNum));  
    }
    | LMATH1 EXPR LMATH1 LIS LMATH1 EXPR LMATH1 LBOUND_ABOVE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_bound_above,$2,$6,$8->lineNum));  
    }
    | LMATH1 EXPR LMATH1 LIS LMATH1 EXPR LMATH1 LBOUND_BELOW
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_bound_below,$2,$6,$8->lineNum));  
    }
    | LIF MATH_EQUATION THEN MATH_EQUATION
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_impl,$2,$4,$4->lineNum));  
    }
    | LMATH1 EXPR LMATH1 HAVE LBOUND_ABOVE
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_have_bound_above,$2,NULL,$5->lineNum));  
    }
    | LMATH1 EXPR LMATH1 LHAVE LBOUND_BELOW
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_have_bound_below,$2,NULL,$5->lineNum));  
    }
    | TLVAR TLBELONG TLVAR 
    {
        printf("->MATH_EQUATION\n");
        $$ = (newast(nt_MATH_EQUATION,NULL,math_equation_n_belong_N,$1,$3,$3->lineNum));
    }
    

;

EQUATION: EXPR TEQ EXPR
    {
        printf("->EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,$1,$3,$3->lineNum);
        $$ = (newast(nt_EQUATION,NULL,equation_expr,$2,exprs,exprs->lineNum));
    }
;

FUNC_EQUATION: LMATH2 FUNC_HEAD DLeq EXPR LMATH2
{
        printf("->FUNC_EQUATION\n");
        
        $$ = (newast(nt_FUNC_EQUATION,NULL,equation_func,$2,$4,$5->lineNum));
}
    |LMATH1 FUNC_HEAD DLeq EXPR LMATH1
{
        printf("->FUNC_EQUATION\n");
        
        $$ = (newast(nt_FUNC_EQUATION,NULL,equation_func,$2,$4,$5->lineNum));
}
    | LMATH2 TLVAR DLeq FUNC_HEAD  LMATH2
{
        printf("->FUNC_EQUATION\n");
        
        $$ = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,$2,$4,$5->lineNum));
}
    | LMATH1 TLVAR DLeq FUNC_HEAD  LMATH1
{
        printf("->FUNC_EQUATION\n");
        
        $$ = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,$2,$4,$5->lineNum));
}

;

TEQ: TLeq
{
    printf("->TEQ");
    $$ = (newast(nt_TEQ,NULL,Teq_teq,$1,NULL,$1->lineNum));
}
|TLleq
{
    printf("->TEQ");
    $$ = (newast(nt_TEQ,NULL,Teq_tleq,$1,NULL,$1->lineNum));
}
|TLgeq
{
    printf("->TEQ");
    $$ = (newast(nt_TEQ,NULL,Teq_tgeq,$1,NULL,$1->lineNum));
}
|TLneq
{
    printf("->TEQ");
    $$ = (newast(nt_TEQ,NULL,Teq_tneq,$1,NULL,$1->lineNum));
}
|TLequiv
{
    printf("->TEQ");
    $$ = (newast(nt_TEQ,NULL,Teq_tequiv,$1,NULL,$1->lineNum));
}
|TLlt
{
    printf("->TEQ");
    $$ = (newast(nt_TEQ,NULL,Teq_tlt,$1,NULL,$1->lineNum));
}
|TLgt
{
    printf("->TEQ");
    $$ = (newast(nt_TEQ,NULL,Teq_tgt,$1,NULL,$1->lineNum));
}
;

CONTINUED_EQUATION: EXPR TEQ EQUATION
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,$1,$3,$3->lineNum);
        $$ = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_equation,$2,exprs,exprs->lineNum));
    }
    | EXPR TEQ CONTINUED_EQUATION
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,$1,$3,$3->lineNum);
        $$ = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_continued_equation,$2,exprs,exprs->lineNum));
    }
;

CONTINUED_VAR: TLVAR
    {
        printf("->CONTINUED_VAR\n");
        $$ = (newast(nt_CONTINUED_VAR,NULL,0,$1,NULL,$1->lineNum));
    }
    | TLVAR CONTINUED_VAR
    {
        printf("->CONTINUED_VAR\n");
        $$ = (newast(nt_CONTINUED_VAR,NULL,0,$1,$2,$2->lineNum));
    }
;

LIM_HEAD: TLlim LLB3L TLVAR TLto TLinfty LLB3R
   {
    printf("->LIM_HEAD\n");
    $$ = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_infty,$3,NULL,$6->lineNum));
   }
   | TLlim LLB3L TLVAR TLto TLNinfty LLB3R
   {
    printf("->LIM_HEAD\n");
    $$ = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Ninfty,$3,NULL,$6->lineNum));
   }
   | TLlim LLB3L TLVAR TLto TLPinfty LLB3R
   {
    printf("->LIM_HEAD\n");
    $$ = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Pinfty,$3,NULL,$6->lineNum));
   }
   | TLlim LLB3L TLVAR TLto EXPR LLB3R
   {
    printf("->LIM_HEAD\n");
    $$ = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_expr,$3,$5,$6->lineNum));
   }
;

FUNC_HEAD: TLVAR LLB1L TLVAR LLB1R
   {  
        printf("->FUNC_HEAD\n");
    $$ = (newast(nt_FUNC_HEAD,NULL,func_head_binding,$1,$3,$4->lineNum));
   }
;

INTERVAL: LLB1L EXPR LCOMMA EXPR LLB1R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_lopen_ropen,$2,$4,$5->lineNum));
   }
|LLB2L EXPR LCOMMA EXPR LLB1R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_lclosed_ropen,$2,$4,$5->lineNum));
   }
|LLB1L EXPR LCOMMA EXPR LLB2R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_lopen_rclosed,$2,$4,$5->lineNum));
   }
|LLB2L EXPR LCOMMA EXPR LLB2R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_lclosed_rclosed,$2,$4,$5->lineNum));
   }
|LLB1L EXPR LCOMMA TLPinfty LLB1R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_lopen_rinfty,$2,$4,$5->lineNum));
   }
|LLB2L EXPR LCOMMA TLPinfty LLB1R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_lclosed_rinfty,$2,$4,$5->lineNum));
   }
|LLB1L TLNinfty LCOMMA EXPR LLB1R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_linfty_ropen,$2,$4,$5->lineNum));
   }
|LLB1L TLNinfty LCOMMA EXPR LLB2R
{
    printf("->INTERVAL\n");
    $$ = (newast(nt_INTERVAL,NULL,Interval_linfty_rclosed,$2,$4,$5->lineNum));
   }
;



EXPR: TLVAR
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tvar,$1,NULL,$1->lineNum));
    }
    | TLCONST
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tconst,$1,NULL,$1->lineNum));
    }
    | TLNUM 
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tnum,$1,NULL,$1->lineNum));
    }
    | LLB1L Tminus EXPR LLB1R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_1L_minus_1R,$3,NULL,$4->lineNum));
    }
    | LABS EXPR LABS
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_abs,$2,NULL,$3->lineNum));
    }
    | EXPR Tadd EXPR
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tadd,$1,$3,$3->lineNum));
    }
    | EXPR Tminus EXPR
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tminus,$1,$3,$3->lineNum));
    }
    | EXPR Tdiv EXPR
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tdiv,$1,$3,$3->lineNum));
    }
    | EXPR Ttimes EXPR
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_ttimes,$1,$3,$3->lineNum));
    }
    | TLsqrt LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tsqrt_2,$3,NULL,$4->lineNum));
    }
    | TLsqrt LLB2L EXPR LLB2R LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tsqrt_n,$6,$3,$7->lineNum));
    }
    | TLln LLB3L EXPR LLB3R 
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tln,$3,NULL,$4->lineNum));
    }
    | TLsin LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tsin,$3,NULL,$4->lineNum));
    }
    | TLcos LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tcos,$3,NULL,$4->lineNum));
    }
    | TLsup LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tsup,$3,NULL,$4->lineNum));
    }
    | LLB3L EXPR LLB3R LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_3L_3R_3L_3R,$2,$5,$6->lineNum));
    }
    | LLB1L EXPR LLB1R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_1L_1R,$2,NULL,$3->lineNum));
    }
    | LLB1L EXPR LLB1R TLderi 
    {
        printf("->EXPR_deri\n");
        $$ = (newast(nt_EXPR,NULL,Expr_derivative,$2,$4,$4->lineNum));
    }
    | TLVAR TLderi LLB1L TLVAR LLB1R 
    {
        printf("->EXPR_deri_f\n");
        $$ = (newast(nt_EXPR,NULL,Expr_derivative_f,$1,$4,$5->lineNum));
    }
    | TLfrac LLB3L EXPR LLB3R LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tfrac_3L_3R_3L_3R,$3,$6,$7->lineNum));
    }
    | LIM_HEAD  LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_lim_head,$1,$3,$4->lineNum));
    
    }
    | LLCEIL LLB3L EXPR LLB3R LRCEIL
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_Lceil_3L_3R_Rceil,$3,NULL,$5->lineNum));
    }
    | LLFLOOR LLB3L EXPR LLB3R LRFLOOR
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_Lfloor_3L_3R_Rfloor,$3,NULL,$5->lineNum));
    }
    | EXPR Tpower LLB3L EXPR LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tpower,$1,$4,$5->lineNum));
    }
    | LMIN LLB1L EXPR LCOMMA EXPR LLB1R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_tmin,$3,$5,$6->lineNum));
    }
    | FUNC_HEAD
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_func,$1,NULL,$1->lineNum));
    }
    | LLB3L  TLVAR  LCOMMA MATH_EQUATION LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_seq_sets,$2,$4,$5->lineNum));
    }     
    | LLB3L  TLVAR  LABS MATH_EQUATION LLB3R
    {
        printf("->EXPR\n");
        $$ = (newast(nt_EXPR,NULL,Expr_seq_sets,$2,$4,$5->lineNum));
    } 
    


;

KNOWLEDGE: LKASaverage
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_KASaverage,$1,NULL,$1->lineNum)); 
    }
    | LKSGaverage
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_KSGaverage,$1,NULL,$1->lineNum)); 
    }
    | LKAGaverage
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_KAGaverage,$1,NULL,$1->lineNum)); 
    }
    | LMATH1 KNOWLEDGE LMATH1
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math1,$2,NULL,$3->lineNum)); 
    }   
    | LMATH2 KNOWLEDGE LMATH2
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math2,$2,NULL,$3->lineNum)); 
    }
    | LFSqueeze
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_FSqueeze,$1,NULL,$1->lineNum)); 
    }
    | LSUPRE_DEF
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_Supre_def,$1,NULL,$1->lineNum)); 
    }
    | LSUPRE_THEOREM
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_Supre_the,$1,NULL,$1->lineNum)); 
    }
    | LLIM_DEF
    {
        printf("->knowledge\n");
        $$ = (newast(nt_KNOWLEDGE,NULL,Knowledge_Lim_def,$1,NULL,$1->lineNum)); 
    }
;

SINCE_CLAUSE: LSINCE KNOWLEDGE
    {
        printf("->SINCE\n");
        $$ = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_knowledge,$2,NULL,$2->lineNum)); 
    }
    | LSINCE MATH_EQUATION
    {
        printf("->SINCE\n");
        $$ = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_math_equation,$2,NULL,$2->lineNum)); 
    }
    
    | LSINCE LLB2L TLNUM LLB2R
    {
        printf("->SINCE\n");
        $$ = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_tnum,$3,NULL,$4->lineNum)); 
    }

    | LSAME
    {
        printf("->SINCE\n");
        $$ = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_same,$1,NULL,$1->lineNum)); 
    }
    | LAUTO_NOHINT
    {
        printf("->since\n");
        $$ = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_auto_nohint,$1,NULL,$1->lineNum));
    }
    | LSINCE TLVAR LTRANS
    {
        printf("->SINCE\n");
        $$ = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_trans,$2,NULL,$3->lineNum));
    }
    | LBOTH LDERI
    {
        printf("->STATEMENT Both deri\n");
        $$ = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri,$1,$2,$2->lineNum); 
    }
    | LBOTH LFOR TLVAR LDERI
    {
        printf("->STATEMENT Both deri\n");
        $$ = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri_var,$3,NULL,$4->lineNum); 
    }
    | LBECAUSE MATH_EQUATION
    {
        printf("->STATEMENT Because\n");
        $$ = newast(nt_SINCE_CLAUSE,NULL,Since_clause_because,$2,NULL,$2->lineNum); 
    }
    
;

ACTION: EQS LEQUNADD
    {
        //等式们相加
        printf("->ACTION");
        $$ = (newast(nt_ACTION,NULL,Action_eqs_equnadd,$2,$1,$2->lineNum)); 
    }
    | LAUTO_CONC
    {
        //“综上”
        printf("->ACTION");
        $$ = newast(nt_ACTION,NULL,Action_auto_conc,$1,NULL,$1->lineNum);
    }
    
;

MEMORY_TERM: LLB2L TLNUM LLB2R
    {
        printf("->Memory Term");
        $$ = (newast(nt_MEMORY_TERM,NULL,Memory_term_tnum,$2,$3,$3->lineNum));
    }
;

EQS: MEMORY_TERM
    {
        printf("->Equation list");
        $$ = (newast(nt_EQS,NULL,Eqs_memory_term,$1,NULL,$1->lineNum));
    }
    | MEMORY_TERM EQS
    {
        //at least two.
        printf("->Equation list");
        $$ = (newast(nt_EQS,NULL,Eqs_memory_term_eqs,$1,$2,$2->lineNum));
    }
;

TLCONST: TCONST
    {
        //printf("->TLCONST");
        $$ = (newast(ntl_TCONST,NULL,Without_line,$1,NULL,NULL));
    }
    | TCONST TLINE
    {
        printf("->Line CONST");
        $$ = (newast(ntl_TCONST,NULL,Has_line,$1,$2,$2));
    }
;

TLVAR: TVAR
    {
        //printf("->TLVAR");
        $$ = (newast(ntl_TVAR,NULL,Without_line,$1,NULL,NULL));
    }
    |  TVAR TLINE
    {
        printf("->Line VAR");
        $$ = (newast(ntl_TVAR,NULL,Has_line,$1,$2,$2));
    }
;

TLNUM: TNUM
    {
        //printf("->TLNUM");
        $$ = (newast(ntl_TNUM,NULL,Without_line,$1,NULL,NULL));
    }
    |  TNUM TLINE
    {
        printf("->Line NUM");
        $$ = (newast(ntl_TNUM,NULL,Has_line,$1,$2,$2));
    }
;



TLsqrt: Tsqrt
    {
        //printf("->Tsqrt");
        $$ = (newast(ntl_Tsqrt,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tsqrt TLINE
    {
        printf("->Line sqrt");
        $$ = (newast(ntl_Tsqrt,NULL,Has_line,$1,$2,$2));
    }
;

TLln: Tln
    {
        //printf("->Tln");
        $$ = (newast(ntl_Tln,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tln TLINE
    {
        printf("->Line ln");
        $$ = (newast(ntl_Tln,NULL,Has_line,$1,$2,$2));
    }
;

TLderi: Tderi
    {
        //printf("->Tderi");
        $$ = (newast(ntl_Tderi,NULL,Without_line,$1,NULL,NULL));
    }
    | Tderi TLINE
    {
        printf("->Line ln");
        $$ = (newast(ntl_Tderi,NULL,Has_line,$1,$2,$2));
    }
;

TLfrac: Tfrac
    {
        //printf("->Tfrac");
        $$ = (newast(ntl_Tfrac,NULL,Without_line,$1,NULL,NULL));
    }
    | Tfrac TLINE
    {
        printf("->Line frac");
        $$ = (newast(ntl_Tfrac,NULL,Has_line,$1,$2,$2));
    }
;

TLeq: Teq
    {
        //printf("->Teq");
        $$ = (newast(ntl_Teq,NULL,Without_line,$1,NULL,NULL));
    }
    |  Teq TLINE
    {
        printf("->Line eq");
        $$ = (newast(ntl_Teq,NULL,Has_line,$1,$2,$2));
    }
;

DLeq: Deq
    {
        //printf("->Deq");
        $$ = (newast(ntl_Deq,NULL,Without_line,$1,NULL,NULL));
    }
    |  Deq TLINE
    {
        printf("->Line deq");
        $$ = (newast(ntl_Deq,NULL,Has_line,$1,$2,$2));
    }
;

TLleq: Tleq
    {
        //printf("->Tleq");
        $$ = (newast(ntl_Tleq,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tleq TLINE
    {
        printf("->Line leq");
        $$ = (newast(ntl_Tleq,NULL,Has_line,$1,$2,$2));
    }
;

TLgeq: Tgeq
    {
        //printf("->Tgeq");
        $$ = (newast(ntl_Tgeq,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tgeq TLINE
    {
        printf("->Line geq");
        $$ = (newast(ntl_Tgeq,NULL,Has_line,$1,$2,$2));
    }
;

TLlt: Tlt
    {
        //printf("->Tlt");
        $$ = (newast(ntl_Tlt,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tlt TLINE
    {
        printf("->Line lt");
        $$ = (newast(ntl_Tlt,NULL,Has_line,$1,$2,$2));
    }
;

TLgt: Tgt
    {
        //printf("->Tgt");
        $$ = (newast(ntl_Tgt,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tgt TLINE
    {
        printf("->Line gt");
        $$ = (newast(ntl_Tgt,NULL,Has_line,$1,$2,$2));
    }
;

TLneq: Tneq
    {
        //printf("->Tneq");
        $$ = (newast(ntl_Tneq,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tneq TLINE
    {
        printf("->Line neq");
        $$ = (newast(ntl_Tneq,NULL,Has_line,$1,$2,$2));
    }
;

TLequiv: Tequiv
    {
        //printf("->Tequiv");
        $$ = (newast(ntl_Tequiv,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tequiv TLINE
    {
        printf("->Line equiv");
        $$ = (newast(ntl_Tequiv,NULL,Has_line,$1,$2,$2));
    }
;

TLlim: Tlim
    {
        //printf("->Tlim");
        $$ = (newast(ntl_Tlim,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tlim TLINE
    {
        printf("->Line lim");
        $$ = (newast(ntl_Tlim,NULL,Has_line,$1,$2,$2));
    }
;

TLto: Tto
    {
        //printf("->Tto");
        $$ = (newast(ntl_Tto,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tto TLINE
     {
        printf("->Line to");
        $$ = (newast(ntl_Tto,NULL,Has_line,$1,$2,$2));
    }
;

TLinfty: Tinfty
    {
        //printf("->Tinfty");
        $$ = (newast(ntl_Tinfty,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tinfty TLINE
    {
        printf("->Line infty");
        $$ = (newast(ntl_Tinfty,NULL,Has_line,$1,$2,$2));
    }
;

TLPinfty: TPinfty
    {
        //printf("->TPinfty");
        $$ = (newast(ntl_TPinfty,NULL,Without_line,$1,NULL,NULL));
    }
    |  TPinfty TLINE
    {
        printf("->Line Pinfty");
        $$ = (newast(ntl_TPinfty,NULL,Has_line,$1,$2,$2));
    }
;

TLNinfty: TNinfty
    {
        //printf("->TNinfty");
        $$ = (newast(ntl_TNinfty,NULL,Without_line,$1,NULL,NULL));
    }
    | TNinfty TLINE
    {
        printf("->Line Ninfty");
        $$ = (newast(ntl_TNinfty,NULL,Has_line,$1,$2,$2));
    }
;

LGOAL: GOAL
    {
        //printf("->GOAL");
        $$ = (newast(ntl_goal,NULL,Without_line,$1,NULL,NULL));
    }
    | GOAL TLINE
    {
        printf("->Line GOAL");
        $$ = (newast(ntl_goal,NULL,Has_line,$1,$2,$2));
    }
   
;

LMATH1: MATH1
    {
        //printf("->MATH1");
        $$ = (newast(ntl_math1,NULL,Without_line,$1,NULL,NULL));
    }
    | MATH1 TLINE
    {
        printf("->Line MATH1");
        $$ = (newast(ntl_math1,NULL,Has_line,$1,$2,$2));
    }
;

LMATH2: MATH2
    {
        //printf("->MATH2");
        $$ = (newast(ntl_math2,NULL,Without_line,$1,NULL,NULL));
    }
    | MATH2 TLINE
    {
        printf("->Line MATH2");
        $$ = (newast(ntl_math2,NULL,Has_line,$1,$2,$2));
    }
;

LPROOF: PROOF
    {
        //printf("->PROOF");
        $$ = (newast(ntl_proof,NULL,Without_line,$1,NULL,NULL));
    }
    |  PROOF TLINE
    {
        printf("->Line PROOF");
        $$ = (newast(ntl_proof,NULL,Has_line,$1,$2,$2));
    }
;

LQED: QED 
    {
        //printf("->QED");
        $$ = (newast(ntl_qed,NULL,Without_line,$1,NULL,NULL));
    }
    |  QED TLINE
    {
        printf("->Line QED");
        $$ = (newast(ntl_qed,NULL,Has_line,$1,$2,$2));
    }
;



LGIVEN: GIVEN
    {
        //printf("->GIVEN");
        $$ = (newast(ntl_given,NULL,Without_line,$1,NULL,NULL));
    }
    |  GIVEN TLINE
    {
        printf("->Line GIVEN");
        $$ = (newast(ntl_given,NULL,Has_line,$1,$2,$2));
    }
    
;

LSINCE: SINCE
    {
        //printf("->SINCE");
        $$ = (newast(ntl_since,NULL,Without_line,$1,NULL,NULL));
    }
    |  SINCE TLINE
    {
        printf("->Line SINCE");
        $$ = (newast(ntl_since,NULL,Has_line,$1,$2,$2));
    }
;

LTRANS: TRANS
    {
        //printf("->TRANS");
        $$ = (newast(ntl_trans,NULL,Without_line,$1,NULL,NULL));
    }
    |  TRANS TLINE
    {
        printf("->Line TRANS");
        $$ = (newast(ntl_trans,NULL,Has_line,$1,$2,$2));
    }
;

LUSE: USE
    {
        //printf("->USE");
        $$ = (newast(ntl_use,NULL,Without_line,$1,NULL,NULL));
    }
    |  USE TLINE
    {
        printf("->Line USE");
        $$ = (newast(ntl_use,NULL,Has_line,$1,$2,$2));
    }
;

LKASaverage: KASaverage
    {
        //printf("->KASaverage");
        $$ = (newast(ntl_KASaverage,NULL,Without_line,$1,NULL,NULL));
    }
    |  KASaverage TLINE
    {
        printf("->Line KASaverage");
        $$ = (newast(ntl_KASaverage,NULL,Has_line,$1,$2,$2));
    }
;

LKSGaverage: KSGaverage
    {
        //printf("->KSGaverage");
        $$ = (newast(ntl_KSGaverage,NULL,Without_line,$1,NULL,NULL));
    }
    |  KSGaverage TLINE
    {
        printf("->Line KSGaverage");
        $$ = (newast(ntl_KSGaverage,NULL,Has_line,$1,$2,$2));
    }
;

LKAGaverage: KAGaverage
    {
        //printf("->KAGaverage");
        $$ = (newast(ntl_KAGaverage,NULL,Without_line,$1,NULL,NULL));
    }
    |  KAGaverage TLINE
    {
        printf("->Line KAGaverage");
        $$ = (newast(ntl_KAGaverage,NULL,Has_line,$1,$2,$2));
    }
;

LREMEMBER: REMEMBER
    {
        //printf("->REMEMBER");
        $$ = (newast(ntl_remember,NULL,Without_line,$1,NULL,NULL));
    }
    |  REMEMBER TLINE
    {
        printf("->Line REMEMBER");
        $$ = (newast(ntl_remember,NULL,Has_line,$1,$2,$2));
    }
;

LEQUNADD: EQUNADD
    {
        //printf("->EQUNADD");
        $$ = (newast(ntl_equnadd,NULL,Without_line,$1,NULL,NULL));
    }
    |  EQUNADD TLINE
    {
        printf("->Line EQUNADD");
        $$ = (newast(ntl_equnadd,NULL,Has_line,$1,$2,$2));
    }
;

LCONCLUDE: CONCLUDE
    {
        //printf("->CONCLUDE");
        $$ = (newast(ntl_conclude,NULL,Without_line,$1,NULL,NULL));
    }
    |  CONCLUDE TLINE
    {
        printf("->Line EQUNADD");
        $$ = (newast(ntl_conclude,NULL,Has_line,$1,$2,$2));
    }
;

LTHEN: THEN
    {
        //printf("->THEN");
        $$ = (newast(ntl_then,NULL,Without_line,$1,NULL,NULL));
    }
    |  THEN TLINE
    {
        printf("->Line THEN");
        $$ = (newast(ntl_then,NULL,Has_line,$1,$2,$2));
    }
;

LSAME: SAME
    {
        //printf("->SAME");
        $$ = (newast(ntl_same,NULL,Without_line,$1,NULL,NULL));
    }
    |  SAME TLINE
    {
        printf("->Line SAME");
        $$ = (newast(ntl_same,NULL,Has_line,$1,$2,$2));
    }
;

LLB1L: LB1L
    {
        //printf("->LB1L");
        $$ = (newast(ntl_LB1L,NULL,Without_line,$1,NULL,NULL));
    }
    |  LB1L TLINE
    {
        printf("->Line LB1L");
        $$ = (newast(ntl_LB1L,NULL,Has_line,$1,$2,$2));
    }
;

LLB1R: LB1R
    {
        //printf("->LB1R");
        $$ = (newast(ntl_LB1R,NULL,Without_line,$1,NULL,NULL));
    }
    |  LB1R TLINE
    {
        printf("->Line LB1R");
        $$ = (newast(ntl_LB1R,NULL,Has_line,$1,$2,$2));
    }
;

LLB2L: LB2L
    {
        //printf("->LB2L");
        $$ = (newast(ntl_LB2L,NULL,Without_line,$1,NULL,NULL));
    }
    |  LB2L TLINE
    {
        printf("->Line LB2L");
        $$ = (newast(ntl_LB2L,NULL,Has_line,$1,$2,$2));
    }
;

LLB2R: LB2R
    {
        //printf("->LB2R");
        $$ = (newast(ntl_LB2R,NULL,Without_line,$1,NULL,NULL));
    }
    |  LB2R TLINE
    {
        printf("->Line LB2R");
        $$ = (newast(ntl_LB2R,NULL,Has_line,$1,$2,$2));
    }
;

LLB3L: LB3L
    {
        //printf("->LB3L");
        $$ = (newast(ntl_LB3L,NULL,Without_line,$1,NULL,NULL));
    }
    |  LB3L TLINE
    {
        printf("->Line LB3L");
        $$ = (newast(ntl_LB3L,NULL,Has_line,$1,$2,$2));
    }
;

LLB3R: LB3R
    {
        //printf("->LB3R");
        $$ = (newast(ntl_LB3R,NULL,Without_line,$1,NULL,NULL));
    }
    |  LB3R TLINE
    {
        printf("->Line LB3R");
        $$ = (newast(ntl_LB3R,NULL,Has_line,$1,$2,$2));
    }
;

LABS: ABS
    {
        //printf("->ABS");
        $$ = (newast(ntl_abs,NULL,Without_line,$1,NULL,NULL));
    }
    |  ABS TLINE
    {
        printf("->Line ABS");
        $$ = (newast(ntl_abs,NULL,Has_line,$1,$2,$2));
    }
;

LMIN: MIN
    {
        //printf("->MIN");
        $$ = (newast(ntl_min,NULL,Without_line,$1,NULL,NULL));
    }
    |  MIN TLINE
    {
        printf("->Line MIN");
        $$ = (newast(ntl_min,NULL,Has_line,$1,$2,$2));
    }
;

LLCEIL: LCEIL
    {
        //printf("->LCEIL");
        $$ = (newast(ntl_LCEIL,NULL,Without_line,$1,NULL,NULL));
    }
    |  LCEIL TLINE
    {
        printf("->Line LCEIL");
        $$ = (newast(ntl_LCEIL,NULL,Has_line,$1,$2,$2));
    }
;

LRCEIL: RCEIL
    {
        //printf("->RCEIL");
        $$ = (newast(ntl_RCEIL,NULL,Without_line,$1,NULL,NULL));
    }
    |  RCEIL TLINE
    {
        printf("->Line RCEIL");
        $$ = (newast(ntl_RCEIL,NULL,Has_line,$1,$2,$2));
    }
;

LLFLOOR: LFLOOR
    {
        //printf("->LFLOOR");
        $$ = (newast(ntl_LFLOOR,NULL,Without_line,$1,NULL,NULL));
    }
    |  LFLOOR  TLINE
    {
        printf("->Line LFLOOR");
        $$ = (newast(ntl_LFLOOR,NULL,Has_line,$1,$2,$2));
    }
;

LRFLOOR: RFLOOR
    {
        //printf("->RFLOOR");
        $$ = (newast(ntl_RFLOOR,NULL,Without_line,$1,NULL,NULL));
    }
    |  RFLOOR TLINE
    {
        printf("->Line RFLOOR");
        $$ = (newast(ntl_RFLOOR,NULL,Has_line,$1,$2,$2));
    }
;

LLIM_DEF: LIM_DEF
    {
        //printf("->LIM_DEF");
        $$ = (newast(ntl_LIM_DEF,NULL,Without_line,$1,NULL,NULL));
    }
    |  LIM_DEF TLINE
    {
        printf("->Line LIM_DEF");
        $$ = (newast(ntl_LIM_DEF,NULL,Has_line,$1,$2,$2));
    }
;

LTO_PROVE: TO_PROVE
    {
        //printf("->TO_PROVE");
        $$ = (newast(ntl_TO_PROVE,NULL,Without_line,$1,NULL,NULL));
    }
    |  TO_PROVE TLINE
    {
        printf("->Line TO_PROVE");
        $$ = (newast(ntl_TO_PROVE,NULL,Has_line,$1,$2,$2));
    }
;

TLsin: Tsin
    {
        //printf("->Tsin");
        $$ = (newast(ntl_sin,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tsin TLINE
    {
        printf("->Line Tsin");
        $$ = (newast(ntl_sin,NULL,Has_line,$1,$2,$2));
    }
;

TLcos: Tcos
    {
        //printf("->Tcos");
        $$ = (newast(ntl_cos,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tcos TLINE
    {
        printf("->Line Tcos");
        $$ = (newast(ntl_cos,NULL,Has_line,$1,$2,$2));
    }
;

TLsup: Tsup
    {
        //printf("->Tsup");
        $$ = (newast(ntl_sup,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tsup TLINE
    {
        printf("->Line Tsup");
        $$ = (newast(ntl_sup,NULL,Has_line,$1,$2,$2));
    }
;

LCONTINUE_DEF: CONTINUE_DEF
    {
        //printf("->CONTINUE_DEF");
        $$ = (newast(ntl_CONTINUE_DEF,NULL,Without_line,$1,NULL,NULL));
    }
    | CONTINUE_DEF TLINE
    {
        printf("->Line CONTINUE_DEF");
        $$ = (newast(ntl_CONTINUE_DEF,NULL,Has_line,$1,$2,$2));
    }
;

LUC_DEF: UC_DEF
    {
        //printf("->UC_DEF");
        $$ = (newast(ntl_UC_DEF,NULL,Without_line,$1,NULL,NULL));
    }
    |  UC_DEF TLINE
    {
        printf("->Line UC_DEF");
        $$ = (newast(ntl_UC_DEF,NULL,Has_line,$1,$2,$2));
    }
;

LSUPRE_THEOREM: SUPRE_THEOREM
{
        //printf("->SUPRE_THEOREM");
        $$ = (newast(ntl_SUPRE_THEOREM,NULL,Without_line,$1,NULL,NULL));
    }
    |  SUPRE_THEOREM TLINE
    {
        printf("->Line SUPRE_THEOREM");
        $$ = (newast(ntl_SUPRE_THEOREM,NULL,Has_line,$1,$2,$2));
    }
;

LSUPRE_DEF: SUPRE_DEF
{
        //printf("->SUPRE_DEF");
        $$ = (newast(ntl_SUPRE_DEF,NULL,Without_line,$1,NULL,NULL));
    }
    |  SUPRE_DEF TLINE
    {
        printf("->Line SUPRE_DEF");
        $$ = (newast(ntl_SUPRE_DEF,NULL,Has_line,$1,$2,$2));
    }
;

LBOUND_BELOW: BOUND_BELOW
{
        //printf("->BOUND_BELOW");
        $$ = (newast(ntl_BOUND_BELOW,NULL,Without_line,$1,NULL,NULL));
    }
    |  BOUND_BELOW TLINE
    {
        printf("->Line BOUND_BELOW");
        $$ = (newast(ntl_BOUND_BELOW,NULL,Has_line,$1,$2,$2));
    }
;

LBOUND_ABOVE: BOUND_ABOVE
{
        //printf("->BOUND_ABOVE");
        $$ = (newast(ntl_BOUND_ABOVE,NULL,Without_line,$1,NULL,NULL));
    }
    |  BOUND_ABOVE TLINE
    {
        printf("->Line BOUND_ABOVE");
        $$ = (newast(ntl_BOUND_ABOVE,NULL,Has_line,$1,$2,$2));
    }
;

LFSqueeze : FSqueeze
    {
        //printf("->FSqueeze");
        $$ = (newast(ntl_FSqueeze,NULL,Without_line,$1,NULL,NULL));
    }
    |  FSqueeze TLINE
    {
        printf("->Line FSqueeze");
        $$ = (newast(ntl_FSqueeze,NULL,Has_line,$1,$2,$2));
    }
;
LINTROS: INTROS
    {
        //printf("->INTROS");
        $$ = (newast(ntl_INTROS,NULL,Without_line,$1,NULL,NULL));
    }
    |  INTROS TLINE
    {
        printf("->Line INTROS");
        $$ = (newast(ntl_INTROS,NULL,Has_line,$1,$2,$2));
    }
;


LSET: SET
    {
        //printf("->SET");
        $$ = (newast(ntl_SET,NULL,Without_line,$1,NULL,NULL));
    }
    |  SET TLINE
    {
        printf("->Line SET");
        $$ = (newast(ntl_SET,NULL,Has_line,$1,$2,$2));
    }
;

LFOR: FOR
    {
        //printf("->FOR");
        $$ = (newast(ntl_FOR,NULL,Without_line,$1,NULL,NULL));
    }
    |  FOR TLINE
    {
        printf("->Line FOR");
        $$ = (newast(ntl_FOR,NULL,Has_line,$1,$2,$2));
    }
;

LDERI: DERI
    {
        //printf("->DERI");
        $$ = (newast(ntl_DERI,NULL,Without_line,$1,NULL,NULL));
    }
    |  DERI TLINE
    {
        printf("->Line DERI");
        $$ = (newast(ntl_DERI,NULL,Has_line,$1,$2,$2));
    }
;

LBOTH: BOTH
    {
        //printf("->BOTH");
        $$ = (newast(ntl_BOTH,NULL,Without_line,$1,NULL,NULL));
    }
    |  BOTH TLINE
    {
        printf("->Line BOTH");
        $$ = (newast(ntl_BOTH,NULL,Has_line,$1,$2,$2));
    }
;

LCOMMA: COMMA
    {
        //printf("->COMMA");
        $$ = (newast(ntl_COMMA,NULL,Without_line,$1,NULL,NULL));
    }
    |  COMMA TLINE
    {
        printf("->Line COMMA");
        $$ = (newast(ntl_COMMA,NULL,Has_line,$1,$2,$2));
    }
;

TLforall: Tforall
    {
        //printf("->Tforall");
        $$ = (newast(ntl_Tforall,NULL,Without_line,$1,NULL,NULL));
    }
    |  Tforall TLINE
    {
        printf("->Line Tforall");
        $$ = (newast(ntl_Tforall,NULL,Has_line,$1,$2,$2));
    }
;

TLexists: Texists
    {
        //printf("->Texists");
        $$ = (newast(ntl_Texists,NULL,Without_line,$1,NULL,NULL));
    }
    |  Texists TLINE
    {
        printf("->Line Texists");
        $$ = (newast(ntl_Texists,NULL,Has_line,$1,$2,$2));
    }
;

LSUPPOSE: SUPPOSE
    {
        //printf("->SUPPOSE");
        $$ = (newast(ntl_SUPPOSE,NULL,Without_line,$1,NULL,NULL));
    }
    | SUPPOSE TLINE
    {
        printf("->Line SUPPOSE");
        $$ = (newast(ntl_SUPPOSE,NULL,Has_line,$1,$2,$2));
    }
;

LIN: IN
    {
        //printf("->IN");
        $$ = (newast(ntl_IN,NULL,Without_line,$1,NULL,NULL));
    }
    |  IN TLINE
    {
        printf("->Line IN");
        $$ = (newast(ntl_IN,NULL,Has_line,$1,$2,$2));
    }
;

LIS: IS
    {
        //printf("->IS");
        $$ = (newast(ntl_IS,NULL,Without_line,$1,NULL,NULL));
    }
    |  IS TLINE
    {
        printf("->Line IS");
        $$ = (newast(ntl_IS,NULL,Has_line,$1,$2,$2));
    }
;

LIF: IF
    {
        //printf("->IF");
        $$ = (newast(ntl_IF,NULL,Without_line,$1,NULL,NULL));
    }
    |  IF TLINE
    {
        printf("->Line IF");
        $$ = (newast(ntl_IF,NULL,Has_line,$1,$2,$2));
    }
;

LHAVE: HAVE
    {
        //printf("->HAVE");
        $$ = (newast(ntl_HAVE,NULL,Without_line,$1,NULL,NULL));
    }
    |  HAVE TLINE
    {
        printf("->Line HAVE");
        $$ = (newast(ntl_HAVE,NULL,Has_line,$1,$2,$2));
    }
;

LCONTINUE: CONTINUE
    {
        //printf("->CONTINUE");
        $$ = (newast(ntl_CONTINUE,NULL,Without_line,$1,NULL,NULL));
    }
    | CONTINUE TLINE
    {
        printf("->Line CONTINUE");
        $$ = (newast(ntl_CONTINUE,NULL,Has_line,$1,$2,$2));
    }
;

LUCONTINUE: UCONTINUE
    {
        //printf("->UCONTINUE");
        $$ = (newast(ntl_UCONTINUE,NULL,Without_line,$1,NULL,NULL));
    }
    | UCONTINUE TLINE
    {
        printf("->Line UCONTINUE");
        $$ = (newast(ntl_UCONTINUE,NULL,Has_line,$1,$2,$2));
    }
;
LAUTO_CONC: AUTO_CONC
    {
        //printf("->AUTO_CONC");
        $$ = (newast(ntl_AUTO_CONC,NULL,Without_line,$1,NULL,NULL));
    }
    | AUTO_CONC TLINE
    {
        printf("->Line AUTO_CONC");
        $$ = (newast(ntl_AUTO_CONC,NULL,Has_line,$1,$2,$2));
    }
;

LAUTO_NOHINT: AUTO_NOHINT
    {
        //printf("->AUTO_NOHINT");
        $$ = (newast(ntl_AUTO_NOHINT,NULL,Without_line,$1,NULL,NULL));
    }
    | AUTO_NOHINT TLINE
    {
        printf("->Line AUTO_NOHINT");
        $$ = (newast(ntl_AUTO_NOHINT,NULL,Has_line,$1,$2,$2));
    }

LBECAUSE: BECAUSE
    {
        //printf("->BECAUSE");
        $$ = (newast(ntl_BECAUSE,NULL,Without_line,$1,NULL,NULL));
    }
    | BECAUSE TLINE
    {
        printf("->Line BECAUSE");
        $$ = (newast(ntl_BECAUSE,NULL,Has_line,$1,$2,$2));
    }

TLBELONG: TBELONG
    {
        //printf("->TBELONG");
        $$ = (newast(ntl_TBELONG,NULL,Without_line,$1,NULL,NULL));
    }
    | TBELONG TLINE
    {
        printf("->Line TBELONG");
        $$ = (newast(ntl_TBELONG,NULL,Has_line,$1,$2,$2));
    }

LMONOINC: MONOINC
    {
        //printf("->MONOINC");
        $$ = (newast(ntl_MONOINC,NULL,Without_line,$1,NULL,NULL));
    }
    | MONOINC TLINE
    {
        printf("->Line MONOINC");
        $$ = (newast(ntl_MONOINC,NULL,Has_line,$1,$2,$2));
    }

LMONODEC: MONODEC
    {
        //printf("->MONODEC");
        $$ = (newast(ntl_MONODEC,NULL,Without_line,$1,NULL,NULL));
    }
    | MONODEC TLINE
    {
        printf("->Line MONOINC");
        $$ = (newast(ntl_MONODEC,NULL,Has_line,$1,$2,$2));
    }

LPAP: PAP
    {
        //printf("->PAP");
        $$ = (newast(ntl_PAP,NULL,Without_line,$1,NULL,NULL));
    }
    | PAP TLINE
    {
        printf("->Line PAP ");
        $$ = (newast(ntl_PAP,NULL,Has_line,$1,$2,$2));
    }

%%

void yyerror(char* s)
{
    fprintf(stderr , "%s\n",s);
}
