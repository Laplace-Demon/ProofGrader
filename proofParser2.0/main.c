#include <stdio.h>
#include <string.h>
#include "M.tab.h"
#include "flex.h"
#include "func.h"
int action_stack = 0; 

int main(int argc, char **argv) {
    
	char inputFileName[1024] = "mathProof.md";
	if(argc == 2)
	{
		printf("Manual decided input file.\n");
		strcpy(inputFileName, argv[1]);
	}
	 
	FILE *fp; // = the file in.
	fp = fopen(inputFileName, "rb");
	if (fp == NULL)
	{
		printf("File %s can't be opened.\n", inputFileName);
		exit(1);
	}

	char tempFileName[1024];
	strcpy(tempFileName, inputFileName);
	int len = strlen(tempFileName);
	tempFileName[len - 2] = 't';
	tempFileName[len - 1] = 'm';
	tempFileName[len] = 'p';
	tempFileName[len + 1] = '\0';

	add_lineNum(inputFileName, tempFileName, fp);
	FILE *tfp = fopen(tempFileName, "r");
	yyin = tfp;
	yyparse();

	printf("\n PARSING FINISHED. \n");
    
	if (argc == 1) fp = fopen("coqProof.v","w");
	else if (argc == 2)
	{
		inputFileName[strlen(inputFileName)-2] = 'v';
		inputFileName[strlen(inputFileName)-1] = '\0';
		const char* output_file = inputFileName;
		fp = fopen(output_file,"w");
	}
	fprintf(fp,"From lib Require Import ExplicitName.\nFrom lib Require Import Lang.\nFrom lib Require Import Poly.\nFrom lib Require Import Solver.\nFrom lib Require Import Elaborator.\nFrom lib Require Import Checker.\nRequire Import String.\nRequire Import ZArith.\nRequire Import List.\nLocal Open Scope Z.\nLocal Open Scope string.\nLocal Open Scope list.\nImport ListNotations.\n");
	extern struct ast* root;
    
	printtree(root, fp);
	

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
    fprintf(fp,"Definition check_result := fst (check_rec' pg' pr').\n");
    fprintf(fp,"Compute check_result.\n");
	
	

	fprintf(fp,"End ProofGoal.\n");	

	fclose(fp);
	fclose(tfp);
	remove(tempFileName);
}
