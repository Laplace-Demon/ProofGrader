#ifndef FUNC_H_INCLUDED
#define FUNC_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>

enum Leaf {
  MARKER_L_leaf = 0,
  leaf_const,
  leaf_var,
  leaf_seq_var,
  leaf_num,
  leaf_line,
  leaf_add,
  leaf_belong,
  leaf_times,
  leaf_div,
  leaf_minus,
  leaf_sqrt,
  leaf_ln,
  leaf_derivative,
  leaf_frac,
  leaf_eq,
  leaf_deq,
  leaf_leq,
  leaf_geq,
  leaf_neq,
  leaf_equiv,
  leaf_lt,
  leaf_gt,
  leaf_lim,
  leaf_to,
  leaf_infty,
  leaf_pos_infty,
  leaf_neg_infty,
  leaf_goal,
  leaf_math1,
  leaf_math2,
  leaf_proof,
  leaf_codebox,
  leaf_qed,
  leaf_given,
  leaf_assume,
  leaf_PWP,
  leaf_PAP,
  leaf_CWP,
  leaf_CAP,
  leaf_CS,
  leaf_PS,
  leaf_KASaverage,
  leaf_KSGaverage,
  leaf_KAGaverage,
  leaf_remember,
  leaf_conclude,
  leaf_equnadd,
  leaf_since,
  leaf_trans,
  leaf_then,
  leaf_same,
  leaf_LB1L,
  leaf_LB1R,
  leaf_LB2L,
  leaf_LB2R,
  leaf_LB3L,
  leaf_LB3R,
  leaf_abs,
  leaf_min,
  leaf_LCEIL,
  leaf_RCEIL,
  leaf_LFLOOR,
  leaf_RFLOOR,
  leaf_SIN,
  leaf_COS,
  leaf_SUP,
  leaf_LIM_DEF,
  leaf_CONTINUE_DEF,
  leaf_UC_DEF,
  leaf_SUPRE_THEOREM,
  leaf_SUPRE_DEF,
  leaf_BOUND_BELOW,
  leaf_BOUND_ABOVE,
  leaf_FSqueeze,
  leaf_TO_PROVE,
  leaf_INTROS,
  leaf_SUPPOSE,
  leaf_IN,
  leaf_IF,
  leaf_HAVE,
  leaf_IS,
  leaf_For,
  leaf_Deri,
  leaf_Both,
  leaf_CONTINUE,
  leaf_UCONTINUE,
  leaf_SET,
  leaf_COMMA,
  leaf_AUTO_CONC,
  leaf_AUTO_NOHINT,
  leaf_because,
  leaf_MONOINC,
  leaf_MONODEC,
  leaf_USE,
  leaf_forall,
  leaf_exists,
  leaf_power,
  MARKER_r_leaf
};

enum NonTerminal {
  MARKER_l_nt = MARKER_r_leaf + 1, /* 64 */
  nt_PROGRAM,
  nt_STATEMENT,
  nt_PROOF_STATEMENT,
  nt_PROOF_STATEMENT_LIST,
  nt_GOAL_STATEMENT,
  nt_GIVEN_STATEMENT,
  nt_MATH_LIST,
  nt_MATH_EQUATION,
  nt_EQUATION,
  nt_FUNC,
  nt_ACTION,
  nt_EXPR,
  nt_LIM_HEAD,
  nt_INTERVAL,
  nt_FUNC_HEAD,
  nt_FUNC_EQUATION,
  nt_KNOWLEDGE,
  nt_SINCE_CLAUSE,
  nt_MEMORY_TERM,
  nt_CONTINUED_EQUATION,
  nt_CONTINUED_VAR,
  nt_EQS,
  nt_TEQ,
  nt_ACTION_STATEMENT,
  MARKER_r_nt
};

