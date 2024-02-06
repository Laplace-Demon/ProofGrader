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
    BOTH = 274,                    /* BOTH  */
    Teq = 275,                     /* Teq  */
    Tleq = 276,                    /* Tleq  */
    Tgeq = 277,                    /* Tgeq  */
    Tneq = 278,                    /* Tneq  */
    Tequiv = 279,                  /* Tequiv  */
    Tlt = 280,                     /* Tlt  */
    Tgt = 281,                     /* Tgt  */
    Deq = 282,                     /* Deq  */
    Tlim = 283,                    /* Tlim  */
    Tto = 284,                     /* Tto  */
    Tinfty = 285,                  /* Tinfty  */
    TPinfty = 286,                 /* TPinfty  */
    TNinfty = 287,                 /* TNinfty  */
    GOAL = 288,                    /* GOAL  */
    MATH1 = 289,                   /* MATH1  */
    MATH2 = 290,                   /* MATH2  */
    PROOF = 291,                   /* PROOF  */
    CODEBOX = 292,                 /* CODEBOX  */
    QED = 293,                     /* QED  */
    ASSUM = 294,                   /* ASSUM  */
    GIVEN = 295,                   /* GIVEN  */
    COMMA = 296,                   /* COMMA  */
    PWP = 297,                     /* PWP  */
    PAP = 298,                     /* PAP  */
    CWP = 299,                     /* CWP  */
    CAP = 300,                     /* CAP  */
    CS = 301,                      /* CS  */
    PS = 302,                      /* PS  */
    KASaverage = 303,              /* KASaverage  */
    KSGaverage = 304,              /* KSGaverage  */
    KAGaverage = 305,              /* KAGaverage  */
    REMEMBER = 306,                /* REMEMBER  */
    CONCLUDE = 307,                /* CONCLUDE  */
    EQUNADD = 308,                 /* EQUNADD  */
    SINCE = 309,                   /* SINCE  */
    TRANS = 310,                   /* TRANS  */
    THEN = 311,                    /* THEN  */
    SAME = 312,                    /* SAME  */
    FOR = 313,                     /* FOR  */
    LB1L = 314,                    /* LB1L  */
    LB1R = 315,                    /* LB1R  */
    LB2L = 316,                    /* LB2L  */
    LB2R = 317,                    /* LB2R  */
    LB3L = 318,                    /* LB3L  */
    LB3R = 319,                    /* LB3R  */
    ABS = 320,                     /* ABS  */
    MIN = 321,                     /* MIN  */
    LCEIL = 322,                   /* LCEIL  */
    RCEIL = 323,                   /* RCEIL  */
    LFLOOR = 324,                  /* LFLOOR  */
    RFLOOR = 325,                  /* RFLOOR  */
    LIM_DEF = 326,                 /* LIM_DEF  */
    TO_PROVE = 327,                /* TO_PROVE  */
    INTROS = 328,                  /* INTROS  */
    SUPPOSE = 329,                 /* SUPPOSE  */
    SET = 330,                     /* SET  */
    AUTO_CONC = 331,               /* AUTO_CONC  */
    AUTO_NOHINT = 332,             /* AUTO_NOHINT  */
    USE = 333,                     /* USE  */
    Tforall = 334,                 /* Tforall  */
    Texists = 335,                 /* Texists  */
    Tpower = 336,                  /* Tpower  */
    BECAUSE = 337,                 /* BECAUSE  */
    IN = 338,                      /* IN  */
    IF = 339,                      /* IF  */
    IS = 340,                      /* IS  */
    HAVE = 341,                    /* HAVE  */
    CONTINUE = 342,                /* CONTINUE  */
    CONTINUE_DEF = 343,            /* CONTINUE_DEF  */
    UCONTINUE = 344,               /* UCONTINUE  */
    UC_DEF = 345,                  /* UC_DEF  */
    FSqueeze = 346,                /* FSqueeze  */
    SUPRE_THEOREM = 347,           /* SUPRE_THEOREM  */
    SUPRE_DEF = 348,               /* SUPRE_DEF  */
    BOUND_BELOW = 349,             /* BOUND_BELOW  */
    BOUND_ABOVE = 350,             /* BOUND_ABOVE  */
    MONOINC = 351,                 /* MONOINC  */
    MONODEC = 352,                 /* MONODEC  */
    TBELONG = 353,                 /* TBELONG  */
    TLINE = 354                    /* TLINE  */
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

#line 169 "M.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_M_TAB_H_INCLUDED  */
