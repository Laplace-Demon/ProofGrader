#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "func.h"

struct Assumptions {
    struct AstNode *assumption;
    struct Assumptions *next;
};

struct Theorem {
    struct Assumptions *assumptions;
    struct AstNode *conclusion;
};

struct AstNode *createNumberNode(int number) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = NUMBER;
    node->data.number.number = number;
    return node;
}

struct AstNode *createConstNode(Constant constant) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = CONSTANT;
    node->data.constant.type = constant;
    return node;
}

struct AstNode *createVariableNode(char *identifier) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = VARIABLE;
    node->data.variable.identifier = identifier;
    node->data.variable.pattern = 0;
    return node;
}

struct AstNode *createBinaryOpNode(BinaryOperator operator, struct AstNode *left, struct AstNode *right) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = BINARYOP;
    node->data.binaryOp.operator = operator;
    node->data.binaryOp.left = left;
    node->data.binaryOp.right = right;
    return node;
}

struct AstNode *createUnaryOpNode(UnaryOperator operator, struct AstNode *operand) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = UNARYOP;
    node->data.unaryOp.operator = operator;
    node->data.unaryOp.operand = operand;
    return node;
}

struct AstNode *createInftyNode(Infinity infinity) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = INFINITY;
    node->data.infinity.type = infinity;
    return node;
}

struct AstNode *createLimitNode(struct LimitHeadNode *head, struct AstNode* body) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = LIMIT;
    node->data.limit.head = head;
    node->data.limit.body = body;
    return node;
}

struct AstNode *createFunctionNode(char *function, struct AstNode *operand) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = FUNCTION;
    node->data.function.function = createVariableNode(function);
    node->data.function.operand = operand;
    return node;
}

struct LimitHeadNode *createLimitHeadNode(char *var, struct AstNode *val) {
    struct LimitHeadNode* node = (struct LimitHeadNode*)malloc(sizeof(struct LimitHeadNode));
    if (!node) exit(EXIT_FAILURE);

    node->var = var;
    node->val = val;
    return node;
}

struct QuantifierNode *createQuantifierNode(Quantifier quant, char *var) {
    struct QuantifierNode* node = (struct QuantifierNode*)malloc(sizeof(struct QuantifierNode));
    if (!node) exit(EXIT_FAILURE);

    node->quant = quant;
    node->type = VAR;
    node->data.var = var;
    return node;
}

struct QuantifierNode *createPropQuantifierNode(Quantifier quant, struct AstNode *prop) {
    struct QuantifierNode* node = (struct QuantifierNode*)malloc(sizeof(struct QuantifierNode));
    if (!node) exit(EXIT_FAILURE);

    node->quant = quant;
    node->type = PROP;
    node->data.prop = prop;
    return node;
}

struct AstNode *createUnaryPredNode(UnaryPredicate predicate, struct AstNode *left) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = UNARYPRED;
    node->data.unaryPred.unaryPred = predicate;
    node->data.unaryPred.left = left;
    return node;
}

struct AstNode *createBinaryPredNode(BinaryPredicate predicate, struct AstNode *left, struct AstNode *right) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = BINARYPRED;
    node->data.binaryPred.binaryPred = predicate;
    node->data.binaryPred.left = left;
    node->data.binaryPred.right = right;
    return node;
}

struct AstNode *createQuantifiedPropNode(struct QuantifierNode *quantHead, struct AstNode *body) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = QUANTIFIEDPROP;
    node->data.quantifiedProp.quantHead = quantHead;
    node->data.quantifiedProp.body = body;
    return node;
}

struct AstNode *createBinaryConNode(BinaryConnective connective, struct AstNode *left, struct AstNode *right) {
    struct AstNode* node = (struct AstNode*)malloc(sizeof(struct AstNode));
    if (!node) exit(EXIT_FAILURE);

    node->type = BINARYCON;
    node->data.binaryCon.binaryCon = connective;
    node->data.binaryCon.left = left;
    node->data.binaryCon.right = right;
    return node;
}