enum NonTerminal_leaf{
  MARKER_l_ntl = MARKER_r_nt + 1,
  ntl_TCONST,
  ntl_TVAR,
  ntl_TNUM,
  ntl_Tadd,
  ntl_Ttimes,
  ntl_Tdiv,
  ntl_Tminus,
  ntl_Tsqrt,
  ntl_Tln,
  ntl_Tderi,
  ntl_Tfrac,
  ntl_Teq,
  ntl_Deq,
  ntl_Tleq,
  ntl_Tgeq,
  ntl_Tlt,
  ntl_Tgt,
  ntl_Tneq,
  ntl_Tequiv,
  ntl_Tlim,
  ntl_Tto,
  ntl_Tinfty,
  ntl_TPinfty,
  ntl_TNinfty,
  ntl_goal,
  ntl_math1,
  ntl_math2,
  ntl_proof,
  ntl_qed,
  ntl_assum,
  ntl_given,
  ntl_since,
  ntl_trans,
  ntl_use,
  ntl_KASaverage,
  ntl_KSGaverage,
  ntl_KAGaverage,
  ntl_remember,
  ntl_equnadd,
  ntl_conclude,
  ntl_then,
  ntl_same,
  ntl_LB1L,
  ntl_LB1R,
  ntl_LB2L,
  ntl_LB2R,
  ntl_LB3L,
  ntl_LB3R,
  ntl_min,
  ntl_abs,
  ntl_LCEIL,
  ntl_RCEIL,
  ntl_LFLOOR,
  ntl_RFLOOR,
  ntl_LIM_DEF,
  ntl_TO_PROVE,
  ntl_sin,
  ntl_cos,
  ntl_sup,
  ntl_CONTINUE_DEF,
  ntl_UC_DEF,
  ntl_SUPRE_THEOREM,
  ntl_SUPRE_DEF,
  ntl_BOUND_BELOW,
  ntl_BOUND_ABOVE,
  ntl_FSqueeze,
  ntl_INTROS,
  ntl_SET,
  ntl_COMMA,
  ntl_BOTH,
  ntl_FOR,
  ntl_DERI,
  ntl_SUPPOSE,
  ntl_Texists,
  ntl_Tforall,
  ntl_IN,
  ntl_IS,
  ntl_IF,
  ntl_HAVE,
  ntl_CONTINUE,
  ntl_UCONTINUE,
  ntl_AUTO_CONC,
  ntl_AUTO_NOHINT,
  ntl_BECAUSE,
  ntl_TBELONG,
  ntl_MONOINC,
  ntl_MONODEC,
  ntl_PAP,
  ntl_forall,
  ntl_exists,
  ntl_power,
  MARKER_r_ntl
};

enum leaf_state{
  MARKER_l_ls = MARKER_r_ntl + 1,
  Has_line,
  Without_line,
  MARKER_r_ls
};

enum Program {
  MARKER_l_prog = MARKER_r_ls + 1, /* 81 */
  prog_single,
  prog_list,
  MARKER_r_prog
};

enum Statement {
  MARKER_l_stmt = MARKER_r_prog + 1,
  stmt_goal,
  stmt_given,
  stmt_proof_list,
  stmt_proof,
  MARKER_r_stmt
};

enum Proof_Statement_List {
  MARKER_l_proof_stmt_list = MARKER_r_stmt + 1,
  proof_stmt_list_single,
  proof_stmt_list,
  proof_stmt_PoseAndProve,
  proof_stmt_PoseVar,
  MARKER_r_proof_stmt_list
};

enum Proof_Statement {
  MARKER_l_proof_stmt = MARKER_r_proof_stmt_list + 1, /* 85 */
  stmt_qed,
  stmt_since_remember_as,
  stmt_action_math_equation,
  stmt_action_conclude,
  stmt_use_limit_to_prove,
  stmt_use_continue_to_prove,
  stmt_use_uc_to_prove,
  stmt_action,
  stmt_since_no_remember,
  MARKER_r_proof_stmt
};



enum given_stmt {
  MARKER_l_given_stmt = MARKER_r_proof_stmt + 1,
  given_single,
  given_list,
  MARKER_r_given_stmt
};

enum goal_stmt {
  MARKER_l_goal_stmt = MARKER_r_given_stmt + 1, /* 96 */
  goal_math_equa,
  MARKER_r_goal_stmt
};

enum action_stmt {
  MARKER_l_action_stmt = MARKER_r_goal_stmt + 1, /* 99 */
  action_stmt_intros,
  action_stmt_intros_suppose_list_equation,
  action_stmt_suppose,
  action_stmt_set_as_math_expr1,
  action_stmt_set_as_math_expr2,
  MARKER_r_action_stmt
};


enum math_list {
  MARKER_l_math_list = MARKER_r_action_stmt + 1,
  math_list_two,
  math_list_n,
  MARKER_r_math_list

};

enum math_equation {
  MARKER_l_math_equation = MARKER_r_math_list + 1, /* 105 */
  math_equation_math1,
  math_equation_math2,
  math_equation_continued2,
  math_equation_interval1,
  math_equation_interval2,
  math_equation_func,
  math_equation_forall,
  math_equation_exists,
  math_equation_exists_sets,
  math_equation_forall_sets,
  math_equation_in_var_continue,
  math_equation_in_interval_continue,
  math_equation_in_var_ucontinue,
  math_equation_in_interval_ucontinue,
  math_equation_continue,
  math_equation_ucontinue,
  math_equation_monoinc,
  math_equation_monodec,
  math_equation_bound_above,
  math_equation_bound_below,
  math_equation_impl,
  math_equation_have_bound_above,
  math_equation_have_bound_below,
  math_equation_n_belong_N,
  MARKER_r_math_equation
};

enum equation {
  MARKER_l_equation = MARKER_r_math_equation + 1, /* 110 */
  equation_expr,
  equation_func,
  equation_func_y,
  MARKER_r_equation
};

