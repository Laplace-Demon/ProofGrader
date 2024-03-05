%option noyywrap yylineno
%option outfile="flex.c" header-file="flex.h"
%{
#include "M.tab.h"
#include "func.h"
%}

%%

"e" {
    char tmp[] = "TERM.RE";
    yylval.a = newast(leaf_const,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TCONST;
    }


"\\alpha" {
    char tmp[] = "alpha";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
    }

"\\beta" {
    char tmp[] = "beta";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\gamma" {
    char tmp[] = "gamma";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\Gamma" {
    char tmp[] = "Gamma";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\delta" {
    char tmp[] = "delta";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\Delta" {
    char tmp[] = "Delta";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\epsilon"|"\\varepsilon" {
    char tmp[] = "epss";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\zeta" {
    char tmp[] = "zeta";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\eta" {
    char tmp[] = "eta";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\pi"|"π" {
    char tmp[] = "TERM.RPi";
    yylval.a = newast(leaf_const,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TCONST;
}

"\\phi" {
    char tmp[] = "phi";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\Phi" {
    char tmp[] = "Phi";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}
"\\Psi" {
    char tmp[] = "Psi";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}


"\\psi" {
    char tmp[] = "psi";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\omega" {
    char tmp[] = "omega";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}
"\\Omega" {
    char tmp[] = "Omega";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\Sigma"  {
    char tmp[] = "Sigma";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\sigma"  {
    char tmp[] = "sigma";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\mu" {
    char tmp[] = "miu";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\lambda" {
    char tmp[] = "lambda";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}
"\\Lambda" {
    char tmp[] = "Lambda";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
}

"\\leaf_varepsilon"|"ε" {
    char tmp[] = "eps";
    yylval.a = newast(leaf_var,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TVAR;
    }

"\\in" {
    yylval.a = newast(leaf_belong,yytext,yyleng,NULL,NULL,NULL);
    return TBELONG;
}

[2-9]+\.|[1-9][0-9]+\. {
    yylval.a = newast(leaf_line,yytext,yyleng,NULL,NULL,NULL);
    return TLINE;
}

[0-9]+ {
    yylval.a = newast(leaf_num,yytext,yyleng,NULL,NULL,NULL);
    return TNUM;
}

"+" {
    char tmp[] = "+";
    yylval.a = newast(leaf_add,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tadd;
}

"\\times"|"\\cdot"|"\\ast"|"*" {
    char tmp[] = "*";
    yylval.a = newast(leaf_times,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Ttimes;
}


"\\div"|"/" {
    char tmp[] = "/";
    yylval.a = newast(leaf_div,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tdiv;
}


"-" {
    char tmp[] = "-";
    yylval.a = newast(leaf_minus,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    // front or mid?
    return Tminus;
}

"\\sqrt" {
    char tmp[] = "sqrt";
    yylval.a = newast(leaf_sqrt,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tsqrt;
}

"\\ln" {
    char tmp[] = "ln";
    yylval.a = newast(leaf_ln,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tln;
}

"'" {
    char tmp[] = "'";
    yylval.a = newast(leaf_derivative,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tderi;
}

":=" {
    char tmp[] = "Deq";
    yylval.a = newast(leaf_deq,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Deq;
}

"="|"为" {
    char tmp[] = "eq";
    yylval.a = newast(leaf_eq,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Teq;
}

"\\leq"|"\\le" {
    char tmp[] = "le";
    yylval.a = newast(leaf_leq,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tleq;
}

"\\geq"|"\\ge" {
    char tmp[] = "ge";
    yylval.a = newast(leaf_geq,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tgeq;
}

"\\lt"|"<" {
    char tmp[] = "lt";
    yylval.a = newast(leaf_lt,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tlt;
}

"\\gt"|">" {
    char tmp[] = "gt";
    yylval.a = newast(leaf_gt,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tgt;
}

"\\neq" {
    char tmp[] = "neq";
    yylval.a = newast(leaf_neq,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tneq;
}

"\\equiv" {
    char tmp[] = "equiv";
    yylval.a = newast(leaf_equiv,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tequiv;
}


"\\frac" {
    yylval.a = newast(leaf_frac,yytext,yyleng,NULL,NULL,NULL);
    return Tfrac;
}



"\\lim\\limits\_" {
    char tmp[] = "lim";
    yylval.a = newast(leaf_lim,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tlim;
}

"\\to" {
    char tmp[] = "to";
    yylval.a = newast(leaf_to,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tto;
}

"\\infty" {
    char tmp[] = "infty";
    yylval.a = newast(leaf_infty,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tinfty;
}
"+\\infty" {
    char tmp[] = "+infty";
    yylval.a = newast(leaf_pos_infty,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TPinfty;
}

"-\\infty" {
    char tmp[] = "-infty";
    yylval.a = newast(leaf_neg_infty,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TNinfty;
}

"\\forall "|"任意"|"对于任意" {
    char tmp[] = "forall";
    yylval.a = newast(leaf_forall,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tforall;
}

"\\exists "|"存在" {
    char tmp[] = "exists";
    yylval.a = newast(leaf_exists,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Texists;
}

"^" {
    char tmp[] = "power";
    yylval.a = newast(leaf_power,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tpower;
}

(Goal[ \t]**(\:)|(\.))|"要证："|"Goal：" {
    char tmp[] = "goal";
    yylval.a = newast(leaf_goal,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return GOAL;
}

"$$" {
    char tmp[] = "math2";
    yylval.a = newast(leaf_math2,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return MATH2;
}

"$" {
    char tmp[] = "math1";
    yylval.a = newast(leaf_math1,yytext,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return MATH1;
}
"(" {
    yylval.a = newast(leaf_LB1L,yytext,yyleng,NULL,NULL,NULL);
    return LB1L;
}

")" {
    yylval.a = newast(leaf_LB1R,yytext,yyleng,NULL,NULL,NULL);
    return LB1R;
}

"\\["|"【"|"[" {
    yylval.a = newast(leaf_LB2L,yytext,yyleng,NULL,NULL,NULL);
    return LB2L;
}

"\\]"|"】"|"]" {
    yylval.a = newast(leaf_LB2R,yytext,yyleng,NULL,NULL,NULL);
    return LB2R;
}
"\\{"|"{"|"\\lbrace" {
    yylval.a = newast(leaf_LB3L,yytext,yyleng,NULL,NULL,NULL);
    return LB3L;
}

"\\}"|"}"|"\\rbrace" {
    yylval.a = newast(leaf_LB3R,yytext,yyleng,NULL,NULL,NULL);
    return LB3R;
}
"|"|"\\mid" {
    char tmp[] = "abs";
    yylval.a = newast(leaf_abs,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return ABS;
}

"\\max" {
    char tmp[] = "max";
    yylval.a = newast(leaf_max,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return MAX;
}

"\\min" {
    char tmp[] = "min";
    yylval.a = newast(leaf_min,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return MIN;
}

"\\lceil" {
    char tmp[] = "lceil";
    yylval.a = newast(leaf_LCEIL,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return LCEIL;
}

"\\rceil" {
    char tmp[] = "rceil";
    yylval.a = newast(leaf_RCEIL,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return RCEIL;
}

"\\lfloor" {
    char tmp[] = "lfloor";
    yylval.a = newast(leaf_LFLOOR,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return LFLOOR;
}

"\\rfloor" {
    char tmp[] = "rfloor";
    yylval.a = newast(leaf_RFLOOR,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return RFLOOR;
}

"\\sin" {
    char tmp[] = "sin";
    yylval.a = newast(leaf_SIN,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tsin;
}

"\\cos" {
    char tmp[] = "cos";
    yylval.a = newast(leaf_COS,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tcos;
}

"\\sup" {
    char tmp[] = "sup";
    yylval.a = newast(leaf_SUP,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return Tsup;
}

"Proof"[\[ \t]*]*[\.\:：]|"证"[：\:] {
    char tmp[] = "proof";
    yylval.a = newast(leaf_proof,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return PROOF;
}

"Q.E.D."|"证毕"[。.]* {
    char tmp[] = "qed";
    yylval.a = newast(leaf_qed,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return QED;
}

"已知" {
    char tmp[] = "given";
    yylval.a = newast(leaf_given,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return GIVEN;
}

"Assum"|"假定"|"假设"|"设"|[^\[ \t]*]*设 {
    char tmp[] = "assum";
    yylval.a = newast(leaf_assume,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return SUPPOSE;
}

"由"|"根据" {
    char tmp[] = "since";
    yylval.a = newast(leaf_since,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return SINCE;
}


"变形得"|"式变形得"|"等价变形得"|"式等价变形得" {
    char tmp[] = "trans";
    yylval.a = newast(leaf_trans,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TRANS;
}
"使用" {
    char tmp[] = "use";
    yylval.a = newast(leaf_USE,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return USE;
}

"证明"|"证明："|"证明:" {
    char tmp[] = "to_prove";
    yylval.a = newast(leaf_TO_PROVE,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return TO_PROVE;
}

"同理" {
    char tmp[]="same";
    yylval.a = newast(leaf_same,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return SAME;
}

"那么"|"则"|"so"|"then"|"thus"|"得"|"可知"|"可证"|"可得"|"所以" {
    char tmp[] = "then";
    yylval.a = newast(leaf_then,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return THEN;
}

"取" {
    yylval.a = newast(leaf_INTROS,NULL,0,NULL,NULL,NULL);
    return INTROS;
}

"令" {
    yylval.a = newast(leaf_SET,NULL,0,NULL,NULL,NULL);
    return SET;    
}

"," {
    yylval.a = newast(leaf_COMMA,NULL,0,NULL,NULL,NULL);
    return COMMA;    
}

"满足"|"suppose" {
    yylval.a = newast(leaf_SUPPOSE,NULL,0,NULL,NULL,NULL);
    return SUPPOSE;
}



"两边" {
    yylval.a = newast(leaf_Both,NULL,0,NULL,NULL,NULL);
    return BOTH;
}

"求导" {
    yylval.a = newast(leaf_Deri,NULL,0,NULL,NULL,NULL);
    return DERI;
}

"平方" {
    yylval.a = newast(leaf_Square,NULL,0,NULL,NULL,NULL);
    return SQUARE;
}

"对" {
    yylval.a = newast(leaf_For,NULL,0,NULL,NULL,NULL);
    return FOR;
}

"在" {
    yylval.a = newast(leaf_IN,NULL,0,NULL,NULL,NULL);
    return IN;
}

"若" {
    yylval.a = newast(leaf_IF,NULL,0,NULL,NULL,NULL);
    return IF;
}

"有" {
    yylval.a = newast(leaf_HAVE,NULL,0,NULL,NULL,NULL);
    return HAVE;
}

"是" {
    yylval.a = newast(leaf_IS,NULL,0,NULL,NULL,NULL);
    return IS;
}

"连续"|"处连续" {
    yylval.a = newast(leaf_CONTINUE,NULL,0,NULL,NULL,NULL);
    return CONTINUE;
}

"一致连续"|"处一致连续" {
    yylval.a = newast(leaf_UCONTINUE,NULL,0,NULL,NULL,NULL);
    return UCONTINUE;
}

"PoseWithoutProof" {
    char tmp[] = "PoseWithoutProof";
    yylval.a = newast(leaf_PWP,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return PWP;
}

"下面证明"|"PoseAndProve" {
    char tmp[] = "PoseAndProve";
    yylval.a = newast(leaf_PAP,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return PAP;
}

"ConclWithoutProof" {
    char tmp[] = "ConclWithoutProof";
    yylval.a = newast(leaf_CWP,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return CWP;
}

"ConclAndProof" {
    char tmp[] = "ConclAndProof";
    yylval.a = newast(leaf_CAP,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return CAP;
}

"ClaimSuffice" {
    char tmp[] = "ClaimSuffice";
    yylval.a = newast(leaf_CS,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return CS;
}

"ProveSuffice" {
    char tmp[] = "ProveSuffice";
    yylval.a = newast(leaf_PS,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return PS;
}



(A\_n[ \t]*(\\leq|<=)[ \t]*S\_n)|"算术平均值小于等于平方平均值" {
    char tmp[] = "ASaverage";
    yylval.a = newast(leaf_KASaverage,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return KASaverage;
}



((S|Q)\_n[ \t]*((<=)|(\\leq))[ \t]*G\_n)|("几何平均值小于等于平方平均值") {
    char tmp[] = "SGaverage";
    yylval.a = newast(leaf_KSGaverage,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return KSGaverage;
}

("算术平均值小于等于几何平均值")|(A_n[ \t]*((<=)|(\\leq))[ \t]*G_n) {
    char tmp[] = "AGaverage";
    yylval.a = newast(leaf_KAGaverage,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return KAGaverage;
}

"极限定义"|"极限的定义" {
    char tmp[] = "limit_def";
    yylval.a = newast(leaf_LIM_DEF,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return LIM_DEF;
}

"数列收敛的定义"|"收敛的定义" {
    char tmp[] = "sequence_convergence_def";
    yylval.a = newast(leaf_SEQ_CONV_DEF,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return SEQ_CONV_DEF;
}

"连续定义"|"连续的定义"|"函数连续定义"|"函数连续的定义" {
    char tmp[] = "continue_def";
    yylval.a = newast(leaf_CONTINUE_DEF,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return CONTINUE_DEF;
}

"有界定义"|"有界的定义" {
    char tmp[] = "bound_def";
    yylval.a = newast(leaf_BOUND_DEF ,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return BOUND_DEF;
}

"上确界定义"|"上确界的定义" {
    char tmp[] = "supre_def";
    yylval.a = newast(leaf_SUPRE_DEF ,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return SUPRE_DEF;
}

"下确界定义"|"下确界的定义" {
    char tmp[] = "infi_def";
    yylval.a = newast(leaf_INFI_DEF ,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return INFI_DEF;
}

"上界" {
    char tmp[] = "BoundAbove";
    yylval.a = newast(leaf_BOUND_ABOVE ,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return BOUND_ABOVE;
}

"下界" {
    char tmp[] = "BoundBelow";
    yylval.a = newast(leaf_BOUND_BELOW ,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return BOUND_BELOW;
}

"界" {
    char tmp[] = "Bound";
    yylval.a = newast(leaf_BOUND,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return BOUND;
}

"收敛" {
    char tmp[] = "Converge";
    yylval.a = newast(leaf_CONVERGE,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return CONVERGE;
}

"发散" {
    char tmp[] = "Diverge";
    yylval.a = newast(leaf_DIVERGE,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return DIVERGE;
}

"唯一"|"是唯一的" {
    char tmp[] = "Unique";
    yylval.a = newast(leaf_UNIQUE,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return UNIQUE;
}

"唯一性定义"|"唯一性的定义" {
    char tmp[] = "Unique_def";
    yylval.a = newast(leaf_UNIQUE_DEF,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return UNIQUE_DEF;
}

"一致连续定义"|"一致连续的定义"|"函数一致连续定义"|"函数一致连续的定义" {
    char tmp[] = "UContinue_def";
    yylval.a = newast(leaf_UC_DEF,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return UC_DEF;
}

"极限的夹逼准则" {
    char tmp[] = "FSqueeze";
    yylval.a = newast(leaf_FSqueeze,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return FSqueeze;
}

"确界原理" {
    char tmp[] = "supre_theorem";
    yylval.a = newast(leaf_SUPRE_THEOREM ,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return SUPRE_THEOREM;
}

"单调有界定理" {
    char tmp[] = "monotone_convergence_theorem";
    yylval.a = newast(leaf_MONO_CONV_THEOREM ,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return MONO_CONV_THEOREM;
}

"记作"|"RememberAs"|"Remark" {
    char tmp[] = "Remember";
    yylval.a = newast(leaf_remember,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return REMEMBER;
}
"```" {
    char tmp[] = "codebox";
    yylval.a = newast(leaf_codebox,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return CODEBOX;
}

"等式相加"|"式相加" {
    char tmp[] = "equnadd";
    yylval.a = newast(leaf_equnadd,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return EQUNADD;
}


"得证"|"原命题得证"|"原式得证" {
    char tmp[] = "Conclude";
    yylval.a = newast(leaf_conclude,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return CONCLUDE;
}


"综上" {
    char tmp[] = "auto_conclude";
    yylval.a = newast(leaf_AUTO_CONC,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return AUTO_CONC;
}

"易知"|"易知："|"易知:"|"自然"|"自然可知"|"因此"|"我们有"|"显然有"|"同样地"|"我们知道" {
    char tmp[] = "auto_nohint";
    yylval.a = newast(leaf_AUTO_NOHINT,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return AUTO_NOHINT;
}

"即证"|"只需证" {
    char tmp[] = "auto_bwd_nohint";
    yylval.a = newast(leaf_AUTO_BWD_NOHINT,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return AUTO_BWD_NOHINT;
}

"因为" {
    char tmp[] = "because";
    yylval.a = newast(leaf_because,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return BECAUSE;
}

"单增"|"单调递增" {
    char tmp[] = "MonoInc";
    yylval.a = newast(leaf_MONOINC,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return MONOINC;
}

"单减"|"单调递减" {
    char tmp[] = "MonoDec";
    yylval.a = newast(leaf_MONODEC,tmp,(sizeof(tmp)/sizeof(char)),NULL,NULL,NULL);
    return MONODEC;
}

[A-Za-df-z][A-Za-df-z]* {
    yylval.a = newast(leaf_var,yytext,yyleng,NULL,NULL,NULL);
    return TVAR;
}

[A-Za-z]"_"[A-Za-z0-9_{}] {
    // remove the underline
    char *tmp = (char*)malloc((yyleng+1) * sizeof(char));
    tmp[0]=yytext[0];
    for(int i = 2;i<yyleng;++i){
        tmp[i-1] = yytext[i];
    }
    // for(int i = 0;i<yyleng-1;++i)
    // { printf("%c",tmp[i]); }
    yylval.a = newast(leaf_seq_var,tmp,yyleng-1,NULL,NULL,NULL);
    return TVAR;
}

"___hyp"[0-9]* {
    
    yylval.a = newast(leaf_var,yytext,yyleng,NULL,NULL,NULL);
    return TVAR;
}


[ \t\n，:：；。\r]    { };

[1]\. {};

"的" {};

.   {printf("\n%s\n",yytext);
     yyerror("Mystery Character.");}
%%