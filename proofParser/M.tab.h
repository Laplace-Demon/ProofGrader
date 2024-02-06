/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_M_TAB_H_INCLUDED
# define YY_YY_M_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TCONST = 258,
    TFUNC = 259,
    TNUM = 260,
    TVAR = 261,
    Tadd = 262,
    Ttimes = 263,
    Tdiv = 264,
    Tminus = 265,
    Tfrac = 266,
    Tsqrt = 267,
    Tsin = 268,
    Tcos = 269,
    Tln = 270,
    Tderi = 271,
    DERI = 272,
    BOTH = 273,
    Teq = 274,
    Tleq = 275,
    Tgeq = 276,
    Tneq = 277,
    Tequiv = 278,
    Tlt = 279,
    Tgt = 280,
    Deq = 281,
    Tlim = 282,
    Tto = 283,
    Tinfty = 284,
    TPinfty = 285,
    TNinfty = 286,
    GOAL = 287,
    MATH1 = 288,
    MATH2 = 289,
    PROOF = 290,
    CODEBOX = 291,
    QED = 292,
    ASSUM = 293,
    GIVEN = 294,
    COMMA = 295,
    PWP = 296,
    PAP = 297,
    CWP = 298,
    CAP = 299,
    CS = 300,
    PS = 301,
    KASaverage = 302,
    KSGaverage = 303,
    KAGaverage = 304,
    REMEMBER = 305,
    CONCLUDE = 306,
    EQUNADD = 307,
    SINCE = 308,
    TRANS = 309,
    THEN = 310,
    SAME = 311,
    FOR = 312,
    LB1L = 313,
    LB1R = 314,
    LB2L = 315,
    LB2R = 316,
    LB3L = 317,
    LB3R = 318,
    ABS = 319,
    MIN = 320,
    LCEIL = 321,
    RCEIL = 322,
    LFLOOR = 323,
    RFLOOR = 324,
    LIM_DEF = 325,
    TO_PROVE = 326,
    INTROS = 327,
    SUPPOSE = 328,
    SET = 329,
    AUTO_CONC = 330,
    AUTO_NOHINT = 331,
    USE = 332,
    Tforall = 333,
    Texists = 334,
    Tpower = 335,
    IN = 336,
    CONTINUE = 337,
    CONTINUE_DEF = 338,
    UC_DEF = 339,
    FSqueeze = 340,
    TLINE = 341
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "M.y" /* yacc.c:1909  */

//no special need for double ,just to make a union to define the type as node.
struct ast* a;
double d;

#line 147 "M.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_M_TAB_H_INCLUDED  */
