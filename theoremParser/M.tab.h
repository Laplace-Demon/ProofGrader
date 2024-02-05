/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_M_TAB_H_INCLUDED
# define YY_YY_M_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PREP = 258,                    /* PREP  */
    TCONTINUOUS = 259,             /* TCONTINUOUS  */
    TUNICONTINUOUS = 260,          /* TUNICONTINUOUS  */
    TMONOINC = 261,                /* TMONOINC  */
    TCAUCHYSEQ = 262,              /* TCAUCHYSEQ  */
    TBOUNDED = 263,                /* TBOUNDED  */
    TBOUNDEDABOVE = 264,           /* TBOUNDEDABOVE  */
    TSUBSEQ = 265,                 /* TSUBSEQ  */
    TNUM = 266,                    /* TNUM  */
    TCONSTPI = 267,                /* TCONSTPI  */
    TCONSTE = 268,                 /* TCONSTE  */
    TVAR = 269,                    /* TVAR  */
    TINFTY = 270,                  /* TINFTY  */
    TPINFTY = 271,                 /* TPINFTY  */
    TNINFTY = 272,                 /* TNINFTY  */
    TADD = 273,                    /* TADD  */
    TTIME = 274,                   /* TTIME  */
    TDIV = 275,                    /* TDIV  */
    TMINUS = 276,                  /* TMINUS  */
    TPOWER = 277,                  /* TPOWER  */
    TSQRT = 278,                   /* TSQRT  */
    TSIN = 279,                    /* TSIN  */
    TCOS = 280,                    /* TCOS  */
    TLN = 281,                     /* TLN  */
    TDERI = 282,                   /* TDERI  */
    TFRAC = 283,                   /* TFRAC  */
    TLIM = 284,                    /* TLIM  */
    TSUP = 285,                    /* TSUP  */
    TEQ = 286,                     /* TEQ  */
    TLEQ = 287,                    /* TLEQ  */
    TGEQ = 288,                    /* TGEQ  */
    TLT = 289,                     /* TLT  */
    TGT = 290,                     /* TGT  */
    TNEQ = 291,                    /* TNEQ  */
    TIN = 292,                     /* TIN  */
    TTO = 293,                     /* TTO  */
    COMMA = 294,                   /* COMMA  */
    TFORALL = 295,                 /* TFORALL  */
    TEXISTS = 296,                 /* TEXISTS  */
    PIMPLY = 297,                  /* PIMPLY  */
    LB1L = 298,                    /* LB1L  */
    LB1R = 299,                    /* LB1R  */
    LB2L = 300,                    /* LB2L  */
    LB2R = 301,                    /* LB2R  */
    LB3L = 302,                    /* LB3L  */
    LB3R = 303,                    /* LB3R  */
    TABS = 304,                    /* TABS  */
    LCEIL = 305,                   /* LCEIL  */
    RCEIL = 306,                   /* RCEIL  */
    LFLOOR = 307,                  /* LFLOOR  */
    RFLOOR = 308                   /* RFLOOR  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "M.y"

    int number;
    char *str;
    struct AstNode *node;
    struct LimitHeadNode *head;
    struct QuantifierNode *quantHead;

#line 125 "M.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_M_TAB_H_INCLUDED  */