enum Teq {
  MARKER_l_Teq = MARKER_r_equation + 1, /* 113 */
  Teq_teq,
  Teq_tleq,
  Teq_tgeq,
  Teq_tneq,
  Teq_tequiv,
  Teq_tlt,
  Teq_tgt,
  MARKER_r_Teq
};

enum Continued_equation {
  MARKER_l_Continued_equation = MARKER_r_Teq + 1, /* 122 */
  Continued_equation_equation,
  Continued_equation_continued_equation,
  MARKER_r_Continued_equation
};

enum Lim_head {
  MARKER_l_Lim_head = MARKER_r_Continued_equation + 1, /* 126 */
  Lim_head_lim_to_infty,
  Lim_head_lim_to_Ninfty,
  Lim_head_lim_to_Pinfty,
  Lim_head_lim_to_expr,
  MARKER_r_Lim_head
};
enum Func_head{
  MARKER_l_Func_head = MARKER_r_Lim_head+1,
  func_head_binding,
  MARKER_r_Func_head
};
enum Interval{
  MARKER_l_Interval = MARKER_r_Func_head+1,
  Interval_lopen_ropen,
  Interval_lclosed_ropen,
  Interval_lopen_rclosed,
  Interval_lclosed_rclosed,
  Interval_lopen_rinfty,
  Interval_lclosed_rinfty,
  Interval_linfty_ropen,
  Interval_linfty_rclosed,
  MARKER_r_Interval
};

enum Expr {
  MARKER_l_Expr = MARKER_r_Interval + 1, /* 129 */
  Expr_tvar,
  Expr_tconst,
  Expr_tnum,
  Expr_1L_minus_1R,
  Expr_abs,
  Expr_tadd,
  Expr_tminus,
  Expr_tdiv,
  Expr_ttimes,
  Expr_tsqrt_2,
  Expr_tsqrt_n,
  Expr_tln,
  Expr_tsin,
  Expr_tcos,
  Expr_tsup,
  Expr_3L_3R_3L_3R,
  Expr_1L_1R,
  Expr_derivative,
  Expr_derivative_f,
  Expr_tfrac_3L_3R_3L_3R,
  Expr_lim_head,
  Expr_Lceil_3L_3R_Rceil,
  Expr_Lfloor_3L_3R_Rfloor,
  Expr_tpower,
  Expr_tmin,
  Expr_func,
  Expr_seq_sets,
  MARKER_r_Expr
};

enum Knowledge {
  MARKER_l_Knowledge = MARKER_r_Expr + 1, /* 147 */
  Knowledge_KASaverage,
  Knowledge_KSGaverage,
  Knowledge_KAGaverage,
  Knowledge_FSqueeze,
  Knowledge_Supre_def,
  Knowledge_Supre_the,
  Knowledge_Lim_def,
  Knowledge_Math1,
  Knowledge_Math2,
  MARKER_r_Knowledge
};

enum Since_clause {
  MARKER_l_Since_clause = MARKER_r_Knowledge + 1, /* 154 */
  Since_clause_knowledge,
  Since_clause_math_equation,
  Since_clause_tnum,
  Since_clause_same,
  Since_clause_auto_nohint,
  Since_clause_trans,
  Since_clause_BothDeri,
  Since_clause_BothDeri_var,
  Since_clause_because,
  MARKER_r_Since_clause
};

enum Action {
  MARKER_l_Action = MARKER_r_Since_clause + 1, /* 161 */
  Action_eqs_equnadd,
  Action_auto_conc,
  MARKER_r_Action
};

enum Memory_term {
  MARKER_l_Memory_term = MARKER_r_Action + 1, /* 165 */
  Memory_term_tnum,
  MARKER_r_Memory_term
};

enum Eqs {
  MARKER_l_Eqs = MARKER_r_Memory_term + 1, /* 168 */
  Eqs_memory_term,
  Eqs_memory_term_eqs,
  MARKER_r_Eqs
};

enum Other_subs{
  MARKER_l_others = MARKER_r_Eqs + 1, /*172 */
  others_remember,
  others_exps,
  MARKER_r_others
};

void yyerror(char *s);

struct ast {
  int nodetype;
  char *addr;
  // in terminal: length 
  // in nonterminal : L2-key
  int len;
  struct ast *l;
  struct ast *r;
  struct ast *lineNum;
};

struct ast *newast(int nodetype, char *text, int len, struct ast *l,
                   struct ast *r,struct ast *lineNum);
void printtree(struct ast *root, FILE *fp);

//void exprvar(struct ast *root, list *res);

void exprvar(struct ast *root, char *s);
//char var_in(list *res);
char var_in(char *s);
int strToNum(char *str);
void add_lineNum();
#endif // FUNC_H_INCLUDED
