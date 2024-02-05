#include <stdio.h>
#include <string.h>
#include "M.tab.h"
#include "flex.h"
#include "func.h"
int action_stack = 0; 

int main(int argc, char **argv) {
    
	add_lineNum();
	char s[80] = "mathProof.md";
	if(argc == 2)
	{
		printf("manual decided input file\n");
		strcpy(s,argv[1]);
	}
	 
	FILE *fp; // = the file in.
	fp=fopen(s, "rb");
	if (fp == NULL)
	{
		printf("File %s can't be opened.\n", s);
		exit(1);
	}
	else 
	{
		yyin = fp;
	}
	yyparse();

	printf("\n PARSING FINISHED. \n");
    
	if(argc == 1)
    	fp=fopen("coqProof.v","w");
	else if (argc == 2)
	{
		s[strlen(s)-2] = 'v';
		s[strlen(s)-1] = '\0';
		const char* output_file = s;
		fp = fopen(output_file,"w");
	}
	fprintf(fp,"From lib Require Import ExplicitName.\nFrom lib Require Import Lang.\nFrom lib Require Import Poly.\nFrom lib Require Import Solver.\nFrom lib Require Import Elaborator.\nFrom lib Require Import Checker.\nRequire Import String.\nRequire Import ZArith.\nRequire Import List.\nLocal Open Scope Z.\nLocal Open Scope string.\nLocal Open Scope list.\nImport ListNotations.\n");
	extern struct ast* root;
    
	printtree(root,fp);
	

	/*while(action_stack--){
                fprintf(fp,")");
            }*/
	fprintf(fp,".\n\n");
	fprintf(fp,"\n");
	fprintf(fp,"Definition assum := get_assum premise nil.\n");
    fprintf(fp,"Definition pg := {| assu := assum; concl := stmt; cont := nil|}.\n");

    fprintf(fp,"Definition temp := elaboration pg pr.\n");
	fprintf(fp,"Definition pg' := fst temp.\n");
	fprintf(fp,"Definition pr':=snd temp.\n");
    fprintf(fp,"Definition check_result := fst (check_rec'_show_pg_res pg' pr' 1000).\n");
    fprintf(fp,"Compute check_result.\n");
	
	

	fprintf(fp,"End Goal001.\n");	

	fclose(fp);
}