struct AstNode *patternIntro(struct AstNode *root, char *var) {
    if (root == NULL) return root;
    switch (root->type) {
        case NUMBER: {
            return root;
            break;
        }
        case CONSTANT: {
            return root;
            break;
        }
        case VARIABLE: {
            if (strcmp(var, root->data.variable.identifier) == 0) root->data.variable.pattern = 1;
            return root;
            break;
        }
        case BINARYOP: {
            root->data.binaryOp.left = patternIntro(root->data.binaryOp.left, var);
            root->data.binaryOp.right = patternIntro(root->data.binaryOp.right, var);
            return root;
            break;
        }
        case UNARYOP: {
            root->data.unaryOp.operand = patternIntro(root->data.unaryOp.operand, var);
            return root;
            break;
        }
        case INFINITY: {
            return root;
            break;
        }
        case LIMIT: {
            root->data.limit.head->val = patternIntro(root->data.limit.head->val, var);
            root->data.limit.body = patternIntro(root->data.limit.body, var);
            return root;
            break;
        }
        case FUNCTION: {
            root->data.function.function = patternIntro(root->data.function.function, var);
            root->data.function.operand = patternIntro(root->data.function.operand, var);
            return root;
            break;
        }
        case UNARYPRED: {
            root->data.unaryPred.left = patternIntro(root->data.unaryPred.left, var);
            return root;
            break;
        }
        case BINARYPRED: {
            root->data.binaryPred.left = patternIntro(root->data.binaryPred.left, var);
            root->data.binaryPred.right = patternIntro(root->data.binaryPred.right, var);
            return root;
            break;
        }
        case QUANTIFIEDPROP: {
            if (root->data.quantifiedProp.quantHead->type == PROP) root->data.quantifiedProp.quantHead->data.prop = patternIntro(root->data.quantifiedProp.quantHead->data.prop, var);
            root->data.quantifiedProp.body = patternIntro(root->data.quantifiedProp.body, var);
            return root;
            break;
        }
        case BINARYCON: {
            root->data.binaryCon.left = patternIntro(root->data.binaryCon.left, var);
            root->data.binaryCon.right = patternIntro(root->data.binaryCon.right, var);
            return root;
            break;
        }
    }
}

struct AstNode *patternsIntro(struct AstNode *root) {
    while (root->type == QUANTIFIEDPROP && root->data.quantifiedProp.quantHead->type == VAR) {
        char *temp = root->data.quantifiedProp.quantHead->data.var;
        root = patternIntro(root->data.quantifiedProp.body, temp);
    }
    return root;
}

char *getFirstVariable(struct AstNode *root) {
    if (root == NULL) return NULL;
    switch (root->type) {
        case VARIABLE: {
            return root->data.variable.identifier;
            break;
        }
        case BINARYPRED: {
            return getFirstVariable(root->data.binaryPred.left);
            break;
        }
        default: {
            return NULL;
        }
    }
}

