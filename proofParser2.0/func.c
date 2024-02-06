#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "func.h"
#define DBG
extern int action_stack;
//语法树节点定义
struct ast *newast(int nodetype, char *text, int len, struct ast *l, struct ast *r,struct ast *lineNum)
{
    struct ast *node = malloc(sizeof(struct ast));
    if (!node)
    {
        exit(0);
    }
    node->nodetype = nodetype;
    node->l = l;
    node->r = r;
    node->addr = NULL;
    node->len = 0;
    if (len > 0)
    {
        if (text != NULL)
        {
            node->addr = (char *)malloc(sizeof(char) * (len + 1));
            int i = 0;
            for (i = 0; i <= len; ++i)
            {
                node->addr[i] = text[i];
            }
            node->len = len + 1;
        }
        else
        {
            node->len = len;
        }
    }
    node->lineNum = lineNum;
    return node;
}

struct ast *since_cache = NULL;
char lvar[100];
char var;
int premise_flag = 0;
int lineNumber;
int lineEnd;
int continue_var = 0;

struct ast *con_var = NULL;


void printtree(struct ast *root,FILE *fp)
{
    if (root == NULL) return;
    switch(root->nodetype)
    {
        case nt_PROGRAM:
            #ifdef DBG
                printf("program\n");
            #endif
            if (root == NULL) break;
            if (root->l->len != stmt_given && root->l->len == stmt_goal) {
                if (premise_flag == 0) fprintf(fp, "Definition premise: list prop := nil.\n");
            }
            printtree(root->l, fp);
            printtree(root->r, fp);
            break;
        case nt_STATEMENT:
            #ifdef DBG
                printf("statement\n");
            #endif
        switch (root->len)
        {   
            case stmt_goal:
            #ifdef DBG
                printf("goal\n");
            #endif
            fprintf(fp,"Module ProofGoal.\n");
            fprintf(fp,"Definition stmt: prop :=\n");
            printtree(root->l, fp);
            fprintf(fp, ".");
            break;
          case stmt_given:
            #ifdef DBG
                printf("given\n");
            #endif
            fprintf(fp,"Definition premise: list prop :=\n");
            premise_flag = 1;
            printtree(root->l,fp);
            fprintf(fp,"nil. \n");
            
            break;
          case stmt_proof:
            #ifdef DBG
                printf("proof\n");
            #endif
            fprintf(fp,"\n(*Proof starts here*)\nDefinition pr: proof :=\n");
            lineNumber = strToNum(root->lineNum->addr);
            break;
         case stmt_proof_list:
            printtree(root->l,fp);
        }
        break;
        case nt_PROOF_STATEMENT_LIST:
           #ifdef DBG
                printf("proof_statement_list\n");
           #endif
        switch (root->len)
        {  
           case proof_stmt_list_single:
           if(root->lineNum != NULL) {
               lineEnd = strToNum(root->lineNum->addr) - 1;
           }
           fprintf(fp,"(");
           printtree(root->l,fp);
           
           if(root->l->len == stmt_since_no_remember){
                fprintf(fp,"(PrEndPartialProof)");
           }
           fprintf(fp,")");
           break;

           case proof_stmt_list:
           if(root->l != NULL && root->l->lineNum != NULL)
           {
              lineEnd = strToNum(root->l->lineNum->addr) - 1;
           }
           else
           {
              printf("lineNumber must follow comma \n");
              break;
           }
           fprintf(fp,"((");
           printtree(root->r->l,fp);
           fprintf(fp,")");
           lineNumber = lineEnd + 1;
           lineEnd = 0;
           fprintf(fp,"\n (");
           printtree(root->r->r,fp);
           fprintf(fp,"))");
           break;

           case proof_stmt_PoseAndProve:
           if(root->lineNum != NULL)
           {
              lineEnd = strToNum(root->lineNum->addr) - 1;
           }
           else
           {
              printf("lineNumber must follow \"}\" \n");
              break;
           }
           fprintf(fp,"PrPoseAndProve %d %d (PROOF.FNoHint) ",lineNumber,lineEnd);
           printtree(root->l,fp);
           fprintf(fp,"\n (");
           printtree(root->r->l,fp);
           fprintf(fp,")\n(");
           printtree(root->r->r,fp);
           fprintf(fp,")");
           break;

           case proof_stmt_PoseVar:
           if(root->lineNum != NULL)
           {
              lineEnd = strToNum(root->lineNum->addr) - 1;
           }
           else
           {
              printf("can't find lineNumber in action \n");
              break;
           }
           if(root->l->len == action_stmt_intros){
                if(root->lineNum != NULL)
                {
                  lineEnd = strToNum(root->lineNum->addr) - 1;
                }
                else
                {
                  printf("lineNumber must follow \"}\" \n");
                  break;
                }
                fprintf(fp,"PrPosePartialProof %d %d (PROOF.APoseVar \"",lineNumber, lineEnd);
                if(root->l->r->l->nodetype == leaf_var)
                {
                    for(int i = 0;i<root->l->r->l->len-1;++i)
                       if(root->l->r->l->addr[i])
                           fprintf(fp,"%c",root->l->r->l->addr[i]);
                }
                fprintf(fp,"\" nil)");
                int tmp = lineEnd;
                printtree(root->r->l,fp);
                printf("%d \n",lineNumber);
                lineNumber = tmp + 1;
                printtree(root->r->r,fp);
           }
           if(root->l->len == action_stmt_intros_suppose_list_equation){
            if(root->lineNum != NULL)
                {
                  lineEnd = strToNum(root->lineNum->addr) - 1;
                }
                else
                {
                  printf("lineNumber must follow \"}\" \n");
                  break;
                }
                fprintf(fp,"PrPosePartialProof %d %d (PROOF.APoseVar \"",lineNumber, lineEnd);
                if(root->l->l->l->nodetype == leaf_var)
                {
                    for(int i = 0;i<root->l->l->l->len-1;++i)
                       if(root->l->l->l->addr[i])
                           fprintf(fp,"%c",root->l->l->l->addr[i]);
                }
                fprintf(fp,"\" (");
                printtree(root->l->r,fp);
                fprintf(fp,"nil))");
                int tmp = lineEnd;
                printtree(root->r->l,fp);
                printf("%d \n",lineNumber);
                lineNumber = tmp + 1;
                printtree(root->r->r,fp);
           }
        }
        break;
        case nt_PROOF_STATEMENT:
        switch (root->len)
        {
            
          case stmt_since_remember_as:
          case stmt_action_math_equation:
          case stmt_action_conclude:
            #ifdef DBG
                printf("proof_statement\n");
            #endif
            
            if(root->r != NULL && root->r->nodetype == ntl_conclude)
            {
                //it means, it's going to do somthing and generate a concludsion
                #ifdef DBG
                    printf("conclude\n");
                #endif
                //fprintf(fp,"(( line %d-%d )",lineNumber,lineNumber);
                
                fprintf(fp,"PrConclWithoutProof %d %d",lineNumber,lineNumber);
                printtree(root->l,fp);               
                //fprintf(fp,")");
            }
            else if(root->l != NULL && root->l->nodetype == nt_SINCE_CLAUSE)
            { // brackets needs attention here
                //lineEnd = strToNum(root->lineNum->addr) -1;
                printtree(root->l,fp);
                //fprintf(fp,"(");
                printtree(root->r,fp);
                //fprintf(fp,")"); 
                //lineNumber = lineEnd +1;    
                //lineEnd = 0;          
            }
            
            else{
                printtree(root->l,fp);
                printtree(root->r,fp);
            }
            break;
          case stmt_since_no_remember:
            #ifdef DBG
                printf("no_remember statement\n");
            #endif
            //lineEnd = strToNum(root->lineNum->addr) -1;
            printtree(root->l,fp);
            //fprintf(fp,"(");
            printtree(root->r,fp);
            //fprintf(fp,")");
            //lineNumber = lineEnd +1;
            //lineEnd = 0;
            break;
          case stmt_action:
            #ifdef DBG
                printf("action_statement\n");
            #endif
            fprintf(fp,"PrAction %d %d",lineNumber, lineEnd);
            //fprintf(fp,"(( line %d-",lineNumber);
            /*if(root->lineNum != NULL){
                         printtree(root->lineNum,fp);
                    }
                    else {
                         printf("can't find lineNumber in stmt_action ");
                         break;
                    }*/
            
            //action_stack++;
            printtree(root->l,fp);
            
            break;
        
          case stmt_use_limit_to_prove:
            #ifdef DBG
                printf("prove_method\n");
            #endif
            // printf("%d",root->r->nodetype);
            if(root->r!=NULL && root->r->l->nodetype == leaf_LIM_DEF)
            {   // SINCE_CLAUSE + TO_PROVE
                    fprintf(fp,"PrConclAndProof %d" ,lineNumber);
                    //fprintf(fp,"( line %d-",lineNumber);
                    if(root->lineNum != NULL){
                         printtree(root->lineNum,fp);
                    }
                    else {
                         printf("can't find lineNumber in limit");
                         break;
                    }
                    fprintf(fp,"\n\tPROOF.FSeqLimitDef ( ");
                    //action_stack++;
                    
                    printtree(root->r,fp);
                    
            }
               else 
              {
                    printf("wrong limit definition method");
                    break;
              }
            
            break;
          case stmt_use_continue_to_prove:
            #ifdef DBG
                printf("prove_method\n");
            #endif
            // printf("%d",root->r->nodetype);
            if(root->r!=NULL && root->r->nodetype == leaf_CONTINUE_DEF)
            {   // SINCE_CLAUSE + TO_PROVE
                     fprintf(fp,"PrConclAndProof %d %d",lineNumber, lineEnd);
                    //fprintf(fp,"( line %d-",lineNumber);
                    /*if(root->lineNum != NULL){
                         printtree(root->lineNum,fp);
                    }
                    else {
                         printf("can't find lineNumber in continue");
                         break;
                    }*/
                    fprintf(fp,"\n\tPROOF.Continuity_x0_Def ( ");
                    //action_stack++;
                    
                    printtree(root->r,fp);
                    
            }
               else 
              {
                    printf("wrong continue definition method");
                    break;
              }
            
            break;
          case stmt_use_uc_to_prove:
            #ifdef DBG
                printf("prove_method\n");
            #endif
            // printf("%d",root->r->nodetype);
            if(root->r!=NULL && root->r->nodetype == leaf_UC_DEF)
            {   // SINCE_CLAUSE + TO_PROVE
                    fprintf(fp,"PrConclAndProof %d %d",lineNumber, lineEnd);
                    //fprintf(fp,"( line %d-",lineNumber);
                    /*if(root->lineNum != NULL){
                         printtree(root->lineNum,fp);
                    }
                    else {
                         printf("can't find lineNumber in uc ");
                         break;
                    }*/
                    fprintf(fp,"\n\tPROOF.UContinuity_Def ( ");
                    //action_stack++;
                    
                    printtree(root->r,fp);
                    
            }
               else 
              {
                    printf("wrong ucontinue definition method");
                    break;
              }
            
            break;
            
          case stmt_qed:
            #ifdef DBG
                printf("qed\n");
            #endif
            
            break;
          

          default:
            break;
        }
        break;
        //action statements
        case nt_GIVEN_STATEMENT:
            #ifdef DBG
                printf("given_statement\n");
            #endif 
            printtree(root->l,fp);
            break;
        case nt_MATH_LIST:
           #ifdef DBG
                printf("math_list\n");
            #endif 
            printtree(root->l,fp);
            if(root->l!=NULL)
            {
               fprintf(fp,"::");
               printtree(root->r,fp);
            }
            break;
        case nt_ACTION_STATEMENT:
             switch (root->len)
           {case action_stmt_intros:
            #ifdef DBG
                printf("intros\n");
            #endif
                
                fprintf(fp,"(PROOF.AIntros \"");
                // printtree(root->r,fp);
                // should not print TVar here
                if(root->r->l->nodetype == leaf_var)
                {
                    for(int i = 0;i<root->r->l->len-1;++i)
                    if(root->r->l->addr[i])
                    fprintf(fp,"%c",root->r->l->addr[i]);
                }
                fprintf(fp,"\" )\n");
            break;
           case action_stmt_suppose:
            #ifdef DBG
                printf("suppose\n");
            #endif
                fprintf(fp,"(PROOF.ASuppose (");
                
                printtree(root->r,fp);
                fprintf(fp,"))\n ");
            break;
           case action_stmt_set_as_math_expr1:
           case action_stmt_set_as_math_expr2:
            #ifdef DBG
                printf("set\n");
            #endif
                fprintf(fp,"(PROOF.ASet \"");
                if(root->r->l->l->nodetype == leaf_var)
                {
                    for(int i = 0;i<root->r->l->l->len-1;++i)
                    if(root->r->l->l->addr[i])
                    fprintf(fp,"%c",root->r->l->l->addr[i]);
                }
                fprintf(fp,"\"( ");
                printtree(root->r->r,fp);
                fprintf(fp,"))\n");
            break;
            default:
              break;
           }
           break;
        //end of action statements
        case nt_GOAL_STATEMENT:
            #ifdef DBG
                printf("goal_statement\n");
            #endif
            // printf("goal_statement");
            // if(root->l ==NULL) 
            //     printf("empty");
            // else 
            //     printf("not empty");
            printtree(root->l,fp);
            
            break;
        
        case nt_MATH_EQUATION:
            #ifdef DBG
                printf("math_equation\n");
            #endif
            if(root->len == math_equation_monoinc){
                fprintf(fp,"(PUnPred PROP.MonoInc ");
                
                printtree(root->l,fp);
                
                fprintf(fp,")");
                break;
            }
            else if(root->len == math_equation_monodec){
                fprintf(fp,"(PUnPred PROP.MonoDec ");
                printtree(root->l,fp);
                fprintf(fp,")");
                break;
            }
            if(root->len == math_equation_bound_above ){
                fprintf(fp,"(PBinPred PROP.BoundedAboveBy ");
                printtree(root->r,fp);
                printtree(root->l,fp);
                fprintf(fp,")");
                break;
            }
            else if(root->len == math_equation_bound_below){
                fprintf(fp,"(PBinPred PROP.BoundedBelowBy ");
                printtree(root->r,fp);
                printtree(root->l,fp);
                fprintf(fp,")");
                break;
            }
            if(root->len == math_equation_impl){
                fprintf(fp,"(PBinOp PROP.CImpl ");
                printtree(root->l,fp);
                printtree(root->r,fp);
                fprintf(fp,")");
                break;
            }
            if(root->len == math_equation_have_bound_above){
                fprintf(fp,"(PUnPred PROP.BoundedAbove  ");
                printtree(root->l,fp);
                fprintf(fp,")");
                break;
            }else if(root->len == math_equation_have_bound_below){
                fprintf(fp,"(PUnPred PROP.BoundedBelow  ");
                printtree(root->l,fp);
                fprintf(fp,")");
                break;
            }
            if(root->len==math_equation_math1||root->len==math_equation_math2)
            {
                //fprintf(fp,"math_equation");
                //indeed do nothing in left
                fprintf(fp,"(");
                printtree(root->l,fp);
                printtree(root->r,fp);
                fprintf(fp,")");
                break;
            }
            else if(root->len==math_equation_continued2)
            {
                printtree(root->r,fp);
                break;
            }
            else if(root->len==math_equation_interval1||root->len==math_equation_interval2)
            {   
                fprintf(fp,"(");
                printtree(root->l,fp);
                fprintf(fp,")");
                
                break;
            }
            else if(root->len==math_equation_func)
            {
                printtree(root->l,fp);
                
                break;
            }
            else if(root->len==math_equation_forall){
                con_var = root->l;
                while(1)
                {
                    fprintf(fp,"(PQuant PROP.QForall \"");
                    for(int i = 0;i<con_var->l->l->len-1;++i)
                          if(con_var->l->l->addr[i])
                    fprintf(fp,"%c",con_var->l->l->addr[i]);

                    fprintf(fp,"\"");
                    continue_var ++ ;

                    if(con_var->r!=NULL)
                        con_var = con_var->r;
                    else break;
                }
                
                printtree(root->r,fp);
                while(continue_var!=0){
                    fprintf(fp,")");
                    continue_var -- ;
                }
                break;
            } 
            else if(root->len==math_equation_exists){
                con_var = root->l;
                while(1)
                {
                    fprintf(fp,"(PQuant PROP.QExists \"");
                    for(int i = 0;i<con_var->l->l->len-1;++i)
                          if(con_var->l->l->addr[i])
                    fprintf(fp,"%c",con_var->l->l->addr[i]);

                    fprintf(fp,"\"");
                    continue_var ++ ;

                    if(con_var->r!=NULL)
                        con_var = con_var->r;
                    else break;
                }
                
                printtree(root->r,fp);
                while(continue_var!=0){
                    fprintf(fp,")");
                    continue_var -- ;
                }
                break;
            }
            else if(root->len == math_equation_exists_sets){
                fprintf(fp,"(PQuant PROP.QExists \"");
                fprintf(fp,"%c",root->l->l->l->addr[0]);
                fprintf(fp,"\" ");
                printtree(root->r,fp);
                fprintf(fp,")");
            }
            else if(root->len == math_equation_forall_sets){
                fprintf(fp,"(PQuant PROP.QForall \"");
                fprintf(fp,"%c",root->l->l->l->addr[0]);
                fprintf(fp,"\" ");
                printtree(root->r,fp);
                fprintf(fp,")");
            }
            else if(root->len == math_equation_in_var_continue || math_equation_in_interval_continue){
                fprintf(fp,"(PBinPred PROP.ContinueOn ");
                fprintf(fp,"(TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->l->r->l->len-1;++i)
                    if(root->l->r->l->addr[i])
                    fprintf(fp,"%c",root->l->r->l->addr[i]);
                fprintf(fp,"\"");

                fprintf(fp,"(TApply ");
                printtree(root->l->l,fp);
                printtree(root->l->r,fp);
                fprintf(fp," ))");
                printtree(root->r,fp);
                fprintf(fp,")");
                break;
            }
            else if(root->len == math_equation_in_var_ucontinue || math_equation_in_interval_ucontinue){
                fprintf(fp,"(PBinPred PROP.UContinueOn ");
                fprintf(fp,"(TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->l->r->l->len-1;++i)
                    if(root->l->r->l->addr[i])
                    fprintf(fp,"%c",root->l->r->l->addr[i]);
                fprintf(fp,"\"");

                fprintf(fp,"(TApply ");
                printtree(root->l->l,fp);
                printtree(root->l->r,fp);
                fprintf(fp," ))");
                printtree(root->r,fp);
                fprintf(fp,")");
                break;
            }
            else if(root->len == math_equation_continue ){
                fprintf(fp,"(PUnPred PROP.Continue ");
                fprintf(fp,"(TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->l->r->l->len-1;++i)
                    if(root->l->r->l->addr[i])
                    fprintf(fp,"%c",root->l->r->l->addr[i]);
                fprintf(fp,"\"");

                fprintf(fp,"(TApply ");
                printtree(root->l->l,fp);
                printtree(root->l->r,fp);
                fprintf(fp," )))");
                break;
            }
            else if(root->len == math_equation_ucontinue ){
                fprintf(fp,"(PUnPred PROP.UContinue ");
                fprintf(fp,"(TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->l->r->l->len-1;++i)
                    if(root->l->r->l->addr[i])
                    fprintf(fp,"%c",root->l->r->l->addr[i]);
                fprintf(fp,"\"");

                fprintf(fp,"(TApply ");
                printtree(root->l->l,fp);
                printtree(root->l->r,fp);
                fprintf(fp," )))");
                break;
            }
            else if(root->len == math_equation_monoinc){
                fprintf(fp,"(PUnPred PROP.MonoInc ");
                printf("start \n");
                printtree(root->l,fp);
                printf("end\n");
                fprintf(fp,")");
                break;
            }
            else if(root->len == math_equation_monodec){
                fprintf(fp,"(PUnPred PROP.MonoDec ");
                printtree(root->l,fp);
                fprintf(fp,")");
                break;
            }
            else break;
            break;
        case nt_CONTINUED_EQUATION:
            #ifdef DBG
                printf("cont_equation\n");
            #endif
            if(root->r== NULL|| root->r->r == NULL)
            {
                printf("wrong continued equation");
                break;
            }
            

                fprintf(fp,"(PLongOrder \t");
                // printtree(root->l,fp); // symbol 
                // the above will generate PBinPred
                // use this instead
                if(root->l ==NULL || root->l->l ==NULL) break;
                char *sym = root->l->l->l->addr;
                
                    if(sym[0] == 'l' && sym[1]=='e'){
                        fprintf(fp,"PROP.RLe ");
                    }
                    else if (sym[0] == 'g' && sym[1]=='e'){
                        fprintf(fp,"PROP.RGe ");
                    }
                    else if (sym[0] == 'l' && sym[1]=='t'){
                        fprintf(fp,"PROP.RLt ");
                    }
                    else if (sym[0] == 'g' && sym[1]=='t'){
                        fprintf(fp,"PROP.RGt ");
                    }
                    else if (sym[0] == 'e' && sym[1]=='q'){
                        fprintf(fp,"PROP.REq ");
                    }
                    else if (sym[0] == 'n' && sym[1]=='e'){
                        fprintf(fp,"PROP.RNeq ");
                    }
                    
                fprintf(fp,"\n(");
                printtree(root->r->l,fp); //expr
                fprintf(fp,")(");
                printtree(root->r->r,fp);
                fprintf(fp,"))");
                break;
        
        case nt_INTERVAL:
            #ifdef DBG
                printf("interval\n");
            #endif
            switch(root->len){
              case Interval_lopen_ropen:
                 fprintf(fp,"TInterval TERM.LOpen_ROpen_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break;
              case Interval_lclosed_ropen:
                 fprintf(fp,"TInterval TERM.LClosed_ROpen_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break; 
              case Interval_lopen_rclosed:
                 fprintf(fp,"TInterval TERM.LOpen_RClosed_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break;
              case Interval_lclosed_rclosed:
                 fprintf(fp,"TInterval TERM.LClosed_RClosed_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break;
              case Interval_lopen_rinfty:
                 fprintf(fp,"TInterval TERM.LOpen_ROpen_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break;
              case Interval_lclosed_rinfty:
                 fprintf(fp,"TInterval TERM.LClosed_ROpen_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break;
              case Interval_linfty_ropen:
                 fprintf(fp,"TInterval TERM.LOpen_ROpen_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break;
              case Interval_linfty_rclosed:
                 fprintf(fp,"TInterval TERM.LOpen_RClosed_interval ");
                 printtree(root->l,fp);
                 printtree(root->r,fp);
                 break;
              default: break;}
              break;
        case nt_EQUATION:
            #ifdef DBG
                printf("equation\n");
            #endif
            
            printtree(root->l,fp);

            printtree(root->r,fp);

            break;
        case nt_FUNC_HEAD:
            #ifdef DBG
                printf("func_head\n");
            #endif
            printtree(root->l,fp);
            fprintf(fp,"(TBinder TERM.LambdaB \"");
            for(int i = 0;i<root->r->l->len-1;++i)
                if(root->r->l->addr[i])
                fprintf(fp,"%c",root->r->l->addr[i]);
            fprintf(fp,"\"");
            break;
        case nt_FUNC_EQUATION:
            if(root->len== equation_func_y){
                fprintf(fp,"( PBinPred PROP.REq ");
                fprintf(fp,"(TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->r->r->l->len-1;++i)
                    if(root->r->r->l->addr[i])
                    fprintf(fp,"%c",root->r->r->l->addr[i]);
                fprintf(fp,"\"");

                fprintf(fp,"(TApply ");
                printtree(root->l,fp);
                printtree(root->r->r,fp);
                fprintf(fp," )) (TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->r->r->l->len-1;++i)
                    if(root->r->r->l->addr[i])
                    fprintf(fp,"%c",root->r->r->l->addr[i]);
                fprintf(fp,"\" (TApply ");

                printtree(root->r->l,fp);
                printtree(root->r->r,fp);
                fprintf(fp,")))");
                break;
            }
            {
            fprintf(fp,"( PBinPred PROP.REq ");
            printtree(root->l,fp);

            printtree(root->r,fp);
            fprintf(fp," ))");
            }
            break;
        case nt_TEQ:
            #ifdef DBG
                printf("Teq\n");
            #endif
            
            if(root->l == NULL) break;
            if(root->l->len ==0 ) break;
            fprintf(fp,"PBinPred ");
            char *tmp = root->l->addr;

            if(root->len==Teq_tleq){
                fprintf(fp,"PROP.RLe ");
            }
            else if (root->len==Teq_tgeq){
                fprintf(fp,"PROP.RGe ");
            }
            else if (root->len==Teq_tlt){
                fprintf(fp,"PROP.RLt ");
            }
            else if (root->len==Teq_tgt){
                fprintf(fp,"PROP.RGt ");
            }
            else if (root->len==Teq_teq){
                fprintf(fp,"PROP.REq ");
            }
            else if (root->len==Teq_tneq){
                fprintf(fp,"PROP.RNeq ");
            }
            break;
        case others_exps:
            #ifdef DBG
                printf("exps\n");
            #endif
            if(root->l != NULL)
            {
                if(root->l->nodetype >= leaf_gt||root->l->nodetype<=leaf_add)
                {    
                    //fprintf(fp,"(");
                    printtree(root->l,fp);
                    //fprintf(fp,")");
                }
                else printtree(root->l,fp);
            }
            if(root->r != NULL)
            {
                if(root->r->nodetype >= leaf_gt||root->r->nodetype<=leaf_add)
                {  
                //fprintf(fp,"(");
                printtree(root->r,fp);
                //fprintf(fp,")");
                }
                else printtree(root->r,fp);
            }
            break;
        //case expr:
        case leaf_pos_infty:
            #ifdef DBG
                printf("pos_infty\n");
            #endif
            fprintf(fp,"(TInfty TERM.Positive_Infty)");
            break;
        case leaf_neg_infty:
            #ifdef DBG
                printf("pos_infty\n");
            #endif
            fprintf(fp,"(TInfty TERM.Negative_Infty)");
            break;
        case leaf_var:
            #ifdef DBG
                printf("var\n");
            #endif
            if(root == NULL) {break;}
            fprintf(fp,"(TVar \"");
            // printf("%d",root->l->len);
            // printf("%c",root->l->addr[root->l->len-2]);
            // puts(root->addr);

            for(int i = 0;i<root->len-1;++i)
                if(root->addr[i])
                fprintf(fp,"%c",root->addr[i]);
            fprintf(fp,"\" )");
            break;
        case leaf_seq_var:
            #ifdef DBG
                printf("seq_var\n");
            #endif
            if(root == NULL) {break;}
            fprintf(fp,"(TApply (TVar \"");
            // printf("%d",root->l->len);
            // printf("%c",root->l->addr[root->l->len-2]);
            // puts(root->addr);
            fprintf(fp,"%c",root->addr[0]);
            fprintf(fp," \" ) (TVar \"");
            for(int i = 1;i<root->len-1;++i)
                if(root->addr[i])
                fprintf(fp,"%c",root->addr[i]);
            fprintf(fp,"\" ))");
            break;
        case ntl_TPinfty:
        case ntl_TNinfty:
        case ntl_TVAR:
            printtree(root->l,fp);
            break;
        case nt_EXPR:
    
         switch (root->len)
          {case Expr_tvar:
            #ifdef DBG
                printf("expr_var\n");
            #endif
            printtree(root->l,fp);
            break;
          case Expr_tconst:
            #ifdef DBG
                printf("const\n");
            #endif
            fprintf(fp,"(TConst ");
            for(int i = 0;i<root->l->l->len-1;++i)
                if(root->l->l->addr[i])
                fprintf(fp,"%c",root->l->l->addr[i]);
            fprintf(fp,")");
            break;
          case Expr_tnum:
            #ifdef DBG
                printf("numn1\n");
                
            #endif
            
            fprintf(fp,"(TNum ");
            for(int i = 0;i<root->l->l->len-1;++i){
                
                fprintf(fp,"%c",root->l->l->addr[i]);
            }
            fprintf(fp,")");
            
            break;
          case Expr_1L_minus_1R:
            #ifdef DBG
                printf("num\n");
            #endif
            fprintf(fp,"(TUnOp TERM.RNeg (");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_tsqrt_2:
            #ifdef DBG
                printf("sqrt2\n");
            #endif
            fprintf(fp,"(TBinOp TERM.RSqrt (TNum 2)(");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_tsqrt_n:
            #ifdef DBG
                printf("sqrtn\n");
            #endif
            fprintf(fp,"(TBinOp TERM.RSqrt (");
            printtree(root->r,fp);
            fprintf(fp,") (");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_tsin:
            #ifdef DBG
                printf("sin\n");
            #endif
            fprintf(fp,"(TUnOp TERM.RSin (");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_tcos:
            #ifdef DBG
                printf("cos\n");
            #endif
            fprintf(fp,"(TUnOp TERM.RCos (");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_tsup:
            #ifdef DBG
                printf("sup\n");
            #endif
            fprintf(fp,"(TUnOp TERM.RSup (");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_tln:
            #ifdef DBG
                printf("ln\n");
            #endif
            fprintf(fp,"(TUnOp TERM.RLn (");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_abs:
            #ifdef DBG
                printf("abt\n");
            #endif
            fprintf(fp," (TUnOp TERM.RAbs (");
            printtree(root->l,fp);
            fprintf(fp,"))");
            break;
          case Expr_tadd:
            #ifdef DBG
                printf("add\n");
            #endif
            fprintf(fp,"(TBinOp TERM.RPlus\n\t(");
            printtree(root->l,fp);
            fprintf(fp,")\t(");
            printtree(root->r,fp);
            fprintf(fp,"))");
            break;
          case Expr_tminus:
            #ifdef DBG
                printf("minus\n");
            #endif
            fprintf(fp,"(TBinOp TERM.RMinus\n\t(");
            printtree(root->l,fp);
            fprintf(fp,")\t(");
            printtree(root->r,fp);
            fprintf(fp,"))");
            break;
          case Expr_ttimes:
          case Expr_3L_3R_3L_3R:
            #ifdef DBG
                printf("times\n");
            #endif
            fprintf(fp,"(TBinOp TERM.RMult\n\t(");
            printtree(root->l,fp);
            fprintf(fp,")\t(");
            printtree(root->r,fp);
            fprintf(fp,"))");
            break;
          case Expr_tdiv:
            #ifdef DBG
                printf("divv\n");
            #endif
            fprintf(fp,"(TBinOp TERM.RDiv\n\t(");
            printtree(root->l,fp);
            fprintf(fp,")\t(");
            printtree(root->r,fp);
            fprintf(fp,"))");
            break;
          case Expr_1L_1R:
            #ifdef DBG
                printf("brac\n");
            #endif
            fprintf(fp,"(");
            printtree(root->l,fp);
            fprintf(fp,")");
            break;
          case Expr_derivative:
            //#ifdef DBG
                printf("derivative\n");
            //#endif
            exprvar(root->l,lvar);
            printf("exprsucess\n");
            printf("%s",lvar);
            if((var=var_in(lvar))=='0')
            {
                printf("error derivative");
            }
            fprintf(fp,"(TApply (TUnOp TERM.Deri (TBinder TERM.LambdaB \"");
            fprintf(fp,"%c",var);
            fprintf(fp,"\" (");
            printtree(root->l,fp);
            fprintf(fp,"))) (TVar \"");
            fprintf(fp,"%c",var);
            fprintf(fp,"\"))");
            break;
          case Expr_derivative_f:
             //#ifdef DBG
                printf("derivative_f\n");
            //#endif
            fprintf(fp,"(TApply (TUnOp TERM.Deri ");
            printtree(root->l,fp);
            fprintf(fp,")");
            printtree(root->r,fp);
            fprintf(fp,")");           
            break;

          case Expr_tfrac_3L_3R_3L_3R:
            #ifdef DBG
                printf("frac\n");
            #endif
            fprintf(fp,"(TBinOp TERM.RDiv\n\t(");
            printtree(root->l,fp);
            fprintf(fp,")\t(");
            printtree(root->r,fp);
            fprintf(fp,"))");
            break;
          case Expr_lim_head:
            #ifdef DBG
                printf("limit-head expression\n");
            #endif
            if(root->l==NULL)
            {
                printf("Error, no var in limit head");
                break;
            }
            else
            {   if(root->l->len==Lim_head_lim_to_infty)
                // printf("%d",(int)(root->l->nodetype == lim_head));
                {
                fprintf(fp,"(TUnOp TERM.SeqLimit \n");
                fprintf(fp,"(TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->l->l->l->len-1;++i)
                    fprintf(fp,"%c",root->l->l->l->addr[i]);
                
                fprintf(fp,"\"\n");
                // the var binded to '\to \infty'
                fprintf(fp,"(");
                printtree(root->r,fp);
                fprintf(fp,")))\n");
                }
                else
                {
                fprintf(fp,"(TBinOp TERM.RLim \n");
                if(root->l->len == Lim_head_lim_to_Pinfty){
                    fprintf(fp,"(TInfty TERM.Positive_Infty)");
                } else if (root->l->len == Lim_head_lim_to_Ninfty){
                    fprintf(fp,"(TInfty TERM.Negative_Infty)");
                }
                else {
                fprintf(fp,"(");
                printtree(root->l->r,fp);
                fprintf(fp,")");
                }
                fprintf(fp,"(TBinder TERM.LambdaB \"");
                for(int i = 0;i<root->l->l->l->len-1;++i)
                    fprintf(fp,"%c",root->l->l->l->addr[i]);
                
                fprintf(fp,"\"\n");
                // the var binded to '\to \infty'
                fprintf(fp,"(");
                printtree(root->r,fp);
                fprintf(fp,")))\n");
                }
            }
            break;
          case Expr_Lceil_3L_3R_Rceil:
            #ifdef DBG
                printf("ceil expression\n");
            #endif
            fprintf(fp,"TUnOp TERM.ZCeil(");
            printtree(root->l,fp);
            fprintf(fp,")");
            break;
          case Expr_tpower:
            #ifdef DBG
                printf("power expression\n");
            #endif
            if(root->r==NULL || root->r->l==NULL) 
            {
                printf("wrong power expr");
                break;
            }/*
            else if(root->r->l->nodetype != leaf_num && (root->r->l->nodetype != Expr_tnum || root->r->l->nodetype != Expr_tvar)){
                printf("Unbound power expr not supporting now");
                break;
            }*/
            else{
                // int num = 0;
                // for(int i = 0;i<root->l->len-1;++i)
                // {
                //     num *=10;
                //     num += root->l->addr[i] - '0';
                //     printf("%d",num);
                // }
                fprintf(fp,"(TBinOp TERM.RPower\n\t(");
                printtree(root->l,fp);
                fprintf(fp,")\t(");
                printtree(root->r,fp);
                fprintf(fp,"))");
                break;
            }
            break;
          case Expr_tmin:
             #ifdef DBG
                printf("min expression\n");
             #endif
             fprintf(fp,"(");
             fprintf(fp,"TBinOp TERM.RMin(");
             printtree(root->l,fp);
             fprintf(fp,")(");
             printtree(root->r,fp);
             fprintf(fp,"))");
             break;
          case Expr_func:
            #ifdef DBG
                printf("func expression\n");
            #endif
            fprintf(fp,"(TApply ");
            printtree(root->l->l,fp);
            printtree(root->l->r,fp);
            fprintf(fp,")");
            break;
          case Expr_Lfloor_3L_3R_Rfloor:
            #ifdef DBG
                printf("floor expression\n");
            #endif
            fprintf(fp,"TUnOp TERM.ZFloor(");
            printtree(root->l,fp);
            fprintf(fp,")");
            break;
          case Expr_seq_sets:
            #ifdef DBG
                printf("seq_sets expression\n");
            #endif
            fprintf(fp,"(TVar \"");
            fprintf(fp,"%c",root->l->l->addr[0]);
            fprintf(fp,"\")");
            break;
          default:
            break;
          }
          break;
        //end of exprs
        case nt_SINCE_CLAUSE:
            #ifdef DBG
                printf("since\n");
                // printf("%d",root->l->nodetype);
            #endif
            // use since means it's a forward proof step.
            if(root->l == NULL)
                {
                    printf("Strange Since!");
                    break;
                }
            if(root->len == Since_clause_auto_nohint)
                fprintf(fp,"(");
            switch (root->len)
            {

                case Since_clause_knowledge:
                    since_cache = root;
                    //fprintf(fp,"( line %d-%d) ",lineNumber,lineEnd);
                    
                    fprintf(fp,"PrPoseWithoutProof %d %d \n\t",lineNumber,lineEnd);
                    printtree(root->l,fp);
                    fprintf(fp,"\n");
                    printtree(root->r,fp);
                    break;
                case Since_clause_because:
                    since_cache = root;
                    fprintf(fp,"PrPoseWithoutProof %d %d (PROOF.FCausalInfer (\n\t",lineNumber,lineEnd);
                    
                    printtree(root->l,fp);
                    
                    fprintf(fp,")) \n\t");
                    
                    break;
                case Since_clause_math_equation:
                    since_cache = root; 
                    //With a detailed equation, possiably proved.
                    //fprintf(fp,"( line %d-%d) ",lineNumber,lineEnd);
                    
                    fprintf(fp,"PrPoseAndProve %d %d \n\t",lineNumber,lineEnd);
                    printtree(root->l,fp);
                    fprintf(fp,"\n");
                    printtree(root->r,fp);
                    break;
                case Since_clause_tnum:
                    since_cache = root; 
                    //fprintf(fp,"( line %d-%d",lineNumber,lineEnd);
                    
                    fprintf(fp,"PrPoseWithoutProof %d %d \n\t",lineNumber,lineEnd);
                    fprintf(fp,"\"___hyp");
                    for(int i = 0;i<root->l->l->len-1;++i)
                        fprintf(fp,"%c",root->l->l->addr[i]);
                    fprintf(fp,"\"\n");
                    printtree(root->r,fp);
                    break;
                case Since_clause_auto_nohint:
                    //don't affect since_cache
                    //fprintf(fp,"( line %d-%d ) ",lineNumber,lineEnd);
                    
                    fprintf(fp,"PrPoseWithoutProof %d %d PROOF.FNoHint\n\t",lineNumber,lineEnd);
                    // fprintf(fp,"(");
                    // printtree(root->r,fp);
                    // fprintf(fp,")");
                    // all empty.
                    break;
                case Since_clause_trans:
                    fprintf(fp,"PrPoseWithoutProof %d %d (PROOF.FEquTrans \"",lineNumber,lineEnd);
                    for(int i = 0;i<root->l->l->len-1;++i)
                      //if(root->l->l->addr[i])
                      fprintf(fp,"%c",root->l->l->addr[i]);
                   fprintf(fp,"\" ) \n\t");
                   break;
                case Since_clause_BothDeri:
                    fprintf(fp,"PrPoseWithoutProof %d %d (PROOF.FDeriBothTerms ( None )) \n\t ",lineNumber,lineEnd);          
                    break;
                case Since_clause_BothDeri_var:
                    fprintf(fp,"PrPoseWithoutProof %d %d (PROOF.FDeriBothTerms ( Some \"",lineNumber,lineEnd);    
                     for(int i = 0;i<root->l->l->len-1;++i)
                      //if(root->l->l->addr[i])
                      fprintf(fp,"%c",root->l->l->addr[i]);
                    fprintf (fp,"\" )) \n\t");
                    break;
                
                case Since_clause_same:
                    
                    if(since_cache == NULL)
                    {
                        printf("Error: Nothing remembered before. Maybe you used '同理' at the beginning");
                        break;
                    }
                    else{
                        
                        //remembered
                        switch (since_cache->len)
                        {
                            case Since_clause_knowledge:
                                fprintf(fp,"PrPoseWithoutProof %d ",lineNumber);
                                //fprintf(fp,"( line %d-",lineNumber);
                                if(root->lineNum != NULL){
                                    printtree(root->lineNum,fp);
                                }
                                else {
                                    printf("can't find lineNumber in same_knowledge");
                                    break;
                                }
                                fprintf(fp,"\n\t");
                                printtree(since_cache->l,fp);
                                fprintf(fp,"\n");
                                printtree(since_cache->r,fp);
                                break;
                            case Since_clause_math_equation:  
                                fprintf(fp,"PrPoseAndProve %d ",lineNumber);
                                //fprintf(fp,"( line %d-",lineNumber);
                                if(root->lineNum != NULL){
                                    printtree(root->lineNum,fp);
                                }
                                else {
                                    printf("can't find lineNumber in math_equation");
                                    break;
                                }
                                fprintf(fp,"\n\t");
                                printtree(since_cache->l,fp);
                                fprintf(fp,"\n");
                                printtree(since_cache->r,fp);
                                break;
                            case Since_clause_tnum:   
                                fprintf(fp,"PrPoseWithoutProof %d ",lineNumber);
                                //fprintf(fp,"( line %d-",lineNumber);
                                if(root->lineNum != NULL){
                                    printtree(root->lineNum,fp);
                                }
                                else {
                                    printf("can't find lineNumber in tnum");
                                    break;
                                }
                                fprintf(fp,"\n\t");
                                fprintf(fp,"\"___hyp");
                                for(int i = 0;i<since_cache->l->l->len-1;++i)
                                    fprintf(fp,"%c",since_cache->l->l->addr[i]);
                                fprintf(fp,"\"\n");
                                printtree(since_cache->r,fp);
                                break;
                            default:
                                break;
                        }
                        break;
                    }
                default:
                    break;
            }
            if(root->len == Since_clause_auto_nohint)
                fprintf(fp,")");
            break;
        case nt_KNOWLEDGE:
            #ifdef DBG
                printf("knowledge\n");
            #endif
            {
                switch (root->len)
                {
                    case Knowledge_KASaverage:
                    fprintf(fp,"PROOF.FASAverage");
                    break;
                    case Knowledge_KSGaverage:
                    fprintf(fp,"PROOF.FSGAverage");
                    break;
                    case Knowledge_KAGaverage:
                    fprintf(fp,"PROOF.FAGAverage");
                    break;
                    case Knowledge_FSqueeze:
                    fprintf(fp,"PROOF.FSqueezeTheorem");
                    break;
                    case Knowledge_Supre_def:
                    fprintf(fp,"(PROOF.FDefinition PROOF.Supremum)");
                    break;
                    case Knowledge_Lim_def:
                    fprintf(fp,"(PROOF.FDefinition PROOF.SeqLimit)");
                    break;
                    case Knowledge_Supre_the :
                    fprintf(fp,"(PROOF.FTheorem PROOF.SupremumAndInfimum nil)");
                    break;
                    case Knowledge_Math1:
                    case Knowledge_Math2:
                    printtree(root->l,fp);
                    break;
                default:
                    break;
                }
                break;
            }
        case others_remember:
            //left: math_equation
            //right : memory_term
            // memory_term : [ Tnum ]  
            // “记作[1]”
            // to help use hypothesis and do apply in the future
            #ifdef DBG
                printf("remember\n");
            #endif
                printtree(root->l,fp);
            break;
        case nt_ACTION:
            #ifdef DBG
                printf("action\n");
            #endif
            if(root->l == NULL)
            {
                printf("empty action");
                break;
            }
            switch (root->len)
            {
            case Action_eqs_equnadd:
                fprintf(fp," (PROOF.FAddEqn [");
                printtree(root->r,fp);
                fprintf(fp," ])");
                break;
            case Action_auto_conc:
                fprintf(fp," PROOF.FNoHint");
                break;
            // more in the future.
            
            default:
                break;
            }
            break;
        case nt_EQS:
            #ifdef DBG
                printf("memory_list\n");
            #endif
            printtree(root->l,fp);
            if(root->r!=NULL)
            {
                fprintf(fp," ; ");
                printtree(root->r,fp);
            }
            break;
            
        case nt_MEMORY_TERM:
            #ifdef DBG
                printf("memory_term\n");
            #endif
            fprintf(fp,"\"___hyp");
            //minus 1, cause starting from 0
            for(int i = 0;i<root->l->l->len-2;++i)
                fprintf(fp,"%c",root->l->l->addr[i]);
            if(root->l->l->len >1)
                fprintf(fp,"%c",root->l->l->addr[root->l->l->len-2]-1);
            fprintf(fp,"\"");
            break;
        case leaf_line:
           #ifdef DBG
                printf("leaf_line\n");
           #endif
           printf("get leaf_line");
           lineNumber = strToNum(root->addr);
           fprintf(fp," %d ",lineNumber-1);
           break;

        


        
        default:
            break;
            
    }
    
    
}





void exprvar(struct ast *root, char *s){
    if(root->nodetype==leaf_var){   
      char *newstr = strncat(s,root->addr,root->len);   
      s = newstr;  
      return; 
    }
    if(root->l!=NULL){
    exprvar(root->l,s);
    
  }
 
  if(root->r!=NULL){
    exprvar(root->r,s);
    
  }

  return;
}

char var_in(char *s){
    int len = strlen(s);
    for(int i =0;i<len;i++){
        if(s[i]=='x')
        {
            s =NULL;
            return 'x';
        }
    }
    for(int i =0;i<len;i++){
        if(s[i]=='y')
        {
            s =NULL;
            return 'y';
        }
    }
    for(int i =0;i<len;i++){
        if(s[i]=='z')
        {
            s =NULL;
            return 'z';
        }
    }
    s =NULL;
    return 'o';
}

int strToNum(char *str)
{
	if (str == NULL)
        return -1;
	if(str==NULL)
		return 0;

	int tmp=0;
	while(*str !='.')
	{
		tmp=tmp*10+(*str -'0');//获得数字并“叠加”
		str++;
	}
    //printf("get strtoNum");
	return tmp;
}

void add_lineNum(char fileName[], char tempFileName[], FILE *fp)
{
  int cnt = 0;
  char s1[1500], s2[1550];
  FILE *fp1, *fp2;
  fp1 = fopen(fileName, "r");
  if (fp1 != NULL){
	fp2 = fopen(tempFileName, "w");
	while (!feof(fp1)){
	  if (fgets(s1, sizeof(s1) - 1, fp1) == NULL) continue;
      if (s1[0] == '\n' || s1[0] == '\r') continue;
	  sprintf(s2, "%d. %s", ++cnt, s1);
	  fputs(s2, fp2);
	}
	fclose(fp1);
    fclose(fp2);
  }
}
