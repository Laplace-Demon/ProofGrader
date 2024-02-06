#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#include "cjson/cJSON.h"
#include "M.tab.h"
#include "flex.h"
#include "func.h"

int theoremNumber = 0;
const char* entryName[] = {"theoremFormat", "theoremContent", "saturationAllowed", "verificationAllowed", "singleStepVerification", "explicitReference", "multipleStepVerification", "automationRule", "categories"};
struct Theorem {
    char* theoremName;
    char* theoremFormat;
    char* theoremContent;
	bool saturationAllowed, verificationAllowed, singleStepVerification, explicitReference, multipleStepVerification;
    char** categories;
    int categoryNumber;
} theorems[1000];

int categoryNumber = 0;
struct Category {
    int theoremNumber, cnt;
    char* categoryName;
    char** theoremNames;
} categories[1000];

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
            theorem.categories = malloc(cnt * sizeof (char*));
            theorem.categoryNumber = cnt;
            cnt = 0;
            for (cJSON* keyWord = entry->child; keyWord != NULL; keyWord = keyWord->next, cnt++) {
                theorem.categories[cnt] = malloc((strlen(keyWord->valuestring) + 1) * sizeof (char));
                strcpy(theorem.categories[cnt], keyWord->valuestring);
                int pos;
                for (pos = 0; pos < categoryNumber; ++pos) {
                    if (strcmp(theorem.categories[cnt], categories[pos].categoryName) == 0) {
                        categories[pos].theoremNumber += 1;
                        break;
                    }
                }
                if (pos == categoryNumber) {
                    categoryNumber += 1;
                    categories[pos].categoryName = malloc((strlen(keyWord->valuestring) + 1) * sizeof (char));
                    strcpy(categories[pos].categoryName, keyWord->valuestring);
                    categories[pos].theoremNumber = 1;
                }
            }
        }
    }
    return theorem;
}

void parseJson(cJSON *json) {
    for (cJSON* theorem = json->child; theorem != NULL; theorem = theorem->next, theoremNumber++) {
        theorems[theoremNumber] = parseTheorem(theorem);
    }
    for (int i = 0; i < categoryNumber; ++i) {
        categories[i].theoremNames = malloc(categories[i].theoremNumber * sizeof (char*));
        categories[i].cnt = 0;
        printf("%d\n", categories[i].theoremNumber);
    }
    for (int i = 0; i < theoremNumber; ++i) {
        for (int j = 0; j < theorems[i].categoryNumber; ++j) {
            for (int pos = 0; pos < categoryNumber; ++pos) {
                if (strcmp(categories[pos].categoryName, theorems[i].categories[j]) == 0) {
                    categories[pos].theoremNames[categories[pos].cnt] = malloc((strlen(theorems[i].theoremName) + 1) * sizeof (char));
                    strcpy(categories[pos].theoremNames[categories[pos].cnt], theorems[i].theoremName);
                    categories[pos].cnt += 1;
                }
            }
        }
    }
}

void printHeader(FILE *file) {
    fprintf(file, "From lib Require Import ExplicitName.\n");
    fprintf(file, "From lib Require Import Lang.\n");
    fprintf(file, "Require Import String.\n");
    fprintf(file, "Require Import ZArith.\n");
    fprintf(file, "Require Import List.\n");
    fprintf(file, "Local Open Scope Z.\n");
    fprintf(file, "Local Open Scope string.\n");
    fprintf(file, "Local Open Scope list.\n\n");
    fprintf(file, "(* Definitions *)\n\n");
    fprintf(file, "Definition theorem : Type := (list prop_pattern) * prop_pattern.\n\n");
}

void printTail(FILE *file) {
    for (int i = 0; i < categoryNumber; ++i) {
        fprintf(file, "Definition %s: list theorem :=", categories[i].categoryName);
        for (int j = 0; j < categories[i].theoremNumber; ++j) {
            fprintf(file, " %s ::", categories[i].theoremNames[j]);
        }
        fprintf(file, " nil.\n\n");
    }
    fprintf(file, "Definition all_theorems: list theorem :=");
    for (int i = 0; i < categoryNumber - 1; ++i) {
        fprintf(file, " %s ++", categories[i].categoryName);
    }
    fprintf(file, " %s.\n\n", categories[categoryNumber - 1].categoryName);
}

void convertAndPrintToCoq(FILE *file) {
    printHeader(file);
    
    for (int i = 0; i < theoremNumber; ++i) {
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

    printTail(file);

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

    fflush(stdout);

    return 0;
}
