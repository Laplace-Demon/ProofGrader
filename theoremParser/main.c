#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#include "cjson/cJSON.h"
#include "M.tab.h"
#include "flex.h"
#include "func.h"

int theoremsNumber;
const char* entryName[] = {"theoremFormat", "theoremContent", "saturationAllowed", "verificationAllowed", "singleStepVerification", "explicitReference", "multipleStepVerification", "automationRule", "keyWords"};
struct Theorem {
    char* theoremName;
    char* theoremFormat;
    char* theoremContent;
	bool saturationAllowed, verificationAllowed, singleStepVerification, explicitReference, multipleStepVerification;
    char** keyWords;
    int keyWordsNumber;
} theorems[1000];

cJSON *getJsonObject(FILE *file) {
    fseek(file, 0, SEEK_END);
    int fileLength = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *jsonRaw = malloc (sizeof(char) * (fileLength + 1));
    int i;
    char c;
    for (i = 0; i < fileLength && (c = fgetc(file)) != EOF; ++i) jsonRaw[i] = c;
    jsonRaw[i] = '\0';
    fclose(file);

    cJSON *json = cJSON_ParseWithLength(jsonRaw, fileLength + 1);
    free(jsonRaw);

    if (json == NULL) {
        const char *error_ptr = cJSON_GetErrorPtr();
        printf("%s\n", error_ptr);
        printf("Failed to read json object.\n");
        exit(1);
    }

    printf("Successfully read json object.\n");
    return json;
}

void errorParsingEntry(char* entryName, char* theoremName) {
    printf("Error encountered when parsing entry %s of theorem %s.\n", entryName, theoremName);
    exit(1);
}

struct Theorem parseTheorem(cJSON *json) {
    struct Theorem theorem;
    theorem.theoremName = json->string;
    for (cJSON* entry = json->child; entry != NULL; entry = entry->next) {
        if (strcmp(entry->string, entryName[0]) == 0) {
            if (!cJSON_IsString(entry)) errorParsingEntry(entry->string, json->string);
            strcpy(theorem.theoremFormat, entry->valuestring);
        }
        else if (strcmp(entry->string, entryName[1]) == 0) {
            if (!cJSON_IsString(entry)) errorParsingEntry(entry->string, json->string);
            theorem.theoremContent = entry->valuestring;
        }
        else if (strcmp(entry->string, entryName[2]) == 0) {
            if (!cJSON_IsBool(entry)) errorParsingEntry(entry->string, json->string);
            theorem.saturationAllowed = cJSON_IsTrue(entry);
        }
        else if (strcmp(entry->string, entryName[3]) == 0) {
            if (!cJSON_IsBool(entry)) errorParsingEntry(entry->string, json->string);
            theorem.verificationAllowed = cJSON_IsTrue(entry);
        }
        else if (strcmp(entry->string, entryName[4]) == 0) {
            if (!cJSON_IsBool(entry)) errorParsingEntry(entry->string, json->string);
            theorem.singleStepVerification = cJSON_IsTrue(entry);
        }
        else if (strcmp(entry->string, entryName[5]) == 0) {
            if (!cJSON_IsBool(entry)) errorParsingEntry(entry->string, json->string);
            theorem.explicitReference = cJSON_IsTrue(entry);
        }
        else if (strcmp(entry->string, entryName[6]) == 0) {
            if (!cJSON_IsBool(entry)) errorParsingEntry(entry->string, json->string);
            theorem.multipleStepVerification = cJSON_IsTrue(entry);
        }
        else if (strcmp(entry->string, entryName[7]) == 0) {
            if (!cJSON_IsObject(entry)) errorParsingEntry(entry->string, json->string);
            for (cJSON* rulePair = entry->child; rulePair != NULL; rulePair = rulePair->next) {
                
            }
        }
        else if (strcmp(entry->string, entryName[8]) == 0) {
            if (!cJSON_IsArray(entry)) errorParsingEntry(entry->string, json->string);
            int cnt = 0;
            for (cJSON* keyWord = entry->child; keyWord != NULL; keyWord = keyWord->next, cnt++) {
                if (!cJSON_IsString(keyWord)) errorParsingEntry(entry->string, json->string);
            }
            theorem.keyWords = malloc(cnt * sizeof (char*));
            theorem.keyWordsNumber = cnt;
            cnt = 0;
            for (cJSON* keyWord = entry->child; keyWord != NULL; keyWord = keyWord->next, cnt++) {
                theorem.keyWords[cnt] = malloc((strlen(keyWord->valuestring) + 1) * sizeof (char));
                strcpy(theorem.keyWords[cnt], keyWord->valuestring);
            }
        }
    }
    return theorem;
}

void parseJson(cJSON *json) {
    for (cJSON* theorem = json->child; theorem != NULL; theorem = theorem->next, theoremsNumber++) {
        theorems[theoremsNumber] = parseTheorem(theorem);
    }
}

void printHeader(FILE *file) {
    fprintf(file, "From lib.lib Require Import ExplicitName.\n");
    fprintf(file, "From lib.lib Require Import Lang.\n\n");
    fprintf(file, "Require Import String.\n");
    fprintf(file, "Require Import ZArith.\n");
    fprintf(file, "Require Import List.\n");
    fprintf(file, "Local Open Scope Z.\n");
    fprintf(file, "Local Open Scope string.\n");
    fprintf(file, "Local Open Scope list.\n\n");
    fprintf(file, "(* Definitions *)\n");
    fprintf(file, "Definition theorem : Type := (list prop_pattern) * prop_pattern.\n\n");
}

void convertAndPrintToCoq(FILE *file) {
    printHeader(file);
    
    for (int i = 0; i < theoremsNumber; ++i) {
        int parseStatus;
        YY_BUFFER_STATE bp;
        bp = yy_scan_string(theorems[i].theoremContent);
        yy_switch_to_buffer(bp);

        parseStatus = yyparse();
        printf("\n");
        if (parseStatus) printf("Parsing failed for theorem %s.\n", theorems[i].theoremName);
        else {
            printf("Parsing succeeded for theorem %s.\n", theorems[i].theoremName);
            extern struct AstNode* root;
            fprintf(file, "Definition %s: theorem :=\n", theorems[i].theoremName);
            transformAndPrint(root, file);
            fprintf(file, ".\n\n");
        }

        yy_delete_buffer(bp);
    }

    fclose(file);
    printf("Successfully print to Coq.\n");
}

int main(int argc, char **argv) {
    struct Theorem* theorems;
    char inputFileName[1024] = "../config/theorems.json", outputFileName[1024] = "../lib/TestTheorems.v";
    if (argc >= 2) {
        printf("Input file name is manually designated.\n");
        strcpy(inputFileName, argv[1]);
    }
    if (argc >= 3) {
        printf("Output file name is manually designated.\n");
        strcpy(outputFileName, argv[2]);
    }

    FILE *inputFile;
    inputFile = fopen(inputFileName, "rb");
    if (inputFile == NULL) {
        printf("File %s can not be opened.\n", inputFileName);
        exit(1);
    }

    cJSON *json = getJsonObject(inputFile);
    printf("\n");
    parseJson(json);

    FILE *outputFile;
    outputFile = fopen(outputFileName, "wb");
    convertAndPrintToCoq(outputFile);

    cJSON_Delete(json);

    return 0;
}
