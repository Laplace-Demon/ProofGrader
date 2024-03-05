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
    TCONST = 258,                  /* TCONST  */
    TFUNC = 259,                   /* TFUNC  */
    TNUM = 260,                    /* TNUM  */
    TVAR = 261,                    /* TVAR  */
    Tadd = 262,                    /* Tadd  */
    Ttimes = 263,                  /* Ttimes  */
    Tdiv = 264,                    /* Tdiv  */
    Tminus = 265,                  /* Tminus  */
    Tfrac = 266,                   /* Tfrac  */
    Tsqrt = 267,                   /* Tsqrt  */
    Tsin = 268,                    /* Tsin  */
    Tcos = 269,                    /* Tcos  */
    Tsup = 270,                    /* Tsup  */
    Tln = 271,                     /* Tln  */
    Tderi = 272,                   /* Tderi  */
    DERI = 273,                    /* DERI  */
    SQUARE = 274,                  /* SQUARE  */
    BOTH = 275,                    /* BOTH  */
    Teq = 276,                     /* Teq  */
    Tleq = 277,                    /* Tleq  */
    Tgeq = 278,                    /* Tgeq  */
    Tneq = 279,                    /* Tneq  */
    Tequiv = 280,                  /* Tequiv  */
    Tlt = 281,                     /* Tlt  */
    Tgt = 282,                     /* Tgt  */
    Deq = 283,                     /* Deq  */
    Tlim = 284,                    /* Tlim  */
    Tto = 285,                     /* Tto  */
    Tinfty = 286,                  /* Tinfty  */
    TPinfty = 287,                 /* TPinfty  */
    TNinfty = 288,                 /* TNinfty  */
    GOAL = 289,                    /* GOAL  */
    MATH1 = 290,                   /* MATH1  */
    MATH2 = 291,                   /* MATH2  */
    PROOF = 292,                   /* PROOF  */
    CODEBOX = 293,                 /* CODEBOX  */
    QED = 294,                     /* QED  */
    ASSUM = 295,                   /* ASSUM  */
    GIVEN = 296,                   /* GIVEN  */
    COMMA = 297,                   /* COMMA  */
    PWP = 298,                     /* PWP  */
    PAP = 299,                     /* PAP  */
    CWP = 300,                     /* CWP  */
    CAP = 301,                     /* CAP  */
    CS = 302,                      /* CS  */
    PS = 303,                      /* PS  */
    KASaverage = 304,              /* KASaverage  */
    KSGaverage = 305,              /* KSGaverage  */
    KAGaverage = 306,              /* KAGaverage  */
    REMEMBER = 307,                /* REMEMBER  */
    CONCLUDE = 308,                /* CONCLUDE  */
    EQUNADD = 309,                 /* EQUNADD  */
    SINCE = 310,                   /* SINCE  */
    TRANS = 311,                   /* TRANS  */
    THEN = 312,                    /* THEN  */
    SAME = 313,                    /* SAME  */
    FOR = 314,                     /* FOR  */
    LB1L = 315,                    /* LB1L  */
    LB1R = 316,                    /* LB1R  */
    LB2L = 317,                    /* LB2L  */
    LB2R = 318,                    /* LB2R  */
    LB3L = 319,                    /* LB3L  */
    LB3R = 320,                    /* LB3R  */
    ABS = 321,                     /* ABS  */
    MAX = 322,                     /* MAX  */
    MIN = 323,                     /* MIN  */
    LCEIL = 324,                   /* LCEIL  */
    RCEIL = 325,                   /* RCEIL  */
    LFLOOR = 326,                  /* LFLOOR  */
    RFLOOR = 327,                  /* RFLOOR  */
    LIM_DEF = 328,                 /* LIM_DEF  */
    SEQ_CONV_DEF = 329,            /* SEQ_CONV_DEF  */
    TO_PROVE = 330,                /* TO_PROVE  */
    INTROS = 331,                  /* INTROS  */
    SUPPOSE = 332,                 /* SUPPOSE  */
    SET = 333,                     /* SET  */
    AUTO_CONC = 334,               /* AUTO_CONC  */
    AUTO_NOHINT = 335,             /* AUTO_NOHINT  */
    AUTO_BWD_NOHINT = 336,         /* AUTO_BWD_NOHINT  */
    USE = 337,                     /* USE  */
    Tforall = 338,                 /* Tforall  */
    Texists = 339,                 /* Texists  */
    Tpower = 340,                  /* Tpower  */
    BECAUSE = 341,                 /* BECAUSE  */
    IN = 342,                      /* IN  */
    IF = 343,                      /* IF  */
    IS = 344,                      /* IS  */
    HAVE = 345,                    /* HAVE  */
    CONTINUE = 346,                /* CONTINUE  */
    CONTINUE_DEF = 347,            /* CONTINUE_DEF  */
    UCONTINUE = 348,               /* UCONTINUE  */
    UC_DEF = 349,                  /* UC_DEF  */
    FSqueeze = 350,                /* FSqueeze  */
    SUPRE_THEOREM = 351,           /* SUPRE_THEOREM  */
    MONO_CONV_THEOREM = 352,       /* MONO_CONV_THEOREM  */
    UNIQUE_DEF = 353,              /* UNIQUE_DEF  */
    BOUND_DEF = 354,               /* BOUND_DEF  */
    SUPRE_DEF = 355,               /* SUPRE_DEF  */
    INFI_DEF = 356,                /* INFI_DEF  */
    BOUND_BELOW = 357,             /* BOUND_BELOW  */
    BOUND_ABOVE = 358,             /* BOUND_ABOVE  */
    MONOINC = 359,                 /* MONOINC  */
    MONODEC = 360,                 /* MONODEC  */
    TBELONG = 361,                 /* TBELONG  */
    TLINE = 362,                   /* TLINE  */
    CONVERGE = 363,                /* CONVERGE  */
    DIVERGE = 364,                 /* DIVERGE  */
    BOUND = 365,                   /* BOUND  */
    UNIQUE = 366                   /* UNIQUE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "M.y"

//no special need for double ,just to make a union to define the type as node.
struct ast* a;
double d;

#line 181 "M.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_M_TAB_H_INCLUDED  */