void printAstNode(struct AstNode *root, FILE *file) {
    if (root == NULL) return;
    switch (root->type) {
        case NUMBER: {
            fprintf(file, "(TPNum %d) ", root->data.number.number);
            break;
        }
        case CONSTANT: {
            if (root->data.constant.type == PI) fprintf(file, "(TPConst TERM.RPi) ");
            else if (root->data.constant.type == E) fprintf(file, "(TPConst TERM.RE) ");
            break;
        }
        case VARIABLE: {
            if (root->data.variable.pattern == 0) fprintf(file, "(TPVar \"%s\") ", root->data.variable.identifier);
            else fprintf(file, "(TPTVar \"%s\") ", root->data.variable.identifier);
            break;
        }
        case BINARYOP: {
            switch (root->data.binaryOp.operator) {
                case ADD: {
                    fprintf(file, "(TPBinOp TERM.RPlus ");
                    break;
                }
                case MINUS: {
                    fprintf(file, "(TPBinOp TERM.RMinus ");
                    break;
                }
                case TIME: {
                    fprintf(file, "(TPBinOp TERM.RMult ");
                    break;
                }
                case DIV: {
                    fprintf(file, "(TPBinOp TERM.RDiv ");
                    break;
                }
                case POWER: {
                    fprintf(file, "(TPBinOp TERM.RPower ");
                    break;
                }
            }
            printAstNode(root->data.binaryOp.left, file);
            fprintf(file, " ");
            printAstNode(root->data.binaryOp.right, file);
            fprintf(file, ") ");
            break;
        }
        case UNARYOP: {
            switch (root->data.unaryOp.operator) {
                case SUP: {
                    fprintf(file, "(TPUnOp TERM.RSup ");
                    break;
                }
                case SIN: {
                    fprintf(file, "(TPUnOp TERM.RSin ");
                    break;
                }
                case COS: {
                    fprintf(file, "(TPUnOp TERM.RCos ");
                    break;
                }
                case ABS: {
                    fprintf(file, "(TPUnOp TERM.RAbs ");
                    break;
                }
                case CEIL: {
                    fprintf(file, "(TPUnOp TERM.ZCeil " );
                    break;
                }
                case FLOOR: {
                    fprintf(file, "(TPUnOp TERM.ZFloor ");
                    break;
                }
            }
            printAstNode(root->data.unaryOp.operand, file);
            fprintf(file, ") ");
            break;
        }
        case INFINITY: {
            if (root->data.infinity.type == N_INFTY) fprintf(file, "(TPInfty TERM.Negative_Infty) ");
            else fprintf(file, "(TPInfty TERM.Positive_Infty) ");
            break;
        }
        case LIMIT: {
            fprintf(file, "(TPBinOp TERM.RLim ");
            printAstNode(root->data.limit.head->val, file);
            fprintf(file, "(TPBinder TERM.LambdaB \"%s\" ", root->data.limit.head->var);
            printAstNode(root->data.limit.body, file);
            fprintf(file, ")) ");
            break;
        }
        case FUNCTION: {
            fprintf(file, "(TPApply ");
            printAstNode(root->data.function.function, file);
            fprintf(file, " ");
            printAstNode(root->data.function.operand, file);
            fprintf(file, ") ");
            break;
        }
        case UNARYPRED: {
            switch (root->data.unaryPred.unaryPred) {
                case CONTINUE: {
                    fprintf(file, "(PPUnPred PROP.Continue ");
                    break;
                }
                case UNICONTINUE: {
                    fprintf(file, "(PPUnPred PROP.UContinue ");
                    break;
                }
                case BOUNDEDABOVE: {
                    fprintf(file, "(PPUnPred PROP.BoundedAbove ");
                    break;
                }
                case MONOINC: {
                    fprintf(file, "(PPUnPred PROP.MonoInc ");
                    break;
                }
                case BOUNDED: {
                    fprintf(file, "(PPUnPred PROP.Bounded ");
                    break;
                }
                case CAUCHYSEQ: {
                    fprintf(file, "(PPUnPred PROP.CauchySeq ");
                    break;
                }
            }
            printAstNode(root->data.unaryPred.left, file);
            fprintf(file, ") ");
            break;
        }
        case BINARYPRED: {
            switch (root->data.binaryPred.binaryPred) {
                case EQ: {
                    fprintf(file, "(PPBinPred PROP.REq ");
                    break;
                }
                case LEQ: {
                    fprintf(file, "(PPBinPred PROP.RLe ");
                    break;
                }
                case GEQ: {
                    fprintf(file, "(PPBinPred PROP.RGe ");
                    break;
                }
                case LT: {
                    fprintf(file, "(PPBinPred PROP.RLt ");
                    break;
                }
                case GT: {
                    fprintf(file, "(PPBinPred PROP.RGt ");
                    break;
                }
                case NEQ: {
                    fprintf(file, "(PPBinPred PROP.RNeq ");
                    break;
                }
                case CONTINUEON: {
                    fprintf(file, "(PPBinPred PROP.ContinueOn ");
                    break;
                }
                case UNICONTINUEON: {
                    fprintf(file, "(PPBinPred PROP.UContinueOn ");
                    break;
                }
                case IN: {
                    fprintf(file, "(PPBinPred PROP.In ");
                    break;
                }
                case BOUNDEDABOVEBY: {
                    fprintf(file, "(PPBinPred PROP.BoundedAboveBy ");
                    break;
                }
                case ISSUBSEQ: {
                    fprintf(file, "(PPBinPred PROP.IsSubseq ");
                    break;
                }

            }
            printAstNode(root->data.binaryPred.left, file);
            fprintf(file, " ");
            printAstNode(root->data.binaryPred.right, file);
            fprintf(file, ") ");
            break;
        }
        case QUANTIFIEDPROP: {
            fprintf(file, "(PPQuant ");
            if (root->data.quantifiedProp.quantHead->quant == FORALL) fprintf(file, "PROP.QForall ");
            else if (root->data.quantifiedProp.quantHead->quant == EXISTS) fprintf(file, "PROP.QExists ");
            if (root->data.quantifiedProp.quantHead->type == PROP) {
                fprintf(file, "\"%s\" (", getFirstVariable(root->data.quantifiedProp.quantHead->data.prop));
                fprintf(file, "PPBinOp PROP.CImpl ");
                printAstNode(root->data.quantifiedProp.quantHead->data.prop, file);
                fprintf(file, " ");
                printAstNode(root->data.quantifiedProp.body, file);
                fprintf(file, ") ");
            }
            else if (root->data.quantifiedProp.quantHead->type == VAR) {
                fprintf(file, "\"%s\" ", root->data.quantifiedProp.quantHead->data.var);
                printAstNode(root->data.quantifiedProp.body, file);
            }
            fprintf(file, ") ");
            break;
        }
        case BINARYCON: {
            switch (root->data.binaryCon.binaryCon) {
                case IMPLY: {
                    fprintf(file, "(PPBinOp PROP.CImpl ");
                    break;
                }
            }
            printAstNode(root->data.binaryCon.left, file);
            fprintf(file, " ");
            printAstNode(root->data.binaryCon.right, file);
            fprintf(file, ") ");
            break;
        }
    }
}

