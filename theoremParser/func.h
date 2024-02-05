#ifndef FUNC_H_INCLUDED
#define FUNC_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>

typedef enum {
  PI,
  E
} Constant;

typedef enum {
  ADD,
  MINUS,
  TIME,
  DIV,
  POWER
} BinaryOperator;

typedef enum {
  SUP,
  SIN,
  COS,
  ABS,
  CEIL,
  FLOOR
} UnaryOperator;

typedef enum {
  INFTY,
  P_INFTY,
  N_INFTY
} Infinity;

typedef enum {
  FORALL,
  EXISTS
} Quantifier;

typedef enum {
  CONTINUE,
  UNICONTINUE,
  BOUNDEDABOVE,
  MONOINC,
  BOUNDED,
  CAUCHYSEQ
} UnaryPredicate;

typedef enum {
  EQ,
  LEQ,
  GEQ,
  LT,
  GT,
  NEQ,
  CONTINUEON,
  UNICONTINUEON,
  IN,
  BOUNDEDABOVEBY,
  ISSUBSEQ
} BinaryPredicate;

typedef enum {
  IMPLY
} BinaryConnective;

typedef struct {
    int number;
} NumberNode;

typedef struct {
    Constant type;
} ConstantNode;

typedef struct {
    int pattern;
    char *identifier;
} VariableNode;

typedef struct {
    BinaryOperator operator;
    struct AstNode *left;
    struct AstNode *right;
} BinaryOpNode;

typedef struct {
    UnaryOperator operator;
    struct AstNode *operand;
} UnaryOpNode;

typedef struct {
    Infinity type;
} InfinityNode;

struct LimitHeadNode {
    char *var;
    struct AstNode *val;
};

typedef struct {
    struct LimitHeadNode *head;
    struct AstNode *body;
} LimitNode;

typedef struct {
    struct AstNode *function;
    struct AstNode *operand;
} FunctionNode;

struct QuantifierNode {
    Quantifier quant;
    enum {
      PROP,
      VAR
    } type;
    union {
      char *var;
      struct AstNode *prop;
    } data;
};

typedef struct {
    UnaryPredicate unaryPred;
    struct AstNode *left;
} UnaryPredNode;

typedef struct {
    BinaryPredicate binaryPred;
    struct AstNode *left;
    struct AstNode *right;
} BinaryPredNode;

typedef struct {
    struct QuantifierNode *quantHead;
    struct AstNode *body;
} QuantifiedPropNode;

typedef struct {
    BinaryConnective binaryCon;
    struct AstNode *left;
    struct AstNode *right;
} BinaryConNode;

void yyerror(char *s);

union AstNodeData {
    NumberNode number;
    ConstantNode constant;
    VariableNode variable;
    BinaryOpNode binaryOp;
    UnaryOpNode unaryOp;
    InfinityNode infinity;
    LimitNode limit;
    FunctionNode function;
    UnaryPredNode unaryPred;
    BinaryPredNode binaryPred;
    QuantifiedPropNode quantifiedProp;
    BinaryConNode binaryCon;
};

struct AstNode {
    enum {
        NUMBER,
        CONSTANT,
        VARIABLE,
        BINARYOP,
        UNARYOP,
        INFINITY,
        LIMIT,
        FUNCTION,
        UNARYPRED,
        BINARYPRED,
        QUANTIFIEDPROP,
        BINARYCON
    } type;
    union AstNodeData data;
};

struct AstNode *createNumberNode(int number);
struct AstNode *createConstNode(Constant constant);
struct AstNode *createVariableNode(char *identifier);
struct AstNode *createBinaryOpNode(BinaryOperator operator, struct AstNode *left, struct AstNode *right);
struct AstNode *createUnaryOpNode(UnaryOperator operator, struct AstNode *operand);
struct AstNode *createInftyNode(Infinity infinity);
struct AstNode *createLimitNode(struct LimitHeadNode *head, struct AstNode* body);
struct AstNode *createFunctionNode(char *function, struct AstNode *operand);
struct LimitHeadNode *createLimitHeadNode(char *var, struct AstNode *val);
struct QuantifierNode *createQuantifierNode(Quantifier quant, char *var);
struct QuantifierNode *createPropQuantifierNode(Quantifier quant, struct AstNode *prop);
struct AstNode *createUnaryPredNode(UnaryPredicate predicate, struct AstNode *left);
struct AstNode *createBinaryPredNode(BinaryPredicate predicate, struct AstNode *left, struct AstNode *right);
struct AstNode *createQuantifiedPropNode(struct QuantifierNode *quantHead, struct AstNode *body);
struct AstNode *createBinaryConNode(BinaryConnective connective, struct AstNode *left, struct AstNode *right);

void transformAndPrint(struct AstNode *root, FILE *fp);

#endif // FUNC_H_INCLUDED