int isImpl(struct AstNode *root) {
    return root != NULL && root->type == BINARYCON && root->data.binaryCon.binaryCon == IMPLY;
}

struct AstNode *leftImpl(struct AstNode *root) {
    if (root == NULL) return NULL;
    if (root->type == BINARYCON && root->data.binaryCon.binaryCon == IMPLY) return root->data.binaryCon.left;
    else return NULL;
}

struct AstNode *rightImpl(struct AstNode *root) {
    if (root == NULL) return NULL;
    if (root->type == BINARYCON && root->data.binaryCon.binaryCon == IMPLY) return root->data.binaryCon.right;
    else return NULL;
}

struct Theorem *divideImpl(struct AstNode *root) {
    struct Theorem *theorem = malloc(sizeof(struct Theorem));
    theorem->assumptions = NULL;
    while (isImpl(root)) {
        struct Assumptions *temp = malloc(sizeof(struct Assumptions));
        temp->assumption = leftImpl(root);
        temp->next = theorem->assumptions;
        theorem->assumptions = temp;
        root = rightImpl(root);
    }
    theorem->conclusion = root;
    return theorem;
}

void printTheorem(struct Theorem *theorem, FILE *file) {
    fprintf(file, "  (");
    if (theorem->assumptions != NULL) {
        printAstNode(theorem->assumptions->assumption, file);
        for (struct Assumptions *assu = theorem->assumptions->next; assu != NULL; assu = assu->next) {
            fprintf(file, "\n  :: ");
            printAstNode(assu->assumption, file);
        }
        fprintf(file, " :: nil");
    }
    else fprintf(file, "nil");
    fprintf(file, ",\n  ");
    printAstNode(theorem->conclusion, file);
    fprintf(file, ")");
}

void transformAndPrint(struct AstNode *root, FILE *file) {
    root = patternsIntro(root);
    printTheorem(divideImpl(root), file);
}