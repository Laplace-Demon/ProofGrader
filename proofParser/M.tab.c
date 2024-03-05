/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "M.y"

	// this part is copied to the beginning of the parser 
	#include "func.h"
	#include <stdio.h>
	#include "flex.h"
	void yyerror(char*);
	int yylex(void);
	struct ast *root;

#line 81 "M.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "M.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_TCONST = 3,                     /* TCONST  */
  YYSYMBOL_TFUNC = 4,                      /* TFUNC  */
  YYSYMBOL_TNUM = 5,                       /* TNUM  */
  YYSYMBOL_TVAR = 6,                       /* TVAR  */
  YYSYMBOL_Tadd = 7,                       /* Tadd  */
  YYSYMBOL_Ttimes = 8,                     /* Ttimes  */
  YYSYMBOL_Tdiv = 9,                       /* Tdiv  */
  YYSYMBOL_Tminus = 10,                    /* Tminus  */
  YYSYMBOL_Tfrac = 11,                     /* Tfrac  */
  YYSYMBOL_Tsqrt = 12,                     /* Tsqrt  */
  YYSYMBOL_Tsin = 13,                      /* Tsin  */
  YYSYMBOL_Tcos = 14,                      /* Tcos  */
  YYSYMBOL_Tsup = 15,                      /* Tsup  */
  YYSYMBOL_Tln = 16,                       /* Tln  */
  YYSYMBOL_Tderi = 17,                     /* Tderi  */
  YYSYMBOL_DERI = 18,                      /* DERI  */
  YYSYMBOL_SQUARE = 19,                    /* SQUARE  */
  YYSYMBOL_BOTH = 20,                      /* BOTH  */
  YYSYMBOL_Teq = 21,                       /* Teq  */
  YYSYMBOL_Tleq = 22,                      /* Tleq  */
  YYSYMBOL_Tgeq = 23,                      /* Tgeq  */
  YYSYMBOL_Tneq = 24,                      /* Tneq  */
  YYSYMBOL_Tequiv = 25,                    /* Tequiv  */
  YYSYMBOL_Tlt = 26,                       /* Tlt  */
  YYSYMBOL_Tgt = 27,                       /* Tgt  */
  YYSYMBOL_Deq = 28,                       /* Deq  */
  YYSYMBOL_Tlim = 29,                      /* Tlim  */
  YYSYMBOL_Tto = 30,                       /* Tto  */
  YYSYMBOL_Tinfty = 31,                    /* Tinfty  */
  YYSYMBOL_TPinfty = 32,                   /* TPinfty  */
  YYSYMBOL_TNinfty = 33,                   /* TNinfty  */
  YYSYMBOL_GOAL = 34,                      /* GOAL  */
  YYSYMBOL_MATH1 = 35,                     /* MATH1  */
  YYSYMBOL_MATH2 = 36,                     /* MATH2  */
  YYSYMBOL_PROOF = 37,                     /* PROOF  */
  YYSYMBOL_CODEBOX = 38,                   /* CODEBOX  */
  YYSYMBOL_QED = 39,                       /* QED  */
  YYSYMBOL_ASSUM = 40,                     /* ASSUM  */
  YYSYMBOL_GIVEN = 41,                     /* GIVEN  */
  YYSYMBOL_COMMA = 42,                     /* COMMA  */
  YYSYMBOL_PWP = 43,                       /* PWP  */
  YYSYMBOL_PAP = 44,                       /* PAP  */
  YYSYMBOL_CWP = 45,                       /* CWP  */
  YYSYMBOL_CAP = 46,                       /* CAP  */
  YYSYMBOL_CS = 47,                        /* CS  */
  YYSYMBOL_PS = 48,                        /* PS  */
  YYSYMBOL_KASaverage = 49,                /* KASaverage  */
  YYSYMBOL_KSGaverage = 50,                /* KSGaverage  */
  YYSYMBOL_KAGaverage = 51,                /* KAGaverage  */
  YYSYMBOL_REMEMBER = 52,                  /* REMEMBER  */
  YYSYMBOL_CONCLUDE = 53,                  /* CONCLUDE  */
  YYSYMBOL_EQUNADD = 54,                   /* EQUNADD  */
  YYSYMBOL_SINCE = 55,                     /* SINCE  */
  YYSYMBOL_TRANS = 56,                     /* TRANS  */
  YYSYMBOL_THEN = 57,                      /* THEN  */
  YYSYMBOL_SAME = 58,                      /* SAME  */
  YYSYMBOL_FOR = 59,                       /* FOR  */
  YYSYMBOL_LB1L = 60,                      /* LB1L  */
  YYSYMBOL_LB1R = 61,                      /* LB1R  */
  YYSYMBOL_LB2L = 62,                      /* LB2L  */
  YYSYMBOL_LB2R = 63,                      /* LB2R  */
  YYSYMBOL_LB3L = 64,                      /* LB3L  */
  YYSYMBOL_LB3R = 65,                      /* LB3R  */
  YYSYMBOL_ABS = 66,                       /* ABS  */
  YYSYMBOL_MAX = 67,                       /* MAX  */
  YYSYMBOL_MIN = 68,                       /* MIN  */
  YYSYMBOL_LCEIL = 69,                     /* LCEIL  */
  YYSYMBOL_RCEIL = 70,                     /* RCEIL  */
  YYSYMBOL_LFLOOR = 71,                    /* LFLOOR  */
  YYSYMBOL_RFLOOR = 72,                    /* RFLOOR  */
  YYSYMBOL_LIM_DEF = 73,                   /* LIM_DEF  */
  YYSYMBOL_SEQ_CONV_DEF = 74,              /* SEQ_CONV_DEF  */
  YYSYMBOL_TO_PROVE = 75,                  /* TO_PROVE  */
  YYSYMBOL_INTROS = 76,                    /* INTROS  */
  YYSYMBOL_SUPPOSE = 77,                   /* SUPPOSE  */
  YYSYMBOL_SET = 78,                       /* SET  */
  YYSYMBOL_AUTO_CONC = 79,                 /* AUTO_CONC  */
  YYSYMBOL_AUTO_NOHINT = 80,               /* AUTO_NOHINT  */
  YYSYMBOL_AUTO_BWD_NOHINT = 81,           /* AUTO_BWD_NOHINT  */
  YYSYMBOL_USE = 82,                       /* USE  */
  YYSYMBOL_Tforall = 83,                   /* Tforall  */
  YYSYMBOL_Texists = 84,                   /* Texists  */
  YYSYMBOL_Tpower = 85,                    /* Tpower  */
  YYSYMBOL_BECAUSE = 86,                   /* BECAUSE  */
  YYSYMBOL_IN = 87,                        /* IN  */
  YYSYMBOL_IF = 88,                        /* IF  */
  YYSYMBOL_IS = 89,                        /* IS  */
  YYSYMBOL_HAVE = 90,                      /* HAVE  */
  YYSYMBOL_CONTINUE = 91,                  /* CONTINUE  */
  YYSYMBOL_CONTINUE_DEF = 92,              /* CONTINUE_DEF  */
  YYSYMBOL_UCONTINUE = 93,                 /* UCONTINUE  */
  YYSYMBOL_UC_DEF = 94,                    /* UC_DEF  */
  YYSYMBOL_FSqueeze = 95,                  /* FSqueeze  */
  YYSYMBOL_SUPRE_THEOREM = 96,             /* SUPRE_THEOREM  */
  YYSYMBOL_MONO_CONV_THEOREM = 97,         /* MONO_CONV_THEOREM  */
  YYSYMBOL_UNIQUE_DEF = 98,                /* UNIQUE_DEF  */
  YYSYMBOL_BOUND_DEF = 99,                 /* BOUND_DEF  */
  YYSYMBOL_SUPRE_DEF = 100,                /* SUPRE_DEF  */
  YYSYMBOL_INFI_DEF = 101,                 /* INFI_DEF  */
  YYSYMBOL_BOUND_BELOW = 102,              /* BOUND_BELOW  */
  YYSYMBOL_BOUND_ABOVE = 103,              /* BOUND_ABOVE  */
  YYSYMBOL_MONOINC = 104,                  /* MONOINC  */
  YYSYMBOL_MONODEC = 105,                  /* MONODEC  */
  YYSYMBOL_TBELONG = 106,                  /* TBELONG  */
  YYSYMBOL_TLINE = 107,                    /* TLINE  */
  YYSYMBOL_CONVERGE = 108,                 /* CONVERGE  */
  YYSYMBOL_DIVERGE = 109,                  /* DIVERGE  */
  YYSYMBOL_BOUND = 110,                    /* BOUND  */
  YYSYMBOL_UNIQUE = 111,                   /* UNIQUE  */
  YYSYMBOL_YYACCEPT = 112,                 /* $accept  */
  YYSYMBOL_PROGRAM = 113,                  /* PROGRAM  */
  YYSYMBOL_STATEMENT = 114,                /* STATEMENT  */
  YYSYMBOL_PROOF_STATEMENT_LIST = 115,     /* PROOF_STATEMENT_LIST  */
  YYSYMBOL_PROOF_STATEMENT = 116,          /* PROOF_STATEMENT  */
  YYSYMBOL_MATH_EQUATION_LIST = 117,       /* MATH_EQUATION_LIST  */
  YYSYMBOL_GIVEN_STATEMENT = 118,          /* GIVEN_STATEMENT  */
  YYSYMBOL_GOAL_STATEMENT = 119,           /* GOAL_STATEMENT  */
  YYSYMBOL_ACTION_STATEMENT = 120,         /* ACTION_STATEMENT  */
  YYSYMBOL_MATH_EQUATION = 121,            /* MATH_EQUATION  */
  YYSYMBOL_EQUATION = 122,                 /* EQUATION  */
  YYSYMBOL_FUNC_EQUATION = 123,            /* FUNC_EQUATION  */
  YYSYMBOL_TEQ = 124,                      /* TEQ  */
  YYSYMBOL_CONTINUED_EQUATION = 125,       /* CONTINUED_EQUATION  */
  YYSYMBOL_CONTINUED_VAR = 126,            /* CONTINUED_VAR  */
  YYSYMBOL_LIM_HEAD = 127,                 /* LIM_HEAD  */
  YYSYMBOL_FUNC_HEAD = 128,                /* FUNC_HEAD  */
  YYSYMBOL_INTERVAL = 129,                 /* INTERVAL  */
  YYSYMBOL_EXPR = 130,                     /* EXPR  */
  YYSYMBOL_KNOWLEDGE = 131,                /* KNOWLEDGE  */
  YYSYMBOL_SINCE_CLAUSE = 132,             /* SINCE_CLAUSE  */
  YYSYMBOL_ACTION = 133,                   /* ACTION  */
  YYSYMBOL_MEMORY_TERM = 134,              /* MEMORY_TERM  */
  YYSYMBOL_EQS = 135,                      /* EQS  */
  YYSYMBOL_TLCONST = 136,                  /* TLCONST  */
  YYSYMBOL_TLVAR = 137,                    /* TLVAR  */
  YYSYMBOL_TLNUM = 138,                    /* TLNUM  */
  YYSYMBOL_TLsqrt = 139,                   /* TLsqrt  */
  YYSYMBOL_TLln = 140,                     /* TLln  */
  YYSYMBOL_TLderi = 141,                   /* TLderi  */
  YYSYMBOL_TLfrac = 142,                   /* TLfrac  */
  YYSYMBOL_TLeq = 143,                     /* TLeq  */
  YYSYMBOL_DLeq = 144,                     /* DLeq  */
  YYSYMBOL_TLleq = 145,                    /* TLleq  */
  YYSYMBOL_TLgeq = 146,                    /* TLgeq  */
  YYSYMBOL_TLlt = 147,                     /* TLlt  */
  YYSYMBOL_TLgt = 148,                     /* TLgt  */
  YYSYMBOL_TLneq = 149,                    /* TLneq  */
  YYSYMBOL_TLequiv = 150,                  /* TLequiv  */
  YYSYMBOL_TLlim = 151,                    /* TLlim  */
  YYSYMBOL_TLto = 152,                     /* TLto  */
  YYSYMBOL_TLinfty = 153,                  /* TLinfty  */
  YYSYMBOL_TLPinfty = 154,                 /* TLPinfty  */
  YYSYMBOL_TLNinfty = 155,                 /* TLNinfty  */
  YYSYMBOL_LGOAL = 156,                    /* LGOAL  */
  YYSYMBOL_LMATH1 = 157,                   /* LMATH1  */
  YYSYMBOL_LMATH2 = 158,                   /* LMATH2  */
  YYSYMBOL_LPROOF = 159,                   /* LPROOF  */
  YYSYMBOL_LQED = 160,                     /* LQED  */
  YYSYMBOL_LGIVEN = 161,                   /* LGIVEN  */
  YYSYMBOL_LSINCE = 162,                   /* LSINCE  */
  YYSYMBOL_LTRANS = 163,                   /* LTRANS  */
  YYSYMBOL_LUSE = 164,                     /* LUSE  */
  YYSYMBOL_LKASaverage = 165,              /* LKASaverage  */
  YYSYMBOL_LKSGaverage = 166,              /* LKSGaverage  */
  YYSYMBOL_LKAGaverage = 167,              /* LKAGaverage  */
  YYSYMBOL_LREMEMBER = 168,                /* LREMEMBER  */
  YYSYMBOL_LEQUNADD = 169,                 /* LEQUNADD  */
  YYSYMBOL_LCONCLUDE = 170,                /* LCONCLUDE  */
  YYSYMBOL_LTHEN = 171,                    /* LTHEN  */
  YYSYMBOL_LSAME = 172,                    /* LSAME  */
  YYSYMBOL_LLB1L = 173,                    /* LLB1L  */
  YYSYMBOL_LLB1R = 174,                    /* LLB1R  */
  YYSYMBOL_LLB2L = 175,                    /* LLB2L  */
  YYSYMBOL_LLB2R = 176,                    /* LLB2R  */
  YYSYMBOL_LLB3L = 177,                    /* LLB3L  */
  YYSYMBOL_LLB3R = 178,                    /* LLB3R  */
  YYSYMBOL_LABS = 179,                     /* LABS  */
  YYSYMBOL_LMAX = 180,                     /* LMAX  */
  YYSYMBOL_LMIN = 181,                     /* LMIN  */
  YYSYMBOL_LLCEIL = 182,                   /* LLCEIL  */
  YYSYMBOL_LRCEIL = 183,                   /* LRCEIL  */
  YYSYMBOL_LLFLOOR = 184,                  /* LLFLOOR  */
  YYSYMBOL_LRFLOOR = 185,                  /* LRFLOOR  */
  YYSYMBOL_LLIM_DEF = 186,                 /* LLIM_DEF  */
  YYSYMBOL_LSEQ_CONV_DEF = 187,            /* LSEQ_CONV_DEF  */
  YYSYMBOL_LTO_PROVE = 188,                /* LTO_PROVE  */
  YYSYMBOL_TLsin = 189,                    /* TLsin  */
  YYSYMBOL_TLcos = 190,                    /* TLcos  */
  YYSYMBOL_TLsup = 191,                    /* TLsup  */
  YYSYMBOL_LCONTINUE_DEF = 192,            /* LCONTINUE_DEF  */
  YYSYMBOL_LUC_DEF = 193,                  /* LUC_DEF  */
  YYSYMBOL_LSUPRE_THEOREM = 194,           /* LSUPRE_THEOREM  */
  YYSYMBOL_LMONO_CONV_THEOREM = 195,       /* LMONO_CONV_THEOREM  */
  YYSYMBOL_LUNIQUE_DEF = 196,              /* LUNIQUE_DEF  */
  YYSYMBOL_LBOUND_DEF = 197,               /* LBOUND_DEF  */
  YYSYMBOL_LSUPRE_DEF = 198,               /* LSUPRE_DEF  */
  YYSYMBOL_LINFI_DEF = 199,                /* LINFI_DEF  */
  YYSYMBOL_LBOUND_BELOW = 200,             /* LBOUND_BELOW  */
  YYSYMBOL_LBOUND_ABOVE = 201,             /* LBOUND_ABOVE  */
  YYSYMBOL_LCONVERGE = 202,                /* LCONVERGE  */
  YYSYMBOL_LDIVERGE = 203,                 /* LDIVERGE  */
  YYSYMBOL_LBOUND = 204,                   /* LBOUND  */
  YYSYMBOL_LUNIQUE = 205,                  /* LUNIQUE  */
  YYSYMBOL_LFSqueeze = 206,                /* LFSqueeze  */
  YYSYMBOL_LINTROS = 207,                  /* LINTROS  */
  YYSYMBOL_LSET = 208,                     /* LSET  */
  YYSYMBOL_LFOR = 209,                     /* LFOR  */
  YYSYMBOL_LDERI = 210,                    /* LDERI  */
  YYSYMBOL_LSQUARE = 211,                  /* LSQUARE  */
  YYSYMBOL_LBOTH = 212,                    /* LBOTH  */
  YYSYMBOL_LCOMMA = 213,                   /* LCOMMA  */
  YYSYMBOL_TLforall = 214,                 /* TLforall  */
  YYSYMBOL_TLexists = 215,                 /* TLexists  */
  YYSYMBOL_LSUPPOSE = 216,                 /* LSUPPOSE  */
  YYSYMBOL_LIN = 217,                      /* LIN  */
  YYSYMBOL_LIS = 218,                      /* LIS  */
  YYSYMBOL_LIF = 219,                      /* LIF  */
  YYSYMBOL_LHAVE = 220,                    /* LHAVE  */
  YYSYMBOL_LCONTINUE = 221,                /* LCONTINUE  */
  YYSYMBOL_LUCONTINUE = 222,               /* LUCONTINUE  */
  YYSYMBOL_LAUTO_CONC = 223,               /* LAUTO_CONC  */
  YYSYMBOL_LAUTO_NOHINT = 224,             /* LAUTO_NOHINT  */
  YYSYMBOL_LAUTO_BWD_NOHINT = 225,         /* LAUTO_BWD_NOHINT  */
  YYSYMBOL_LBECAUSE = 226,                 /* LBECAUSE  */
  YYSYMBOL_TLBELONG = 227,                 /* TLBELONG  */
  YYSYMBOL_LMONOINC = 228,                 /* LMONOINC  */
  YYSYMBOL_LMONODEC = 229,                 /* LMONODEC  */
  YYSYMBOL_LPAP = 230                      /* LPAP  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int16 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  66
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1103

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  112
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  119
/* YYNRULES -- Number of rules.  */
#define YYNRULES  346
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  558

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   366


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    72,    72,    78,    88,    93,    98,   103,   108,   116,
     121,   127,   133,   141,   146,   152,   158,   163,   169,   175,
     181,   186,   191,   200,   206,   214,   222,   229,   235,   241,
     250,   255,   261,   273,   278,   283,   288,   293,   298,   303,
     308,   313,   318,   323,   329,   334,   339,   344,   349,   354,
     359,   364,   369,   374,   379,   384,   389,   394,   399,   404,
     409,   414,   419,   425,   430,   435,   440,   447,   455,   461,
     467,   473,   482,   487,   492,   497,   502,   507,   512,   519,
     525,   533,   538,   545,   550,   555,   560,   567,   574,   579,
     584,   589,   594,   599,   604,   609,   618,   623,   628,   634,
     639,   645,   650,   655,   660,   665,   670,   675,   680,   685,
     690,   695,   700,   705,   710,   715,   720,   725,   730,   736,
     741,   746,   751,   756,   761,   766,   771,   781,   786,   791,
     796,   801,   806,   811,   816,   821,   826,   831,   836,   841,
     846,   853,   858,   864,   870,   875,   880,   885,   890,   895,
     900,   905,   913,   919,   928,   935,   940,   948,   953,   960,
     965,   972,   977,   986,   991,   998,  1003,  1010,  1015,  1022,
    1027,  1034,  1039,  1046,  1051,  1058,  1063,  1070,  1075,  1082,
    1087,  1094,  1099,  1106,  1111,  1118,  1123,  1130,  1135,  1142,
    1147,  1154,  1159,  1166,  1171,  1178,  1183,  1190,  1195,  1203,
    1208,  1215,  1220,  1227,  1232,  1239,  1244,  1253,  1258,  1266,
    1271,  1278,  1283,  1290,  1295,  1302,  1307,  1314,  1319,  1326,
    1331,  1338,  1343,  1350,  1355,  1362,  1367,  1374,  1379,  1386,
    1391,  1398,  1403,  1410,  1415,  1422,  1427,  1434,  1439,  1446,
    1451,  1458,  1463,  1470,  1475,  1482,  1487,  1494,  1499,  1506,
    1511,  1518,  1523,  1530,  1535,  1542,  1547,  1554,  1559,  1566,
    1571,  1578,  1583,  1590,  1595,  1602,  1607,  1614,  1619,  1626,
    1631,  1638,  1643,  1650,  1655,  1662,  1667,  1674,  1679,  1686,
    1691,  1698,  1703,  1710,  1715,  1722,  1727,  1734,  1739,  1746,
    1751,  1758,  1763,  1770,  1775,  1782,  1787,  1794,  1799,  1805,
    1810,  1817,  1822,  1829,  1834,  1841,  1846,  1853,  1858,  1865,
    1870,  1877,  1882,  1889,  1894,  1901,  1906,  1913,  1918,  1925,
    1930,  1937,  1942,  1949,  1954,  1961,  1966,  1973,  1978,  1985,
    1990,  1996,  2001,  2008,  2013,  2019,  2024,  2030,  2035,  2041,
    2046,  2052,  2057,  2063,  2068,  2074,  2079
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "TCONST", "TFUNC",
  "TNUM", "TVAR", "Tadd", "Ttimes", "Tdiv", "Tminus", "Tfrac", "Tsqrt",
  "Tsin", "Tcos", "Tsup", "Tln", "Tderi", "DERI", "SQUARE", "BOTH", "Teq",
  "Tleq", "Tgeq", "Tneq", "Tequiv", "Tlt", "Tgt", "Deq", "Tlim", "Tto",
  "Tinfty", "TPinfty", "TNinfty", "GOAL", "MATH1", "MATH2", "PROOF",
  "CODEBOX", "QED", "ASSUM", "GIVEN", "COMMA", "PWP", "PAP", "CWP", "CAP",
  "CS", "PS", "KASaverage", "KSGaverage", "KAGaverage", "REMEMBER",
  "CONCLUDE", "EQUNADD", "SINCE", "TRANS", "THEN", "SAME", "FOR", "LB1L",
  "LB1R", "LB2L", "LB2R", "LB3L", "LB3R", "ABS", "MAX", "MIN", "LCEIL",
  "RCEIL", "LFLOOR", "RFLOOR", "LIM_DEF", "SEQ_CONV_DEF", "TO_PROVE",
  "INTROS", "SUPPOSE", "SET", "AUTO_CONC", "AUTO_NOHINT",
  "AUTO_BWD_NOHINT", "USE", "Tforall", "Texists", "Tpower", "BECAUSE",
  "IN", "IF", "IS", "HAVE", "CONTINUE", "CONTINUE_DEF", "UCONTINUE",
  "UC_DEF", "FSqueeze", "SUPRE_THEOREM", "MONO_CONV_THEOREM", "UNIQUE_DEF",
  "BOUND_DEF", "SUPRE_DEF", "INFI_DEF", "BOUND_BELOW", "BOUND_ABOVE",
  "MONOINC", "MONODEC", "TBELONG", "TLINE", "CONVERGE", "DIVERGE", "BOUND",
  "UNIQUE", "$accept", "PROGRAM", "STATEMENT", "PROOF_STATEMENT_LIST",
  "PROOF_STATEMENT", "MATH_EQUATION_LIST", "GIVEN_STATEMENT",
  "GOAL_STATEMENT", "ACTION_STATEMENT", "MATH_EQUATION", "EQUATION",
  "FUNC_EQUATION", "TEQ", "CONTINUED_EQUATION", "CONTINUED_VAR",
  "LIM_HEAD", "FUNC_HEAD", "INTERVAL", "EXPR", "KNOWLEDGE", "SINCE_CLAUSE",
  "ACTION", "MEMORY_TERM", "EQS", "TLCONST", "TLVAR", "TLNUM", "TLsqrt",
  "TLln", "TLderi", "TLfrac", "TLeq", "DLeq", "TLleq", "TLgeq", "TLlt",
  "TLgt", "TLneq", "TLequiv", "TLlim", "TLto", "TLinfty", "TLPinfty",
  "TLNinfty", "LGOAL", "LMATH1", "LMATH2", "LPROOF", "LQED", "LGIVEN",
  "LSINCE", "LTRANS", "LUSE", "LKASaverage", "LKSGaverage", "LKAGaverage",
  "LREMEMBER", "LEQUNADD", "LCONCLUDE", "LTHEN", "LSAME", "LLB1L", "LLB1R",
  "LLB2L", "LLB2R", "LLB3L", "LLB3R", "LABS", "LMAX", "LMIN", "LLCEIL",
  "LRCEIL", "LLFLOOR", "LRFLOOR", "LLIM_DEF", "LSEQ_CONV_DEF", "LTO_PROVE",
  "TLsin", "TLcos", "TLsup", "LCONTINUE_DEF", "LUC_DEF", "LSUPRE_THEOREM",
  "LMONO_CONV_THEOREM", "LUNIQUE_DEF", "LBOUND_DEF", "LSUPRE_DEF",
  "LINFI_DEF", "LBOUND_BELOW", "LBOUND_ABOVE", "LCONVERGE", "LDIVERGE",
  "LBOUND", "LUNIQUE", "LFSqueeze", "LINTROS", "LSET", "LFOR", "LDERI",
  "LSQUARE", "LBOTH", "LCOMMA", "TLforall", "TLexists", "LSUPPOSE", "LIN",
  "LIS", "LIF", "LHAVE", "LCONTINUE", "LUCONTINUE", "LAUTO_CONC",
  "LAUTO_NOHINT", "LAUTO_BWD_NOHINT", "LBECAUSE", "TLBELONG", "LMONOINC",
  "LMONODEC", "LPAP", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-376)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     988,   -83,   -71,   -10,    -3,     8,    33,    69,    72,    79,
      81,    84,    86,    88,   104,   115,   128,   147,   148,    91,
     988,  -376,   117,  -376,  -376,   106,   126,   176,   205,   224,
     217,  -376,  -376,   217,   759,   -38,  -376,   276,  -376,    38,
     274,   166,   217,  -376,  -376,  -376,   217,   217,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,   179,  1017,
     180,  1017,   181,   184,   188,   196,   197,   203,   208,  -376,
    -376,   215,    63,   858,   858,   217,   277,   277,   217,    36,
    -376,   210,  -376,  -376,  -376,   217,   216,   218,   220,   226,
     228,   230,   234,   235,   236,   238,   239,   240,  -376,  -376,
     212,   719,   719,  -376,  -376,  -376,   276,  -376,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,   241,   242,   232,   232,
     232,   246,   261,  -376,   274,   334,   250,   251,   256,   274,
    -376,  -376,  -376,  -376,   106,  -376,  -376,  -376,   303,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,   262,   266,   268,   217,
    -376,  -376,   280,   281,   274,   274,   282,   283,   285,   286,
     290,   294,   295,   296,   298,   301,   304,   305,   308,   310,
     311,   277,   277,   106,   354,   277,   570,  -376,     6,  -376,
     -11,   106,   106,   106,  -376,  -376,   883,   991,   991,   991,
     324,   324,   106,   106,   106,   106,   106,   274,   274,   360,
     360,   354,   360,   611,     6,   274,   274,   369,   991,   991,
     371,   323,   369,  -376,  -376,  -376,  -376,  -376,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,   326,  -376,
     277,   727,   727,   360,   261,  -376,  -376,  -376,  -376,  -376,
    -376,   329,  -376,   277,   330,    90,  -376,  -376,  -376,   422,
    1017,   340,  1017,  -376,  -376,  -376,    60,   858,  -376,  -376,
     387,  -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,   991,
     342,   991,  -376,   991,   991,   991,   991,   343,   346,   347,
     348,   349,   350,   106,   991,  -376,  -376,  -376,  -376,  -376,
    -376,  -376,   272,   351,   324,   274,   991,   991,   991,   991,
     274,   991,  -376,   267,    14,   117,   883,   136,    71,    89,
     158,   991,   991,   991,   991,   991,   991,   991,   277,   274,
     277,  -376,  -376,   991,  -376,   274,   360,   360,   352,   205,
     255,   255,   217,  -376,   205,  -376,  -376,  -376,  -376,  -376,
     217,  -376,   991,   991,  -376,   303,  -376,  -376,  -376,  -376,
     570,   355,  -376,    71,  -376,   255,    52,   376,   376,    52,
    -376,  -376,  -376,  -376,  -376,  -376,   991,  -376,  -376,   611,
     357,   358,   359,   361,   362,   364,   365,  -376,  -376,  -376,
     277,    32,  -376,  -376,  -376,   274,   277,   324,   322,    71,
      71,    71,   444,   289,   460,   991,   991,   289,   991,   106,
     217,   217,  -376,   136,   136,    71,    71,    71,    71,    71,
     217,  -376,    64,   434,   360,   217,   217,  -376,  -376,    64,
      64,  -376,  -376,  -376,   255,   434,  1017,   495,  -376,  -376,
    -376,    71,  -376,  -376,  -376,  -376,  -376,  -376,  -376,   991,
     372,   373,   375,  -376,  -376,  -376,   387,  -376,   106,  -376,
    -376,   106,   378,   950,  -376,  -376,   275,   387,   275,   275,
     387,   991,   303,   303,   991,   991,   408,   411,  -376,  -376,
    -376,  -376,  -376,   217,  -376,  -376,  -376,  -376,  -376,   217,
    -376,   217,  -376,  -376,  -376,  -376,  -376,  -376,   255,  -376,
    -376,  -376,  -376,   991,   991,  -376,   379,    71,   303,   303,
     303,  -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,    71,
    -376,  -376,   289,   289,   380,  -376,   383,  -376,  -376,  -376,
    -376,   144,    71,    71,  -376,  -376,  -376,  -376,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int16 yydefact[] =
{
       0,   309,   197,   203,   205,   207,   345,   209,   229,   235,
     261,   299,   317,   301,   331,   333,   335,   213,   337,     0,
       2,     6,     9,     5,     4,    20,     0,     0,   155,     0,
       0,     7,    13,     0,     0,     0,   144,     0,     8,     0,
       0,     0,     0,   153,   145,   146,     0,     0,   310,   198,
     204,   206,   208,   346,   210,   230,   236,   262,   300,   318,
     302,   332,   334,   336,   214,   338,     1,     3,   311,     0,
     239,     0,   159,   199,   201,   227,   313,   315,   323,    21,
      39,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     156,   223,   152,    26,    25,    23,   215,   217,   219,   257,
     259,   297,   273,   275,   277,   279,   281,   283,   142,   141,
       0,     0,     0,   127,   128,   129,     0,   139,   140,   137,
     138,   133,   134,   135,   136,   132,   269,   271,     0,     0,
       0,   161,     0,    27,     0,     0,   305,   307,   303,     0,
     149,   148,    30,   151,     0,   312,    10,   240,     0,   160,
     200,   202,   228,   314,   316,   324,   319,   327,   329,     0,
      51,    54,   231,   339,     0,     0,   157,   169,   163,   263,
     265,   267,   165,   187,   193,   195,   243,   245,   247,   249,
     253,     0,     0,     0,   124,     0,     0,    97,    96,    98,
       0,     0,     0,     0,    99,   100,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   124,     0,     0,    96,     0,     0,    22,     0,     0,
       0,   225,     0,    16,   224,    24,   216,   218,   220,   258,
     260,   298,   274,   276,   278,   280,   282,   284,   211,   147,
       0,     0,     0,     0,     0,   270,   272,    17,    18,    19,
     162,   237,   154,     0,   171,     0,   306,   308,   304,     0,
       0,   241,     0,   320,   328,   330,     0,     0,   232,   340,
       0,    62,   158,   170,   164,   264,   266,   268,   166,   188,
     194,   196,   244,   246,   248,   250,   254,    33,    36,     0,
     173,     0,    37,     0,     0,     0,     0,   175,   177,   183,
     185,   179,   181,     0,     0,    72,    73,    74,    77,    78,
      75,    76,     0,   167,     0,     0,     0,     0,     0,     0,
       0,     0,   124,     0,    96,   100,     0,     0,     0,    96,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    34,    35,     0,    38,     0,     0,     0,   221,     0,
       0,     0,     0,   226,     0,   212,   130,   131,   143,   238,
      29,   172,     0,     0,   150,     0,   242,    12,    50,    53,
       0,   233,    87,     0,   174,     0,   103,   106,   105,   104,
     176,   178,   184,   186,   180,   182,     0,    79,    80,    67,
     321,   325,   341,   343,   289,   291,   295,    63,    64,    66,
       0,     0,    55,    56,   168,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   114,     0,     0,     0,     0,     0,
       0,     0,   102,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,   222,    14,     0,
       0,    59,    15,    28,     0,     0,     0,     0,   234,   118,
      69,     0,   322,   326,   342,   344,   290,   292,   296,     0,
     285,   287,   293,    61,    60,    65,     0,    71,     0,   107,
     109,     0,   189,     0,   101,   115,     0,    99,     0,     0,
      99,     0,     0,     0,     0,     0,     0,     0,   110,   111,
     112,    40,    41,     0,    68,    70,    42,    43,    47,     0,
      45,     0,    31,    32,    11,    49,    52,   121,     0,   286,
     288,   294,   116,     0,     0,   190,   191,     0,     0,    99,
     100,    88,    90,    92,    94,    95,    89,    91,    93,     0,
     126,   125,     0,     0,   251,   119,   255,   120,    44,    48,
      46,     0,     0,     0,   192,    86,    83,    85,    84,   113,
     122,   123,   252,   256,    58,    57,   108,   117
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -376,   471,  -376,   -68,  -376,   -90,  -376,  -376,  -376,    75,
     -75,  -376,  -376,   -73,  -189,  -376,    -1,   -37,   227,   -22,
    -376,  -376,  -332,   465,  -376,   -26,    -9,  -376,  -376,    83,
    -376,   366,   -34,  -376,  -376,  -376,  -376,  -376,  -376,  -376,
    -376,  -376,  -375,  -194,  -376,    16,    18,  -376,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,   284,  -376,  -376,   472,
    -376,   288,  -240,   -19,  -234,    13,   200,   -80,  -376,  -376,
    -376,  -376,  -376,  -376,   468,  -376,   192,  -376,  -376,  -376,
    -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,   -33,   -32,
    -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376,   245,  -376,
    -376,  -211,   -35,   -16,  -232,  -376,  -376,  -376,  -376,  -260,
    -248,  -376,  -376,  -376,  -376,  -376,  -376,  -376,  -376
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,    19,    20,    21,    22,    94,    23,    24,    25,    95,
     181,    80,   304,   182,   338,   183,   322,   185,   186,   240,
      26,    27,    28,    29,   187,   324,   189,   190,   191,   314,
     192,   305,   291,   306,   307,   308,   309,   310,   311,   193,
     473,   518,   194,   195,    30,    83,    84,    31,    32,    33,
      34,   239,    35,   113,   114,   115,   349,    92,   223,    85,
      36,   326,   414,    37,   252,   198,   262,   199,   200,   201,
     202,   535,   203,   537,   117,   118,    38,   204,   205,   206,
     129,   130,   119,   120,   121,   122,   123,   124,   463,   464,
     397,   398,   465,   399,   125,    39,    40,   139,   140,   141,
      41,    69,    86,    87,    42,   159,   400,    88,   401,   160,
     161,    43,    44,    45,    46,   165,   402,   403,    47
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      82,   146,   325,   148,    82,   225,   368,    82,   110,   209,
     358,   210,   109,   133,   135,   116,    82,   438,   369,   340,
      82,    82,   442,   313,    48,    81,   346,   347,   132,    81,
     372,   313,    81,    81,   290,    99,    49,   209,    71,   210,
     477,    81,    72,   480,    72,    81,    81,   212,   207,   215,
     111,     9,   112,    70,   126,   134,   127,   188,   214,    82,
     294,   295,    82,    82,   197,   197,   162,   208,   216,    82,
      72,    73,    74,    73,   162,   212,   207,   215,   293,   294,
     295,   296,   184,   211,    81,   188,   214,    81,    81,   221,
     243,    66,   197,   197,    81,   208,   216,    50,   519,    73,
      74,    79,   218,   219,    51,    93,   313,   244,   253,   108,
     184,   211,   415,   259,   416,    52,   418,   142,   421,    76,
      77,   143,   144,   162,    78,    73,    74,   241,   241,   242,
     242,    68,    72,    82,   460,   461,   261,   303,   270,   271,
      53,    12,   462,   293,   294,   295,   296,    76,    77,   162,
     431,   157,    78,   158,   315,   176,   303,   260,    81,    68,
     217,    73,    74,   220,   222,   293,   294,   295,   296,   163,
      70,   316,   329,   474,   468,   267,    54,   343,    68,    55,
     345,   339,   339,    75,   136,   137,    56,   505,    57,   339,
     339,    58,   365,    59,   367,    60,   289,   287,   288,   506,
     493,   292,   312,   317,   318,   319,   320,   499,   501,    76,
      77,    61,   484,   485,    78,   333,   334,   335,   336,   337,
     243,   303,    62,    72,   176,   138,   512,   341,   342,   387,
     344,   388,   207,    75,   266,    63,   521,   523,   524,   526,
     528,   188,   522,   303,   525,   527,   460,   461,   197,   420,
     422,   208,    73,    74,    64,    65,   356,   241,   241,   242,
     242,   357,   293,   294,   295,   296,   184,     9,   238,   360,
     443,   362,   162,   363,   293,   294,   295,   296,    91,   520,
      72,   131,   293,   294,   295,   296,   145,   147,   149,   407,
      73,   150,   550,   551,   412,   151,   293,   294,   295,   296,
      76,    77,   156,   152,   153,    78,   157,    10,   158,    68,
     154,   213,    73,   339,   406,   155,   386,   224,   163,   407,
     247,   248,   249,   226,   251,   227,    82,   228,   371,   293,
     294,   295,   296,   229,    82,   230,   371,   231,   251,   213,
     303,   232,   233,   234,   434,   235,   236,   237,   245,   246,
     371,    81,   303,   250,   430,   254,   432,   256,   257,    81,
     303,   390,   391,   258,   435,   436,   439,   440,   261,   263,
     164,   196,   196,   264,   303,   265,   392,   393,   504,   466,
     394,   395,   290,   396,   162,   251,   447,   268,   269,   272,
     273,   450,   274,   275,    82,    82,    74,   276,   164,   196,
     196,   277,   278,   279,    82,   280,    82,   303,   281,    82,
      82,   282,   283,    82,    82,   284,   459,   285,   286,    81,
      81,   348,   467,   323,   327,   328,   330,   441,   352,    81,
     353,    81,   481,   355,    81,    81,   359,   361,    81,    81,
     136,   293,   294,   295,   296,   350,   351,   366,   371,   374,
     380,   494,   495,   381,   382,   383,   384,   385,   404,   437,
     502,   303,   448,   503,   452,   453,   454,    82,   455,   456,
      74,   457,   458,    82,   472,    82,   164,   313,   534,   509,
     510,   513,   511,   536,   514,   515,   544,   552,   331,   332,
     553,    67,    81,    90,   370,   482,   483,   475,    81,    89,
      81,   255,   164,   128,   364,   491,   354,   492,   554,   555,
     496,   497,     0,     0,   498,   500,   373,     0,   375,   303,
     376,   377,   378,   379,   541,     0,     0,     0,   419,     0,
       0,   389,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   408,   409,   410,   411,     0,   413,     0,
       0,     0,     0,   417,     0,   196,     0,     0,   423,   424,
     425,   426,   427,   428,   429,   446,     0,     0,   538,     0,
     433,     0,     0,   449,   539,     0,   540,   293,   294,   295,
     296,     0,     0,     0,   390,   391,   157,     0,   158,   444,
     445,   254,   297,   298,   299,   300,   301,   302,     0,   392,
     393,     0,   405,   394,   395,    73,   396,     0,     0,   469,
     470,   471,   164,   451,     0,     0,     0,   164,   293,   294,
     295,   296,     0,     0,     0,   486,   487,   488,   489,   490,
       0,     0,   254,   297,   298,   299,   300,   301,   302,     0,
       0,     0,   476,   478,     0,   479,     0,     0,     0,     0,
       0,   507,     0,     0,     0,   303,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   530,   531,     0,     0,   508,     0,     0,     0,
       0,     0,     0,     0,     0,   164,   303,     0,     0,     0,
     517,     0,     0,     0,     0,     0,     0,     0,   529,     0,
       0,   532,   533,     0,     0,     0,     0,   545,   546,   547,
     548,     0,   166,     0,   131,    72,     0,     0,     0,   549,
     167,   168,   169,   170,   171,   172,     0,     0,     0,     0,
     542,   543,   556,   557,     0,     0,     0,     0,   173,     0,
       0,   174,   175,     0,    73,    74,     0,     0,     0,     0,
       0,     0,    73,    74,     0,    72,     0,     0,    96,    97,
      98,     0,     0,     0,     0,     0,    96,    97,    98,   162,
       0,     9,     0,    70,     0,   176,   177,   178,   179,     0,
     180,     0,    99,   100,    73,    74,     0,     0,     0,     0,
      99,   100,    76,    77,     0,     0,     0,     0,    96,    97,
      98,     0,     0,     0,   101,   102,   103,   104,   105,   106,
     107,     9,   101,   102,   103,   104,   105,   106,   107,     0,
       0,     0,    99,   100,     0,     0,     0,     0,     0,     0,
       0,     0,    76,    77,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,   101,   102,   103,   104,   105,   106,
     107,   166,     0,   131,    72,     0,     0,     0,     0,   167,
     168,   169,   170,   171,   172,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   166,   173,   131,    72,
     174,   175,     0,   321,   167,   168,   169,   170,   171,   172,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   173,     0,     0,   174,   175,     0,   162,     0,
       9,     0,    70,     0,   176,   177,   178,   179,     0,   180,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,    77,   162,     0,     0,     0,    70,     0,   176,
     177,   178,   179,   166,   180,   131,    72,     0,     0,     0,
       0,   167,   168,   169,   170,   171,   172,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   173,
       0,   516,   174,   175,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   166,     0,   131,    72,     0,     0,
       0,     0,   167,   168,   169,   170,   171,   172,     1,     0,
     162,     0,     0,     0,    70,     0,   176,   177,   178,   179,
     173,   180,     2,   174,   175,     3,     0,     4,     0,     5,
       0,     0,     6,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     7,     0,     0,     8,     0,     0,     0,
       9,   162,     0,     0,     0,    70,     4,   176,   177,   178,
     179,     6,   180,    10,    11,    12,    13,    14,    15,    16,
      17,     0,     7,     0,    18,     8,     0,     0,     0,     9,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    11,    12,    13,    14,    15,    16,    17,
       0,     0,     0,    18
};

static const yytype_int16 yycheck[] =
{
      26,    69,   196,    71,    30,    95,   266,    33,    34,    84,
     244,    84,    34,    39,    40,    34,    42,   349,   266,   208,
      46,    47,   354,    17,   107,    26,   215,   216,    37,    30,
     270,    17,    33,    34,    28,    73,   107,   112,    25,   112,
     415,    42,     6,   418,     6,    46,    47,    84,    83,    84,
      34,    62,    34,    64,    92,    39,    94,    83,    84,    85,
       8,     9,    88,    89,    83,    84,    60,    83,    84,    95,
       6,    35,    36,    35,    60,   112,   111,   112,     7,     8,
       9,    10,    83,    84,    85,   111,   112,    88,    89,    53,
     112,     0,   111,   112,    95,   111,   112,   107,   473,    35,
      36,    26,    86,    87,   107,    30,    17,   116,   134,    34,
     111,   112,   323,   139,   325,   107,   327,    42,   329,    83,
      84,    46,    47,    60,    88,    35,    36,   111,   112,   111,
     112,    42,     6,   159,   102,   103,    65,    85,   164,   165,
     107,    77,   110,     7,     8,     9,    10,    83,    84,    60,
     339,    91,    88,    93,   188,    66,    85,   144,   159,    42,
      85,    35,    36,    88,    89,     7,     8,     9,    10,   106,
      64,   190,   198,   413,   408,   159,   107,   211,    42,   107,
     214,   207,   208,    57,    18,    19,   107,   447,   107,   215,
     216,   107,   260,   107,   262,   107,   183,   181,   182,   447,
     432,   185,   186,   190,   191,   192,   193,   439,   440,    83,
      84,   107,   423,   424,    88,   202,   203,   204,   205,   206,
     242,    85,   107,     6,    66,    59,   466,   209,   210,   304,
     212,   304,   267,    57,   159,   107,   476,   477,   478,   479,
     480,   267,   476,    85,   478,   479,   102,   103,   267,   329,
     330,   267,    35,    36,   107,   107,   240,   241,   242,   241,
     242,   243,     7,     8,     9,    10,   267,    62,    56,   253,
     360,   255,    60,   255,     7,     8,     9,    10,    54,   473,
       6,     5,     7,     8,     9,    10,   107,   107,   107,   315,
      35,   107,   532,   533,   320,   107,     7,     8,     9,    10,
      83,    84,    87,   107,   107,    88,    91,    75,    93,    42,
     107,    84,    35,   339,   315,   107,   303,   107,   106,   345,
     128,   129,   130,   107,    63,   107,   352,   107,    61,     7,
       8,     9,    10,   107,   360,   107,    61,   107,    63,   112,
      85,   107,   107,   107,   345,   107,   107,   107,   107,   107,
      61,   352,    85,   107,   338,    21,   340,   107,   107,   360,
      85,    89,    90,   107,   346,   347,   350,   351,    65,   107,
      82,    83,    84,   107,    85,   107,   104,   105,   446,   405,
     108,   109,    28,   111,    60,    63,   370,   107,   107,   107,
     107,   375,   107,   107,   420,   421,    36,   107,   110,   111,
     112,   107,   107,   107,   430,   107,   432,    85,   107,   435,
     436,   107,   107,   439,   440,   107,   400,   107,   107,   420,
     421,    52,   406,   196,   197,   198,   199,   352,    57,   430,
     107,   432,   419,   107,   435,   436,   107,   107,   439,   440,
      18,     7,     8,     9,    10,   218,   219,   107,    61,   107,
     107,   433,   434,   107,   107,   107,   107,   107,   107,   107,
     444,    85,   107,   445,   107,   107,   107,   493,   107,   107,
      36,   107,   107,   499,    30,   501,   188,    17,    70,   107,
     107,   468,   107,    72,   471,   107,   107,   107,   200,   201,
     107,    20,   493,    28,   267,   420,   421,   414,   499,    27,
     501,   135,   214,    35,   259,   430,   222,   432,   541,   541,
     435,   436,    -1,    -1,   439,   440,   289,    -1,   291,    85,
     293,   294,   295,   296,   508,    -1,    -1,    -1,   328,    -1,
      -1,   304,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   316,   317,   318,   319,    -1,   321,    -1,
      -1,    -1,    -1,   326,    -1,   267,    -1,    -1,   331,   332,
     333,   334,   335,   336,   337,   365,    -1,    -1,   493,    -1,
     343,    -1,    -1,   373,   499,    -1,   501,     7,     8,     9,
      10,    -1,    -1,    -1,    89,    90,    91,    -1,    93,   362,
     363,    21,    22,    23,    24,    25,    26,    27,    -1,   104,
     105,    -1,   314,   108,   109,    35,   111,    -1,    -1,   409,
     410,   411,   324,   386,    -1,    -1,    -1,   329,     7,     8,
       9,    10,    -1,    -1,    -1,   425,   426,   427,   428,   429,
      -1,    -1,    21,    22,    23,    24,    25,    26,    27,    -1,
      -1,    -1,   415,   416,    -1,   418,    -1,    -1,    -1,    -1,
      -1,   451,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   482,   483,    -1,    -1,   459,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   407,    85,    -1,    -1,    -1,
     473,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   481,    -1,
      -1,   484,   485,    -1,    -1,    -1,    -1,   517,   518,   519,
     520,    -1,     3,    -1,     5,     6,    -1,    -1,    -1,   529,
      11,    12,    13,    14,    15,    16,    -1,    -1,    -1,    -1,
     513,   514,   542,   543,    -1,    -1,    -1,    -1,    29,    -1,
      -1,    32,    33,    -1,    35,    36,    -1,    -1,    -1,    -1,
      -1,    -1,    35,    36,    -1,     6,    -1,    -1,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    49,    50,    51,    60,
      -1,    62,    -1,    64,    -1,    66,    67,    68,    69,    -1,
      71,    -1,    73,    74,    35,    36,    -1,    -1,    -1,    -1,
      73,    74,    83,    84,    -1,    -1,    -1,    -1,    49,    50,
      51,    -1,    -1,    -1,    95,    96,    97,    98,    99,   100,
     101,    62,    95,    96,    97,    98,    99,   100,   101,    -1,
      -1,    -1,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    83,    84,    -1,    -1,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    95,    96,    97,    98,    99,   100,
     101,     3,    -1,     5,     6,    -1,    -1,    -1,    -1,    11,
      12,    13,    14,    15,    16,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    29,     5,     6,
      32,    33,    -1,    10,    11,    12,    13,    14,    15,    16,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    29,    -1,    -1,    32,    33,    -1,    60,    -1,
      62,    -1,    64,    -1,    66,    67,    68,    69,    -1,    71,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    83,    84,    60,    -1,    -1,    -1,    64,    -1,    66,
      67,    68,    69,     3,    71,     5,     6,    -1,    -1,    -1,
      -1,    11,    12,    13,    14,    15,    16,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    29,
      -1,    31,    32,    33,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,     5,     6,    -1,    -1,
      -1,    -1,    11,    12,    13,    14,    15,    16,    20,    -1,
      60,    -1,    -1,    -1,    64,    -1,    66,    67,    68,    69,
      29,    71,    34,    32,    33,    37,    -1,    39,    -1,    41,
      -1,    -1,    44,    -1,    -1,    -1,    -1,    20,    -1,    -1,
      -1,    -1,    -1,    55,    -1,    -1,    58,    -1,    -1,    -1,
      62,    60,    -1,    -1,    -1,    64,    39,    66,    67,    68,
      69,    44,    71,    75,    76,    77,    78,    79,    80,    81,
      82,    -1,    55,    -1,    86,    58,    -1,    -1,    -1,    62,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    77,    78,    79,    80,    81,    82,
      -1,    -1,    -1,    86
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    20,    34,    37,    39,    41,    44,    55,    58,    62,
      75,    76,    77,    78,    79,    80,    81,    82,    86,   113,
     114,   115,   116,   118,   119,   120,   132,   133,   134,   135,
     156,   159,   160,   161,   162,   164,   172,   175,   188,   207,
     208,   212,   216,   223,   224,   225,   226,   230,   107,   107,
     107,   107,   107,   107,   107,   107,   107,   107,   107,   107,
     107,   107,   107,   107,   107,   107,     0,   113,    42,   213,
      64,   177,     6,    35,    36,    57,    83,    84,    88,   121,
     123,   128,   137,   157,   158,   171,   214,   215,   219,   171,
     135,    54,   169,   121,   117,   121,    49,    50,    51,    73,
      74,    95,    96,    97,    98,    99,   100,   101,   121,   131,
     137,   157,   158,   165,   166,   167,   175,   186,   187,   194,
     195,   196,   197,   198,   199,   206,    92,    94,   186,   192,
     193,     5,   138,   137,   157,   137,    18,    19,    59,   209,
     210,   211,   121,   121,   121,   107,   115,   107,   115,   107,
     107,   107,   107,   107,   107,   107,    87,    91,    93,   217,
     221,   222,    60,   106,   173,   227,     3,    11,    12,    13,
      14,    15,    16,    29,    32,    33,    66,    67,    68,    69,
      71,   122,   125,   127,   128,   129,   130,   136,   137,   138,
     139,   140,   142,   151,   154,   155,   173,   175,   177,   179,
     180,   181,   182,   184,   189,   190,   191,   214,   215,   122,
     125,   128,   129,   130,   137,   214,   215,   121,   157,   157,
     121,    53,   121,   170,   107,   117,   107,   107,   107,   107,
     107,   107,   107,   107,   107,   107,   107,   107,    56,   163,
     131,   157,   158,   131,   138,   107,   107,   188,   188,   188,
     107,    63,   176,   137,    21,   143,   107,   107,   107,   137,
     177,    65,   178,   107,   107,   107,   121,   157,   107,   107,
     137,   137,   107,   107,   107,   107,   107,   107,   107,   107,
     107,   107,   107,   107,   107,   107,   107,   157,   157,   177,
      28,   144,   157,     7,     8,     9,    10,    22,    23,    24,
      25,    26,    27,    85,   124,   143,   145,   146,   147,   148,
     149,   150,   157,    17,   141,   144,   175,   177,   177,   177,
     177,    10,   128,   130,   137,   155,   173,   130,   130,   137,
     130,   173,   173,   177,   177,   177,   177,   177,   126,   137,
     126,   158,   158,   144,   158,   144,   126,   126,    52,   168,
     130,   130,    57,   107,   168,   107,   157,   158,   176,   107,
     157,   107,   157,   158,   210,   115,   107,   115,   221,   222,
     130,    61,   174,   130,   107,   130,   130,   130,   130,   130,
     107,   107,   107,   107,   107,   107,   177,   122,   125,   130,
      89,    90,   104,   105,   108,   109,   111,   202,   203,   205,
     218,   220,   228,   229,   107,   173,   128,   137,   130,   130,
     130,   130,   137,   130,   174,   213,   213,   130,   213,   178,
     179,   213,   179,   130,   130,   130,   130,   130,   130,   130,
     157,   126,   157,   130,   128,   158,   158,   107,   134,   157,
     157,   121,   134,   117,   130,   130,   178,   157,   107,   178,
     157,   130,   107,   107,   107,   107,   107,   107,   107,   157,
     102,   103,   110,   200,   201,   204,   137,   157,   176,   178,
     178,   178,    30,   152,   174,   141,   130,   154,   130,   130,
     154,   177,   121,   121,   213,   213,   178,   178,   178,   178,
     178,   121,   121,   216,   158,   158,   121,   121,   121,   216,
     121,   216,   157,   158,   115,   221,   222,   178,   130,   107,
     107,   107,   174,   177,   177,   107,    31,   130,   153,   154,
     155,   174,   176,   174,   174,   176,   174,   176,   174,   130,
     178,   178,   130,   130,    70,   183,    72,   185,   121,   121,
     121,   157,   130,   130,   107,   178,   178,   178,   178,   178,
     174,   174,   107,   107,   200,   201,   178,   178
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_uint8 yyr1[] =
{
       0,   112,   113,   113,   114,   114,   114,   114,   114,   115,
     115,   115,   115,   116,   116,   116,   116,   116,   116,   116,
     116,   116,   116,   117,   117,   118,   119,   120,   120,   120,
     120,   120,   120,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   121,   121,   121,
     121,   121,   121,   121,   121,   121,   121,   122,   123,   123,
     123,   123,   124,   124,   124,   124,   124,   124,   124,   125,
     125,   126,   126,   127,   127,   127,   127,   128,   129,   129,
     129,   129,   129,   129,   129,   129,   130,   130,   130,   130,
     130,   130,   130,   130,   130,   130,   130,   130,   130,   130,
     130,   130,   130,   130,   130,   130,   130,   130,   130,   130,
     130,   130,   130,   130,   130,   130,   130,   131,   131,   131,
     131,   131,   131,   131,   131,   131,   131,   131,   131,   131,
     131,   132,   132,   132,   132,   132,   132,   132,   132,   132,
     132,   132,   133,   133,   134,   135,   135,   136,   136,   137,
     137,   138,   138,   139,   139,   140,   140,   141,   141,   142,
     142,   143,   143,   144,   144,   145,   145,   146,   146,   147,
     147,   148,   148,   149,   149,   150,   150,   151,   151,   152,
     152,   153,   153,   154,   154,   155,   155,   156,   156,   157,
     157,   158,   158,   159,   159,   160,   160,   161,   161,   162,
     162,   163,   163,   164,   164,   165,   165,   166,   166,   167,
     167,   168,   168,   169,   169,   170,   170,   171,   171,   172,
     172,   173,   173,   174,   174,   175,   175,   176,   176,   177,
     177,   178,   178,   179,   179,   180,   180,   181,   181,   182,
     182,   183,   183,   184,   184,   185,   185,   186,   186,   187,
     187,   188,   188,   189,   189,   190,   190,   191,   191,   192,
     192,   193,   193,   194,   194,   195,   195,   196,   196,   197,
     197,   198,   198,   199,   199,   200,   200,   201,   201,   202,
     202,   203,   203,   204,   204,   205,   205,   206,   206,   207,
     207,   208,   208,   209,   209,   210,   210,   211,   211,   212,
     212,   213,   213,   214,   214,   215,   215,   216,   216,   217,
     217,   218,   218,   219,   219,   220,   220,   221,   221,   222,
     222,   223,   223,   224,   224,   225,   225,   226,   226,   227,
     227,   228,   228,   229,   229,   230,   230
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     1,     1,
       3,     6,     5,     1,     5,     5,     3,     3,     3,     3,
       1,     2,     3,     1,     2,     2,     2,     2,     5,     4,
       2,     6,     6,     3,     3,     3,     3,     3,     3,     1,
       5,     5,     5,     5,     6,     5,     6,     5,     6,     6,
       4,     2,     6,     4,     2,     4,     4,     8,     8,     4,
       5,     5,     3,     4,     4,     5,     4,     3,     5,     5,
       5,     5,     1,     1,     1,     1,     1,     1,     1,     3,
       3,     1,     2,     6,     6,     6,     6,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     1,     1,     1,     1,
       1,     4,     3,     3,     3,     3,     3,     4,     7,     4,
       4,     4,     4,     6,     3,     4,     5,     7,     4,     5,
       5,     5,     6,     6,     1,     5,     5,     1,     1,     1,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     2,     2,     4,     1,     1,     1,     3,     2,     2,
       4,     2,     2,     1,     3,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* PROGRAM: STATEMENT  */
#line 73 "M.y"
        {
	printf("->PROGRAM\n");
	(yyval.a) = (newast(nt_PROGRAM,NULL,prog_single,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
	root=(yyval.a);
	}
#line 1843 "M.tab.c"
    break;

  case 3: /* PROGRAM: STATEMENT PROGRAM  */
#line 79 "M.y"
        {
	printf("->PROGRAM\n");
	(yyval.a) = (newast(nt_PROGRAM,NULL,prog_list,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
	root=(yyval.a);
	}
#line 1853 "M.tab.c"
    break;

  case 4: /* STATEMENT: GOAL_STATEMENT  */
#line 89 "M.y"
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_goal,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1862 "M.tab.c"
    break;

  case 5: /* STATEMENT: GIVEN_STATEMENT  */
#line 94 "M.y"
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_given,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1871 "M.tab.c"
    break;

  case 6: /* STATEMENT: PROOF_STATEMENT_LIST  */
#line 99 "M.y"
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_proof_list,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1880 "M.tab.c"
    break;

  case 7: /* STATEMENT: LPROOF  */
#line 104 "M.y"
    {
        printf("STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_proof,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1889 "M.tab.c"
    break;

  case 8: /* STATEMENT: LTO_PROVE  */
#line 109 "M.y"
    {
        printf("STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_proof,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1898 "M.tab.c"
    break;

  case 9: /* PROOF_STATEMENT_LIST: PROOF_STATEMENT  */
#line 117 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_list_single)\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_list_single,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1907 "M.tab.c"
    break;

  case 10: /* PROOF_STATEMENT_LIST: PROOF_STATEMENT LCOMMA PROOF_STATEMENT_LIST  */
#line 122 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_list)\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_list,(yyvsp[-1].a),label,label->lineNum));
    }
#line 1917 "M.tab.c"
    break;

  case 11: /* PROOF_STATEMENT_LIST: LPAP MATH_EQUATION LLB3L PROOF_STATEMENT_LIST LLB3R PROOF_STATEMENT_LIST  */
#line 128 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_PoseAndProve)\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_PoseAndProve,(yyvsp[-4].a),label,(yyvsp[-1].a)->lineNum));
    }
#line 1927 "M.tab.c"
    break;

  case 12: /* PROOF_STATEMENT_LIST: ACTION_STATEMENT LLB3L PROOF_STATEMENT_LIST LLB3R PROOF_STATEMENT_LIST  */
#line 134 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_PoseVar)\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_PoseVar,(yyvsp[-4].a),label,(yyvsp[-1].a)->lineNum));
    }
#line 1937 "M.tab.c"
    break;

  case 13: /* PROOF_STATEMENT: LQED  */
#line 142 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_qed,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1946 "M.tab.c"
    break;

  case 14: /* PROOF_STATEMENT: SINCE_CLAUSE LTHEN MATH_EQUATION LREMEMBER MEMORY_TERM  */
#line 147 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_since_remember_as,(yyvsp[-4].a),label,label->lineNum);
    }
#line 1956 "M.tab.c"
    break;

  case 15: /* PROOF_STATEMENT: ACTION LTHEN MATH_EQUATION LREMEMBER MEMORY_TERM  */
#line 153 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_action_math_equation,(yyvsp[-4].a),label,label->lineNum);
    }
#line 1966 "M.tab.c"
    break;

  case 16: /* PROOF_STATEMENT: ACTION LTHEN LCONCLUDE  */
#line 159 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_action_conclude,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 1975 "M.tab.c"
    break;

  case 17: /* PROOF_STATEMENT: LUSE LLIM_DEF LTO_PROVE  */
#line 164 "M.y"
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_limit_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1985 "M.tab.c"
    break;

  case 18: /* PROOF_STATEMENT: LUSE LCONTINUE_DEF LTO_PROVE  */
#line 170 "M.y"
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_continue_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1995 "M.tab.c"
    break;

  case 19: /* PROOF_STATEMENT: LUSE LUC_DEF LTO_PROVE  */
#line 176 "M.y"
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_uc_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2005 "M.tab.c"
    break;

  case 20: /* PROOF_STATEMENT: ACTION_STATEMENT  */
#line 182 "M.y"
    {
        printf("->proof_statement:action_statement\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_action,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2014 "M.tab.c"
    break;

  case 21: /* PROOF_STATEMENT: SINCE_CLAUSE MATH_EQUATION  */
#line 187 "M.y"
    {
        printf("->PROOF_STATEMENT no remember\n");
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_since_no_remember,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 2023 "M.tab.c"
    break;

  case 22: /* PROOF_STATEMENT: SINCE_CLAUSE LTHEN MATH_EQUATION  */
#line 192 "M.y"
    {
        printf("->PROOF_STATEMENT no remember\n");
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_since_no_remember,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 2032 "M.tab.c"
    break;

  case 23: /* MATH_EQUATION_LIST: MATH_EQUATION  */
#line 201 "M.y"
    {
        printf("->MATH_LIST\n");
        (yyval.a) = (newast(nt_MATH_LIST,NULL,math_list_two,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));

    }
#line 2042 "M.tab.c"
    break;

  case 24: /* MATH_EQUATION_LIST: MATH_EQUATION MATH_EQUATION_LIST  */
#line 207 "M.y"
    {
        printf("->MATH_LIST\n");
        (yyval.a) = (newast(nt_MATH_LIST,NULL,math_list_n,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));

    }
#line 2052 "M.tab.c"
    break;

  case 25: /* GIVEN_STATEMENT: LGIVEN MATH_EQUATION_LIST  */
#line 215 "M.y"
    {
        printf("->GIVEN_STATEMENT\n");
        (yyval.a) = (newast(nt_GIVEN_STATEMENT,NULL,given_list,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
        
    }
#line 2062 "M.tab.c"
    break;

  case 26: /* GOAL_STATEMENT: LGOAL MATH_EQUATION  */
#line 223 "M.y"
    {
        printf("->GOAL_STATEMENT\n");
        (yyval.a) = (newast(nt_GOAL_STATEMENT,NULL,goal_math_equa,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2071 "M.tab.c"
    break;

  case 27: /* ACTION_STATEMENT: LINTROS TLVAR  */
#line 230 "M.y"
    {
        //引入变量
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2081 "M.tab.c"
    break;

  case 28: /* ACTION_STATEMENT: LINTROS LMATH1 TLVAR LMATH1 MATH_EQUATION_LIST  */
#line 236 "M.y"
    {
        //引入满足一系列条件的变量
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros_suppose_list_equation, (yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2091 "M.tab.c"
    break;

  case 29: /* ACTION_STATEMENT: LINTROS LMATH1 TLVAR LMATH1  */
#line 242 "M.y"
    {
        //引入变量
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2101 "M.tab.c"
    break;

  case 30: /* ACTION_STATEMENT: LSUPPOSE MATH_EQUATION  */
#line 251 "M.y"
    {
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_suppose,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2110 "M.tab.c"
    break;

  case 31: /* ACTION_STATEMENT: LSET TLVAR TLeq LMATH1 EXPR LMATH1  */
#line 256 "M.y"
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr1,(yyvsp[-5].a),to_set,to_set->lineNum);
    }
#line 2120 "M.tab.c"
    break;

  case 32: /* ACTION_STATEMENT: LSET TLVAR TLeq LMATH2 EXPR LMATH2  */
#line 262 "M.y"
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr2,(yyvsp[-5].a),to_set,to_set->lineNum);
    }
#line 2130 "M.tab.c"
    break;

  case 33: /* MATH_EQUATION: LMATH1 EQUATION LMATH1  */
#line 274 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_math1,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2139 "M.tab.c"
    break;

  case 34: /* MATH_EQUATION: LMATH2 EQUATION LMATH2  */
#line 279 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_math2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2148 "M.tab.c"
    break;

  case 35: /* MATH_EQUATION: LMATH2 CONTINUED_EQUATION LMATH2  */
#line 284 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_continued2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2157 "M.tab.c"
    break;

  case 36: /* MATH_EQUATION: LMATH1 CONTINUED_EQUATION LMATH1  */
#line 289 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_continued2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2166 "M.tab.c"
    break;

  case 37: /* MATH_EQUATION: LMATH1 INTERVAL LMATH1  */
#line 294 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_interval1,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2175 "M.tab.c"
    break;

  case 38: /* MATH_EQUATION: LMATH2 INTERVAL LMATH2  */
#line 299 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_interval2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2184 "M.tab.c"
    break;

  case 39: /* MATH_EQUATION: FUNC_EQUATION  */
#line 304 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_func,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2193 "M.tab.c"
    break;

  case 40: /* MATH_EQUATION: LMATH1 TLforall CONTINUED_VAR LMATH1 MATH_EQUATION  */
#line 309 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2202 "M.tab.c"
    break;

  case 41: /* MATH_EQUATION: LMATH1 TLexists CONTINUED_VAR LMATH1 MATH_EQUATION  */
#line 314 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2211 "M.tab.c"
    break;

  case 42: /* MATH_EQUATION: LMATH2 TLforall CONTINUED_VAR LMATH2 MATH_EQUATION  */
#line 319 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2220 "M.tab.c"
    break;

  case 43: /* MATH_EQUATION: LMATH2 TLexists CONTINUED_VAR LMATH2 MATH_EQUATION  */
#line 324 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2229 "M.tab.c"
    break;

  case 44: /* MATH_EQUATION: LMATH1 TLexists CONTINUED_VAR LMATH1 LSUPPOSE MATH_EQUATION  */
#line 330 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-3].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2238 "M.tab.c"
    break;

  case 45: /* MATH_EQUATION: TLexists LMATH1 EXPR LMATH1 MATH_EQUATION  */
#line 335 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists_sets,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2247 "M.tab.c"
    break;

  case 46: /* MATH_EQUATION: TLexists LMATH1 EXPR LMATH1 LSUPPOSE MATH_EQUATION  */
#line 340 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[-1].a)->lineNum));
    }
#line 2256 "M.tab.c"
    break;

  case 47: /* MATH_EQUATION: TLforall LMATH1 EXPR LMATH1 MATH_EQUATION  */
#line 345 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall_sets,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2265 "M.tab.c"
    break;

  case 48: /* MATH_EQUATION: TLforall LMATH1 EXPR LMATH1 LSUPPOSE MATH_EQUATION  */
#line 350 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[-1].a)->lineNum));
    }
#line 2274 "M.tab.c"
    break;

  case 49: /* MATH_EQUATION: FUNC_HEAD LIN LMATH1 EXPR LMATH1 LCONTINUE  */
#line 355 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_var_continue,(yyvsp[-5].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2283 "M.tab.c"
    break;

  case 50: /* MATH_EQUATION: FUNC_HEAD LIN MATH_EQUATION LCONTINUE  */
#line 360 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_interval_continue,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));  
    }
#line 2292 "M.tab.c"
    break;

  case 51: /* MATH_EQUATION: FUNC_HEAD LCONTINUE  */
#line 365 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_continue,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2301 "M.tab.c"
    break;

  case 52: /* MATH_EQUATION: FUNC_HEAD LIN LMATH1 EXPR LMATH1 LUCONTINUE  */
#line 370 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_var_ucontinue,(yyvsp[-5].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2310 "M.tab.c"
    break;

  case 53: /* MATH_EQUATION: FUNC_HEAD LIN MATH_EQUATION LUCONTINUE  */
#line 375 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_interval_ucontinue,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));  
    }
#line 2319 "M.tab.c"
    break;

  case 54: /* MATH_EQUATION: FUNC_HEAD LUCONTINUE  */
#line 380 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_ucontinue,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2328 "M.tab.c"
    break;

  case 55: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LMONOINC  */
#line 385 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_monoinc,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2337 "M.tab.c"
    break;

  case 56: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LMONODEC  */
#line 390 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_monodec,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2346 "M.tab.c"
    break;

  case 57: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LIS LMATH1 EXPR LMATH1 LBOUND_ABOVE  */
#line 395 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_bound_above,(yyvsp[-6].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2355 "M.tab.c"
    break;

  case 58: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LIS LMATH1 EXPR LMATH1 LBOUND_BELOW  */
#line 400 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_bound_below,(yyvsp[-6].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2364 "M.tab.c"
    break;

  case 59: /* MATH_EQUATION: LIF MATH_EQUATION THEN MATH_EQUATION  */
#line 405 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_impl,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));  
    }
#line 2373 "M.tab.c"
    break;

  case 60: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LHAVE LBOUND_ABOVE  */
#line 410 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_have_bound_above,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2382 "M.tab.c"
    break;

  case 61: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LHAVE LBOUND_BELOW  */
#line 415 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_have_bound_below,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2391 "M.tab.c"
    break;

  case 62: /* MATH_EQUATION: TLVAR TLBELONG TLVAR  */
#line 420 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_n_belong_N,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2400 "M.tab.c"
    break;

  case 63: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LCONVERGE  */
#line 426 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_converge,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2409 "M.tab.c"
    break;

  case 64: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LDIVERGE  */
#line 431 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_diverge,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2418 "M.tab.c"
    break;

  case 65: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LHAVE LBOUND  */
#line 436 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_have_bound,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2427 "M.tab.c"
    break;

  case 66: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LUNIQUE  */
#line 441 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_unique,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2436 "M.tab.c"
    break;

  case 67: /* EQUATION: EXPR TEQ EXPR  */
#line 448 "M.y"
    {
        printf("->EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_EQUATION,NULL,equation_expr,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2446 "M.tab.c"
    break;

  case 68: /* FUNC_EQUATION: LMATH2 FUNC_HEAD DLeq EXPR LMATH2  */
#line 456 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2456 "M.tab.c"
    break;

  case 69: /* FUNC_EQUATION: LMATH1 FUNC_HEAD DLeq EXPR LMATH1  */
#line 462 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2466 "M.tab.c"
    break;

  case 70: /* FUNC_EQUATION: LMATH2 TLVAR DLeq FUNC_HEAD LMATH2  */
#line 468 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2476 "M.tab.c"
    break;

  case 71: /* FUNC_EQUATION: LMATH1 TLVAR DLeq FUNC_HEAD LMATH1  */
#line 474 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2486 "M.tab.c"
    break;

  case 72: /* TEQ: TLeq  */
#line 483 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_teq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2495 "M.tab.c"
    break;

  case 73: /* TEQ: TLleq  */
#line 488 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tleq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2504 "M.tab.c"
    break;

  case 74: /* TEQ: TLgeq  */
#line 493 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tgeq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2513 "M.tab.c"
    break;

  case 75: /* TEQ: TLneq  */
#line 498 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tneq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2522 "M.tab.c"
    break;

  case 76: /* TEQ: TLequiv  */
#line 503 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tequiv,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2531 "M.tab.c"
    break;

  case 77: /* TEQ: TLlt  */
#line 508 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tlt,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2540 "M.tab.c"
    break;

  case 78: /* TEQ: TLgt  */
#line 513 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tgt,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2549 "M.tab.c"
    break;

  case 79: /* CONTINUED_EQUATION: EXPR TEQ EQUATION  */
#line 520 "M.y"
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_equation,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2559 "M.tab.c"
    break;

  case 80: /* CONTINUED_EQUATION: EXPR TEQ CONTINUED_EQUATION  */
#line 526 "M.y"
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_continued_equation,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2569 "M.tab.c"
    break;

  case 81: /* CONTINUED_VAR: TLVAR  */
#line 534 "M.y"
    {
        printf("->CONTINUED_VAR\n");
        (yyval.a) = (newast(nt_CONTINUED_VAR,NULL,0,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2578 "M.tab.c"
    break;

  case 82: /* CONTINUED_VAR: TLVAR CONTINUED_VAR  */
#line 539 "M.y"
    {
        printf("->CONTINUED_VAR\n");
        (yyval.a) = (newast(nt_CONTINUED_VAR,NULL,0,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2587 "M.tab.c"
    break;

  case 83: /* LIM_HEAD: TLlim LLB3L TLVAR TLto TLinfty LLB3R  */
#line 546 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_infty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2596 "M.tab.c"
    break;

  case 84: /* LIM_HEAD: TLlim LLB3L TLVAR TLto TLNinfty LLB3R  */
#line 551 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Ninfty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2605 "M.tab.c"
    break;

  case 85: /* LIM_HEAD: TLlim LLB3L TLVAR TLto TLPinfty LLB3R  */
#line 556 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Pinfty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2614 "M.tab.c"
    break;

  case 86: /* LIM_HEAD: TLlim LLB3L TLVAR TLto EXPR LLB3R  */
#line 561 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_expr,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2623 "M.tab.c"
    break;

  case 87: /* FUNC_HEAD: TLVAR LLB1L TLVAR LLB1R  */
#line 568 "M.y"
   {  
        printf("->FUNC_HEAD\n");
    (yyval.a) = (newast(nt_FUNC_HEAD,NULL,func_head_binding,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2632 "M.tab.c"
    break;

  case 88: /* INTERVAL: LLB1L EXPR LCOMMA EXPR LLB1R  */
#line 575 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2641 "M.tab.c"
    break;

  case 89: /* INTERVAL: LLB2L EXPR LCOMMA EXPR LLB1R  */
#line 580 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2650 "M.tab.c"
    break;

  case 90: /* INTERVAL: LLB1L EXPR LCOMMA EXPR LLB2R  */
#line 585 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2659 "M.tab.c"
    break;

  case 91: /* INTERVAL: LLB2L EXPR LCOMMA EXPR LLB2R  */
#line 590 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2668 "M.tab.c"
    break;

  case 92: /* INTERVAL: LLB1L EXPR LCOMMA TLPinfty LLB1R  */
#line 595 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_rinfty,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2677 "M.tab.c"
    break;

  case 93: /* INTERVAL: LLB2L EXPR LCOMMA TLPinfty LLB1R  */
#line 600 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_rinfty,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2686 "M.tab.c"
    break;

  case 94: /* INTERVAL: LLB1L TLNinfty LCOMMA EXPR LLB1R  */
#line 605 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_linfty_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2695 "M.tab.c"
    break;

  case 95: /* INTERVAL: LLB1L TLNinfty LCOMMA EXPR LLB2R  */
#line 610 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_linfty_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2704 "M.tab.c"
    break;

  case 96: /* EXPR: TLVAR  */
#line 619 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tvar,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2713 "M.tab.c"
    break;

  case 97: /* EXPR: TLCONST  */
#line 624 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tconst,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2722 "M.tab.c"
    break;

  case 98: /* EXPR: TLNUM  */
#line 629 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tnum,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2731 "M.tab.c"
    break;

  case 99: /* EXPR: TLPinfty  */
#line 635 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tpinfty,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2740 "M.tab.c"
    break;

  case 100: /* EXPR: TLNinfty  */
#line 640 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tninfty,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2749 "M.tab.c"
    break;

  case 101: /* EXPR: LLB1L Tminus EXPR LLB1R  */
#line 646 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_1L_minus_1R,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2758 "M.tab.c"
    break;

  case 102: /* EXPR: LABS EXPR LABS  */
#line 651 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_abs,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2767 "M.tab.c"
    break;

  case 103: /* EXPR: EXPR Tadd EXPR  */
#line 656 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tadd,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2776 "M.tab.c"
    break;

  case 104: /* EXPR: EXPR Tminus EXPR  */
#line 661 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tminus,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2785 "M.tab.c"
    break;

  case 105: /* EXPR: EXPR Tdiv EXPR  */
#line 666 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tdiv,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2794 "M.tab.c"
    break;

  case 106: /* EXPR: EXPR Ttimes EXPR  */
#line 671 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_ttimes,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2803 "M.tab.c"
    break;

  case 107: /* EXPR: TLsqrt LLB3L EXPR LLB3R  */
#line 676 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsqrt_2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2812 "M.tab.c"
    break;

  case 108: /* EXPR: TLsqrt LLB2L EXPR LLB2R LLB3L EXPR LLB3R  */
#line 681 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsqrt_n,(yyvsp[-1].a),(yyvsp[-4].a),(yyvsp[0].a)->lineNum));
    }
#line 2821 "M.tab.c"
    break;

  case 109: /* EXPR: TLln LLB3L EXPR LLB3R  */
#line 686 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tln,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2830 "M.tab.c"
    break;

  case 110: /* EXPR: TLsin LLB3L EXPR LLB3R  */
#line 691 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsin,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2839 "M.tab.c"
    break;

  case 111: /* EXPR: TLcos LLB3L EXPR LLB3R  */
#line 696 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tcos,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2848 "M.tab.c"
    break;

  case 112: /* EXPR: TLsup LLB3L EXPR LLB3R  */
#line 701 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsup,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2857 "M.tab.c"
    break;

  case 113: /* EXPR: LLB3L EXPR LLB3R LLB3L EXPR LLB3R  */
#line 706 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_3L_3R_3L_3R,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2866 "M.tab.c"
    break;

  case 114: /* EXPR: LLB1L EXPR LLB1R  */
#line 711 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_1L_1R,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2875 "M.tab.c"
    break;

  case 115: /* EXPR: LLB1L EXPR LLB1R TLderi  */
#line 716 "M.y"
    {
        printf("->EXPR_deri\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_derivative,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2884 "M.tab.c"
    break;

  case 116: /* EXPR: TLVAR TLderi LLB1L TLVAR LLB1R  */
#line 721 "M.y"
    {
        printf("->EXPR_deri_f\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_derivative_f,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2893 "M.tab.c"
    break;

  case 117: /* EXPR: TLfrac LLB3L EXPR LLB3R LLB3L EXPR LLB3R  */
#line 726 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tfrac_3L_3R_3L_3R,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2902 "M.tab.c"
    break;

  case 118: /* EXPR: LIM_HEAD LLB3L EXPR LLB3R  */
#line 731 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_lim_head,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    
    }
#line 2912 "M.tab.c"
    break;

  case 119: /* EXPR: LLCEIL LLB3L EXPR LLB3R LRCEIL  */
#line 737 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_Lceil_3L_3R_Rceil,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2921 "M.tab.c"
    break;

  case 120: /* EXPR: LLFLOOR LLB3L EXPR LLB3R LRFLOOR  */
#line 742 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_Lfloor_3L_3R_Rfloor,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2930 "M.tab.c"
    break;

  case 121: /* EXPR: EXPR Tpower LLB3L EXPR LLB3R  */
#line 747 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tpower,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2939 "M.tab.c"
    break;

  case 122: /* EXPR: LMAX LLB1L EXPR LCOMMA EXPR LLB1R  */
#line 752 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tmax,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2948 "M.tab.c"
    break;

  case 123: /* EXPR: LMIN LLB1L EXPR LCOMMA EXPR LLB1R  */
#line 757 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tmin,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2957 "M.tab.c"
    break;

  case 124: /* EXPR: FUNC_HEAD  */
#line 762 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_func,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2966 "M.tab.c"
    break;

  case 125: /* EXPR: LLB3L TLVAR LCOMMA MATH_EQUATION LLB3R  */
#line 767 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_seq_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2975 "M.tab.c"
    break;

  case 126: /* EXPR: LLB3L TLVAR LABS MATH_EQUATION LLB3R  */
#line 772 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_seq_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2984 "M.tab.c"
    break;

  case 127: /* KNOWLEDGE: LKASaverage  */
#line 782 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KASaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2993 "M.tab.c"
    break;

  case 128: /* KNOWLEDGE: LKSGaverage  */
#line 787 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KSGaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3002 "M.tab.c"
    break;

  case 129: /* KNOWLEDGE: LKAGaverage  */
#line 792 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KAGaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3011 "M.tab.c"
    break;

  case 130: /* KNOWLEDGE: LMATH1 KNOWLEDGE LMATH1  */
#line 797 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math1,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3020 "M.tab.c"
    break;

  case 131: /* KNOWLEDGE: LMATH2 KNOWLEDGE LMATH2  */
#line 802 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3029 "M.tab.c"
    break;

  case 132: /* KNOWLEDGE: LFSqueeze  */
#line 807 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_FSqueeze,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3038 "M.tab.c"
    break;

  case 133: /* KNOWLEDGE: LUNIQUE_DEF  */
#line 812 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Unique_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3047 "M.tab.c"
    break;

  case 134: /* KNOWLEDGE: LBOUND_DEF  */
#line 817 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Bound_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3056 "M.tab.c"
    break;

  case 135: /* KNOWLEDGE: LSUPRE_DEF  */
#line 822 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Supre_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3065 "M.tab.c"
    break;

  case 136: /* KNOWLEDGE: LINFI_DEF  */
#line 827 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Infi_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3074 "M.tab.c"
    break;

  case 137: /* KNOWLEDGE: LSUPRE_THEOREM  */
#line 832 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Supre_the,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3083 "M.tab.c"
    break;

  case 138: /* KNOWLEDGE: LMONO_CONV_THEOREM  */
#line 837 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Mono_conv_the,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3092 "M.tab.c"
    break;

  case 139: /* KNOWLEDGE: LLIM_DEF  */
#line 842 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Lim_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3101 "M.tab.c"
    break;

  case 140: /* KNOWLEDGE: LSEQ_CONV_DEF  */
#line 847 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Seq_conv_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3110 "M.tab.c"
    break;

  case 141: /* SINCE_CLAUSE: LSINCE KNOWLEDGE  */
#line 854 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_knowledge,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3119 "M.tab.c"
    break;

  case 142: /* SINCE_CLAUSE: LSINCE MATH_EQUATION  */
#line 859 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_math_equation,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3128 "M.tab.c"
    break;

  case 143: /* SINCE_CLAUSE: LSINCE LLB2L TLNUM LLB2R  */
#line 865 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_tnum,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3137 "M.tab.c"
    break;

  case 144: /* SINCE_CLAUSE: LSAME  */
#line 871 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_same,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 3146 "M.tab.c"
    break;

  case 145: /* SINCE_CLAUSE: LAUTO_NOHINT  */
#line 876 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_auto_nohint,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 3155 "M.tab.c"
    break;

  case 146: /* SINCE_CLAUSE: LAUTO_BWD_NOHINT  */
#line 881 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_auto_bwd_nohint,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 3164 "M.tab.c"
    break;

  case 147: /* SINCE_CLAUSE: LSINCE TLVAR LTRANS  */
#line 886 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_trans,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 3173 "M.tab.c"
    break;

  case 148: /* SINCE_CLAUSE: LBOTH LSQUARE  */
#line 891 "M.y"
    {
        printf("->STATEMENT Both square\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothSquare,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 3182 "M.tab.c"
    break;

  case 149: /* SINCE_CLAUSE: LBOTH LDERI  */
#line 896 "M.y"
    {
        printf("->STATEMENT Both deri\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 3191 "M.tab.c"
    break;

  case 150: /* SINCE_CLAUSE: LBOTH LFOR TLVAR LDERI  */
#line 901 "M.y"
    {
        printf("->STATEMENT Both deri\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri_var,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum); 
    }
#line 3200 "M.tab.c"
    break;

  case 151: /* SINCE_CLAUSE: LBECAUSE MATH_EQUATION  */
#line 906 "M.y"
    {
        printf("->STATEMENT Because\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_because,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum); 
    }
#line 3209 "M.tab.c"
    break;

  case 152: /* ACTION: EQS LEQUNADD  */
#line 914 "M.y"
    {
        //等式们相加
        printf("->ACTION");
        (yyval.a) = (newast(nt_ACTION,NULL,Action_eqs_equnadd,(yyvsp[0].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum)); 
    }
#line 3219 "M.tab.c"
    break;

  case 153: /* ACTION: LAUTO_CONC  */
#line 920 "M.y"
    {
        //“综上”
        printf("->ACTION");
        (yyval.a) = newast(nt_ACTION,NULL,Action_auto_conc,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum);
    }
#line 3229 "M.tab.c"
    break;

  case 154: /* MEMORY_TERM: LLB2L TLNUM LLB2R  */
#line 929 "M.y"
    {
        printf("->Memory Term");
        (yyval.a) = (newast(nt_MEMORY_TERM,NULL,Memory_term_tnum,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 3238 "M.tab.c"
    break;

  case 155: /* EQS: MEMORY_TERM  */
#line 936 "M.y"
    {
        printf("->Equation list");
        (yyval.a) = (newast(nt_EQS,NULL,Eqs_memory_term,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 3247 "M.tab.c"
    break;

  case 156: /* EQS: MEMORY_TERM EQS  */
#line 941 "M.y"
    {
        //at least two.
        printf("->Equation list");
        (yyval.a) = (newast(nt_EQS,NULL,Eqs_memory_term_eqs,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 3257 "M.tab.c"
    break;

  case 157: /* TLCONST: TCONST  */
#line 949 "M.y"
    {
        //printf("->TLCONST");
        (yyval.a) = (newast(ntl_TCONST,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3266 "M.tab.c"
    break;

  case 158: /* TLCONST: TCONST TLINE  */
#line 954 "M.y"
    {
        printf("->Line CONST");
        (yyval.a) = (newast(ntl_TCONST,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3275 "M.tab.c"
    break;

  case 159: /* TLVAR: TVAR  */
#line 961 "M.y"
    {
        printf("->TLVAR %s", (yyvsp[0].a)->addr);
        (yyval.a) = (newast(ntl_TVAR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3284 "M.tab.c"
    break;

  case 160: /* TLVAR: TVAR TLINE  */
#line 966 "M.y"
    {
        printf("->Line VAR %s", (yyvsp[-1].a)->addr);
        (yyval.a) = (newast(ntl_TVAR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3293 "M.tab.c"
    break;

  case 161: /* TLNUM: TNUM  */
#line 973 "M.y"
    {
        //printf("->TLNUM");
        (yyval.a) = (newast(ntl_TNUM,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3302 "M.tab.c"
    break;

  case 162: /* TLNUM: TNUM TLINE  */
#line 978 "M.y"
    {
        printf("->Line NUM");
        (yyval.a) = (newast(ntl_TNUM,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3311 "M.tab.c"
    break;

  case 163: /* TLsqrt: Tsqrt  */
#line 987 "M.y"
    {
        //printf("->Tsqrt");
        (yyval.a) = (newast(ntl_Tsqrt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3320 "M.tab.c"
    break;

  case 164: /* TLsqrt: Tsqrt TLINE  */
#line 992 "M.y"
    {
        printf("->Line sqrt");
        (yyval.a) = (newast(ntl_Tsqrt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3329 "M.tab.c"
    break;

  case 165: /* TLln: Tln  */
#line 999 "M.y"
    {
        //printf("->Tln");
        (yyval.a) = (newast(ntl_Tln,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3338 "M.tab.c"
    break;

  case 166: /* TLln: Tln TLINE  */
#line 1004 "M.y"
    {
        printf("->Line ln");
        (yyval.a) = (newast(ntl_Tln,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3347 "M.tab.c"
    break;

  case 167: /* TLderi: Tderi  */
#line 1011 "M.y"
    {
        //printf("->Tderi");
        (yyval.a) = (newast(ntl_Tderi,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3356 "M.tab.c"
    break;

  case 168: /* TLderi: Tderi TLINE  */
#line 1016 "M.y"
    {
        printf("->Line ln");
        (yyval.a) = (newast(ntl_Tderi,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3365 "M.tab.c"
    break;

  case 169: /* TLfrac: Tfrac  */
#line 1023 "M.y"
    {
        //printf("->Tfrac");
        (yyval.a) = (newast(ntl_Tfrac,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3374 "M.tab.c"
    break;

  case 170: /* TLfrac: Tfrac TLINE  */
#line 1028 "M.y"
    {
        printf("->Line frac");
        (yyval.a) = (newast(ntl_Tfrac,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3383 "M.tab.c"
    break;

  case 171: /* TLeq: Teq  */
#line 1035 "M.y"
    {
        //printf("->Teq");
        (yyval.a) = (newast(ntl_Teq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3392 "M.tab.c"
    break;

  case 172: /* TLeq: Teq TLINE  */
#line 1040 "M.y"
    {
        printf("->Line eq");
        (yyval.a) = (newast(ntl_Teq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3401 "M.tab.c"
    break;

  case 173: /* DLeq: Deq  */
#line 1047 "M.y"
    {
        //printf("->Deq");
        (yyval.a) = (newast(ntl_Deq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3410 "M.tab.c"
    break;

  case 174: /* DLeq: Deq TLINE  */
#line 1052 "M.y"
    {
        printf("->Line deq");
        (yyval.a) = (newast(ntl_Deq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3419 "M.tab.c"
    break;

  case 175: /* TLleq: Tleq  */
#line 1059 "M.y"
    {
        //printf("->Tleq");
        (yyval.a) = (newast(ntl_Tleq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3428 "M.tab.c"
    break;

  case 176: /* TLleq: Tleq TLINE  */
#line 1064 "M.y"
    {
        printf("->Line leq");
        (yyval.a) = (newast(ntl_Tleq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3437 "M.tab.c"
    break;

  case 177: /* TLgeq: Tgeq  */
#line 1071 "M.y"
    {
        //printf("->Tgeq");
        (yyval.a) = (newast(ntl_Tgeq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3446 "M.tab.c"
    break;

  case 178: /* TLgeq: Tgeq TLINE  */
#line 1076 "M.y"
    {
        printf("->Line geq");
        (yyval.a) = (newast(ntl_Tgeq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3455 "M.tab.c"
    break;

  case 179: /* TLlt: Tlt  */
#line 1083 "M.y"
    {
        //printf("->Tlt");
        (yyval.a) = (newast(ntl_Tlt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3464 "M.tab.c"
    break;

  case 180: /* TLlt: Tlt TLINE  */
#line 1088 "M.y"
    {
        printf("->Line lt");
        (yyval.a) = (newast(ntl_Tlt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3473 "M.tab.c"
    break;

  case 181: /* TLgt: Tgt  */
#line 1095 "M.y"
    {
        //printf("->Tgt");
        (yyval.a) = (newast(ntl_Tgt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3482 "M.tab.c"
    break;

  case 182: /* TLgt: Tgt TLINE  */
#line 1100 "M.y"
    {
        printf("->Line gt");
        (yyval.a) = (newast(ntl_Tgt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3491 "M.tab.c"
    break;

  case 183: /* TLneq: Tneq  */
#line 1107 "M.y"
    {
        //printf("->Tneq");
        (yyval.a) = (newast(ntl_Tneq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3500 "M.tab.c"
    break;

  case 184: /* TLneq: Tneq TLINE  */
#line 1112 "M.y"
    {
        printf("->Line neq");
        (yyval.a) = (newast(ntl_Tneq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3509 "M.tab.c"
    break;

  case 185: /* TLequiv: Tequiv  */
#line 1119 "M.y"
    {
        //printf("->Tequiv");
        (yyval.a) = (newast(ntl_Tequiv,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3518 "M.tab.c"
    break;

  case 186: /* TLequiv: Tequiv TLINE  */
#line 1124 "M.y"
    {
        printf("->Line equiv");
        (yyval.a) = (newast(ntl_Tequiv,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3527 "M.tab.c"
    break;

  case 187: /* TLlim: Tlim  */
#line 1131 "M.y"
    {
        //printf("->Tlim");
        (yyval.a) = (newast(ntl_Tlim,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3536 "M.tab.c"
    break;

  case 188: /* TLlim: Tlim TLINE  */
#line 1136 "M.y"
    {
        printf("->Line lim");
        (yyval.a) = (newast(ntl_Tlim,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3545 "M.tab.c"
    break;

  case 189: /* TLto: Tto  */
#line 1143 "M.y"
    {
        //printf("->Tto");
        (yyval.a) = (newast(ntl_Tto,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3554 "M.tab.c"
    break;

  case 190: /* TLto: Tto TLINE  */
#line 1148 "M.y"
     {
        printf("->Line to");
        (yyval.a) = (newast(ntl_Tto,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3563 "M.tab.c"
    break;

  case 191: /* TLinfty: Tinfty  */
#line 1155 "M.y"
    {
        //printf("->Tinfty");
        (yyval.a) = (newast(ntl_Tinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3572 "M.tab.c"
    break;

  case 192: /* TLinfty: Tinfty TLINE  */
#line 1160 "M.y"
    {
        printf("->Line infty");
        (yyval.a) = (newast(ntl_Tinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3581 "M.tab.c"
    break;

  case 193: /* TLPinfty: TPinfty  */
#line 1167 "M.y"
    {
        //printf("->TPinfty");
        (yyval.a) = (newast(ntl_TPinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3590 "M.tab.c"
    break;

  case 194: /* TLPinfty: TPinfty TLINE  */
#line 1172 "M.y"
    {
        printf("->Line Pinfty");
        (yyval.a) = (newast(ntl_TPinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3599 "M.tab.c"
    break;

  case 195: /* TLNinfty: TNinfty  */
#line 1179 "M.y"
    {
        //printf("->TNinfty");
        (yyval.a) = (newast(ntl_TNinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3608 "M.tab.c"
    break;

  case 196: /* TLNinfty: TNinfty TLINE  */
#line 1184 "M.y"
    {
        printf("->Line Ninfty");
        (yyval.a) = (newast(ntl_TNinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3617 "M.tab.c"
    break;

  case 197: /* LGOAL: GOAL  */
#line 1191 "M.y"
    {
        //printf("->GOAL");
        (yyval.a) = (newast(ntl_goal,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3626 "M.tab.c"
    break;

  case 198: /* LGOAL: GOAL TLINE  */
#line 1196 "M.y"
    {
        printf("->Line GOAL");
        (yyval.a) = (newast(ntl_goal,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3635 "M.tab.c"
    break;

  case 199: /* LMATH1: MATH1  */
#line 1204 "M.y"
    {
        //printf("->MATH1");
        (yyval.a) = (newast(ntl_math1,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3644 "M.tab.c"
    break;

  case 200: /* LMATH1: MATH1 TLINE  */
#line 1209 "M.y"
    {
        printf("->Line MATH1");
        (yyval.a) = (newast(ntl_math1,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3653 "M.tab.c"
    break;

  case 201: /* LMATH2: MATH2  */
#line 1216 "M.y"
    {
        //printf("->MATH2");
        (yyval.a) = (newast(ntl_math2,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3662 "M.tab.c"
    break;

  case 202: /* LMATH2: MATH2 TLINE  */
#line 1221 "M.y"
    {
        printf("->Line MATH2");
        (yyval.a) = (newast(ntl_math2,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3671 "M.tab.c"
    break;

  case 203: /* LPROOF: PROOF  */
#line 1228 "M.y"
    {
        //printf("->PROOF");
        (yyval.a) = (newast(ntl_proof,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3680 "M.tab.c"
    break;

  case 204: /* LPROOF: PROOF TLINE  */
#line 1233 "M.y"
    {
        printf("->Line PROOF");
        (yyval.a) = (newast(ntl_proof,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3689 "M.tab.c"
    break;

  case 205: /* LQED: QED  */
#line 1240 "M.y"
    {
        //printf("->QED");
        (yyval.a) = (newast(ntl_qed,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3698 "M.tab.c"
    break;

  case 206: /* LQED: QED TLINE  */
#line 1245 "M.y"
    {
        printf("->Line QED");
        (yyval.a) = (newast(ntl_qed,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3707 "M.tab.c"
    break;

  case 207: /* LGIVEN: GIVEN  */
#line 1254 "M.y"
    {
        //printf("->GIVEN");
        (yyval.a) = (newast(ntl_given,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3716 "M.tab.c"
    break;

  case 208: /* LGIVEN: GIVEN TLINE  */
#line 1259 "M.y"
    {
        printf("->Line GIVEN");
        (yyval.a) = (newast(ntl_given,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3725 "M.tab.c"
    break;

  case 209: /* LSINCE: SINCE  */
#line 1267 "M.y"
    {
        //printf("->SINCE");
        (yyval.a) = (newast(ntl_since,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3734 "M.tab.c"
    break;

  case 210: /* LSINCE: SINCE TLINE  */
#line 1272 "M.y"
    {
        printf("->Line SINCE");
        (yyval.a) = (newast(ntl_since,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3743 "M.tab.c"
    break;

  case 211: /* LTRANS: TRANS  */
#line 1279 "M.y"
    {
        //printf("->TRANS");
        (yyval.a) = (newast(ntl_trans,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3752 "M.tab.c"
    break;

  case 212: /* LTRANS: TRANS TLINE  */
#line 1284 "M.y"
    {
        printf("->Line TRANS");
        (yyval.a) = (newast(ntl_trans,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3761 "M.tab.c"
    break;

  case 213: /* LUSE: USE  */
#line 1291 "M.y"
    {
        //printf("->USE");
        (yyval.a) = (newast(ntl_use,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3770 "M.tab.c"
    break;

  case 214: /* LUSE: USE TLINE  */
#line 1296 "M.y"
    {
        printf("->Line USE");
        (yyval.a) = (newast(ntl_use,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3779 "M.tab.c"
    break;

  case 215: /* LKASaverage: KASaverage  */
#line 1303 "M.y"
    {
        //printf("->KASaverage");
        (yyval.a) = (newast(ntl_KASaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3788 "M.tab.c"
    break;

  case 216: /* LKASaverage: KASaverage TLINE  */
#line 1308 "M.y"
    {
        printf("->Line KASaverage");
        (yyval.a) = (newast(ntl_KASaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3797 "M.tab.c"
    break;

  case 217: /* LKSGaverage: KSGaverage  */
#line 1315 "M.y"
    {
        //printf("->KSGaverage");
        (yyval.a) = (newast(ntl_KSGaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3806 "M.tab.c"
    break;

  case 218: /* LKSGaverage: KSGaverage TLINE  */
#line 1320 "M.y"
    {
        printf("->Line KSGaverage");
        (yyval.a) = (newast(ntl_KSGaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3815 "M.tab.c"
    break;

  case 219: /* LKAGaverage: KAGaverage  */
#line 1327 "M.y"
    {
        //printf("->KAGaverage");
        (yyval.a) = (newast(ntl_KAGaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3824 "M.tab.c"
    break;

  case 220: /* LKAGaverage: KAGaverage TLINE  */
#line 1332 "M.y"
    {
        printf("->Line KAGaverage");
        (yyval.a) = (newast(ntl_KAGaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3833 "M.tab.c"
    break;

  case 221: /* LREMEMBER: REMEMBER  */
#line 1339 "M.y"
    {
        //printf("->REMEMBER");
        (yyval.a) = (newast(ntl_remember,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3842 "M.tab.c"
    break;

  case 222: /* LREMEMBER: REMEMBER TLINE  */
#line 1344 "M.y"
    {
        printf("->Line REMEMBER");
        (yyval.a) = (newast(ntl_remember,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3851 "M.tab.c"
    break;

  case 223: /* LEQUNADD: EQUNADD  */
#line 1351 "M.y"
    {
        //printf("->EQUNADD");
        (yyval.a) = (newast(ntl_equnadd,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3860 "M.tab.c"
    break;

  case 224: /* LEQUNADD: EQUNADD TLINE  */
#line 1356 "M.y"
    {
        printf("->Line EQUNADD");
        (yyval.a) = (newast(ntl_equnadd,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3869 "M.tab.c"
    break;

  case 225: /* LCONCLUDE: CONCLUDE  */
#line 1363 "M.y"
    {
        //printf("->CONCLUDE");
        (yyval.a) = (newast(ntl_conclude,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3878 "M.tab.c"
    break;

  case 226: /* LCONCLUDE: CONCLUDE TLINE  */
#line 1368 "M.y"
    {
        printf("->Line EQUNADD");
        (yyval.a) = (newast(ntl_conclude,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3887 "M.tab.c"
    break;

  case 227: /* LTHEN: THEN  */
#line 1375 "M.y"
    {
        //printf("->THEN");
        (yyval.a) = (newast(ntl_then,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3896 "M.tab.c"
    break;

  case 228: /* LTHEN: THEN TLINE  */
#line 1380 "M.y"
    {
        printf("->Line THEN");
        (yyval.a) = (newast(ntl_then,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3905 "M.tab.c"
    break;

  case 229: /* LSAME: SAME  */
#line 1387 "M.y"
    {
        //printf("->SAME");
        (yyval.a) = (newast(ntl_same,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3914 "M.tab.c"
    break;

  case 230: /* LSAME: SAME TLINE  */
#line 1392 "M.y"
    {
        printf("->Line SAME");
        (yyval.a) = (newast(ntl_same,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3923 "M.tab.c"
    break;

  case 231: /* LLB1L: LB1L  */
#line 1399 "M.y"
    {
        //printf("->LB1L");
        (yyval.a) = (newast(ntl_LB1L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3932 "M.tab.c"
    break;

  case 232: /* LLB1L: LB1L TLINE  */
#line 1404 "M.y"
    {
        printf("->Line LB1L");
        (yyval.a) = (newast(ntl_LB1L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3941 "M.tab.c"
    break;

  case 233: /* LLB1R: LB1R  */
#line 1411 "M.y"
    {
        //printf("->LB1R");
        (yyval.a) = (newast(ntl_LB1R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3950 "M.tab.c"
    break;

  case 234: /* LLB1R: LB1R TLINE  */
#line 1416 "M.y"
    {
        printf("->Line LB1R");
        (yyval.a) = (newast(ntl_LB1R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3959 "M.tab.c"
    break;

  case 235: /* LLB2L: LB2L  */
#line 1423 "M.y"
    {
        //printf("->LB2L");
        (yyval.a) = (newast(ntl_LB2L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3968 "M.tab.c"
    break;

  case 236: /* LLB2L: LB2L TLINE  */
#line 1428 "M.y"
    {
        printf("->Line LB2L");
        (yyval.a) = (newast(ntl_LB2L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3977 "M.tab.c"
    break;

  case 237: /* LLB2R: LB2R  */
#line 1435 "M.y"
    {
        //printf("->LB2R");
        (yyval.a) = (newast(ntl_LB2R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3986 "M.tab.c"
    break;

  case 238: /* LLB2R: LB2R TLINE  */
#line 1440 "M.y"
    {
        printf("->Line LB2R");
        (yyval.a) = (newast(ntl_LB2R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3995 "M.tab.c"
    break;

  case 239: /* LLB3L: LB3L  */
#line 1447 "M.y"
    {
        //printf("->LB3L");
        (yyval.a) = (newast(ntl_LB3L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4004 "M.tab.c"
    break;

  case 240: /* LLB3L: LB3L TLINE  */
#line 1452 "M.y"
    {
        printf("->Line LB3L");
        (yyval.a) = (newast(ntl_LB3L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4013 "M.tab.c"
    break;

  case 241: /* LLB3R: LB3R  */
#line 1459 "M.y"
    {
        //printf("->LB3R");
        (yyval.a) = (newast(ntl_LB3R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4022 "M.tab.c"
    break;

  case 242: /* LLB3R: LB3R TLINE  */
#line 1464 "M.y"
    {
        printf("->Line LB3R");
        (yyval.a) = (newast(ntl_LB3R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4031 "M.tab.c"
    break;

  case 243: /* LABS: ABS  */
#line 1471 "M.y"
    {
        //printf("->ABS");
        (yyval.a) = (newast(ntl_abs,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4040 "M.tab.c"
    break;

  case 244: /* LABS: ABS TLINE  */
#line 1476 "M.y"
    {
        printf("->Line ABS");
        (yyval.a) = (newast(ntl_abs,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4049 "M.tab.c"
    break;

  case 245: /* LMAX: MAX  */
#line 1483 "M.y"
    {
        //printf("->MAX");
        (yyval.a) = (newast(ntl_max,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4058 "M.tab.c"
    break;

  case 246: /* LMAX: MAX TLINE  */
#line 1488 "M.y"
    {
        printf("->Line MAX");
        (yyval.a) = (newast(ntl_max,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4067 "M.tab.c"
    break;

  case 247: /* LMIN: MIN  */
#line 1495 "M.y"
    {
        //printf("->MIN");
        (yyval.a) = (newast(ntl_min,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4076 "M.tab.c"
    break;

  case 248: /* LMIN: MIN TLINE  */
#line 1500 "M.y"
    {
        printf("->Line MIN");
        (yyval.a) = (newast(ntl_min,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4085 "M.tab.c"
    break;

  case 249: /* LLCEIL: LCEIL  */
#line 1507 "M.y"
    {
        //printf("->LCEIL");
        (yyval.a) = (newast(ntl_LCEIL,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4094 "M.tab.c"
    break;

  case 250: /* LLCEIL: LCEIL TLINE  */
#line 1512 "M.y"
    {
        printf("->Line LCEIL");
        (yyval.a) = (newast(ntl_LCEIL,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4103 "M.tab.c"
    break;

  case 251: /* LRCEIL: RCEIL  */
#line 1519 "M.y"
    {
        //printf("->RCEIL");
        (yyval.a) = (newast(ntl_RCEIL,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4112 "M.tab.c"
    break;

  case 252: /* LRCEIL: RCEIL TLINE  */
#line 1524 "M.y"
    {
        printf("->Line RCEIL");
        (yyval.a) = (newast(ntl_RCEIL,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4121 "M.tab.c"
    break;

  case 253: /* LLFLOOR: LFLOOR  */
#line 1531 "M.y"
    {
        //printf("->LFLOOR");
        (yyval.a) = (newast(ntl_LFLOOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4130 "M.tab.c"
    break;

  case 254: /* LLFLOOR: LFLOOR TLINE  */
#line 1536 "M.y"
    {
        printf("->Line LFLOOR");
        (yyval.a) = (newast(ntl_LFLOOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4139 "M.tab.c"
    break;

  case 255: /* LRFLOOR: RFLOOR  */
#line 1543 "M.y"
    {
        //printf("->RFLOOR");
        (yyval.a) = (newast(ntl_RFLOOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4148 "M.tab.c"
    break;

  case 256: /* LRFLOOR: RFLOOR TLINE  */
#line 1548 "M.y"
    {
        printf("->Line RFLOOR");
        (yyval.a) = (newast(ntl_RFLOOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4157 "M.tab.c"
    break;

  case 257: /* LLIM_DEF: LIM_DEF  */
#line 1555 "M.y"
    {
        //printf("->LIM_DEF");
        (yyval.a) = (newast(ntl_LIM_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4166 "M.tab.c"
    break;

  case 258: /* LLIM_DEF: LIM_DEF TLINE  */
#line 1560 "M.y"
    {
        printf("->Line LIM_DEF");
        (yyval.a) = (newast(ntl_LIM_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4175 "M.tab.c"
    break;

  case 259: /* LSEQ_CONV_DEF: SEQ_CONV_DEF  */
#line 1567 "M.y"
    {
        //printf("->SEQ_CONV_DEF");
        (yyval.a) = (newast(ntl_SEQ_CONV_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4184 "M.tab.c"
    break;

  case 260: /* LSEQ_CONV_DEF: SEQ_CONV_DEF TLINE  */
#line 1572 "M.y"
    {
        printf("->Line SEQ_CONV_DEF");
        (yyval.a) = (newast(ntl_SEQ_CONV_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4193 "M.tab.c"
    break;

  case 261: /* LTO_PROVE: TO_PROVE  */
#line 1579 "M.y"
    {
        //printf("->TO_PROVE");
        (yyval.a) = (newast(ntl_TO_PROVE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4202 "M.tab.c"
    break;

  case 262: /* LTO_PROVE: TO_PROVE TLINE  */
#line 1584 "M.y"
    {
        printf("->Line TO_PROVE");
        (yyval.a) = (newast(ntl_TO_PROVE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4211 "M.tab.c"
    break;

  case 263: /* TLsin: Tsin  */
#line 1591 "M.y"
    {
        //printf("->Tsin");
        (yyval.a) = (newast(ntl_sin,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4220 "M.tab.c"
    break;

  case 264: /* TLsin: Tsin TLINE  */
#line 1596 "M.y"
    {
        printf("->Line Tsin");
        (yyval.a) = (newast(ntl_sin,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4229 "M.tab.c"
    break;

  case 265: /* TLcos: Tcos  */
#line 1603 "M.y"
    {
        //printf("->Tcos");
        (yyval.a) = (newast(ntl_cos,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4238 "M.tab.c"
    break;

  case 266: /* TLcos: Tcos TLINE  */
#line 1608 "M.y"
    {
        printf("->Line Tcos");
        (yyval.a) = (newast(ntl_cos,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4247 "M.tab.c"
    break;

  case 267: /* TLsup: Tsup  */
#line 1615 "M.y"
    {
        //printf("->Tsup");
        (yyval.a) = (newast(ntl_sup,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4256 "M.tab.c"
    break;

  case 268: /* TLsup: Tsup TLINE  */
#line 1620 "M.y"
    {
        printf("->Line Tsup");
        (yyval.a) = (newast(ntl_sup,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4265 "M.tab.c"
    break;

  case 269: /* LCONTINUE_DEF: CONTINUE_DEF  */
#line 1627 "M.y"
    {
        //printf("->CONTINUE_DEF");
        (yyval.a) = (newast(ntl_CONTINUE_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4274 "M.tab.c"
    break;

  case 270: /* LCONTINUE_DEF: CONTINUE_DEF TLINE  */
#line 1632 "M.y"
    {
        printf("->Line CONTINUE_DEF");
        (yyval.a) = (newast(ntl_CONTINUE_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4283 "M.tab.c"
    break;

  case 271: /* LUC_DEF: UC_DEF  */
#line 1639 "M.y"
    {
        //printf("->UC_DEF");
        (yyval.a) = (newast(ntl_UC_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4292 "M.tab.c"
    break;

  case 272: /* LUC_DEF: UC_DEF TLINE  */
#line 1644 "M.y"
    {
        printf("->Line UC_DEF");
        (yyval.a) = (newast(ntl_UC_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4301 "M.tab.c"
    break;

  case 273: /* LSUPRE_THEOREM: SUPRE_THEOREM  */
#line 1651 "M.y"
{
        //printf("->SUPRE_THEOREM");
        (yyval.a) = (newast(ntl_SUPRE_THEOREM,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4310 "M.tab.c"
    break;

  case 274: /* LSUPRE_THEOREM: SUPRE_THEOREM TLINE  */
#line 1656 "M.y"
    {
        printf("->Line SUPRE_THEOREM");
        (yyval.a) = (newast(ntl_SUPRE_THEOREM,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4319 "M.tab.c"
    break;

  case 275: /* LMONO_CONV_THEOREM: MONO_CONV_THEOREM  */
#line 1663 "M.y"
{
        //printf("->MONO_CONV_THEOREM");
        (yyval.a) = (newast(ntl_MONO_CONV_THEOREM,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4328 "M.tab.c"
    break;

  case 276: /* LMONO_CONV_THEOREM: MONO_CONV_THEOREM TLINE  */
#line 1668 "M.y"
    {
        printf("->Line MONO_CONV_THEOREM");
        (yyval.a) = (newast(ntl_MONO_CONV_THEOREM,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4337 "M.tab.c"
    break;

  case 277: /* LUNIQUE_DEF: UNIQUE_DEF  */
#line 1675 "M.y"
{
        //printf("->UNIQUE_DEF");
        (yyval.a) = (newast(ntl_UNIQUE_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4346 "M.tab.c"
    break;

  case 278: /* LUNIQUE_DEF: UNIQUE_DEF TLINE  */
#line 1680 "M.y"
    {
        printf("->Line UNIQUE_DEF");
        (yyval.a) = (newast(ntl_UNIQUE_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4355 "M.tab.c"
    break;

  case 279: /* LBOUND_DEF: BOUND_DEF  */
#line 1687 "M.y"
{
        //printf("->BOUND_DEF");
        (yyval.a) = (newast(ntl_BOUND_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4364 "M.tab.c"
    break;

  case 280: /* LBOUND_DEF: BOUND_DEF TLINE  */
#line 1692 "M.y"
    {
        printf("->Line BOUND_DEF");
        (yyval.a) = (newast(ntl_BOUND_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4373 "M.tab.c"
    break;

  case 281: /* LSUPRE_DEF: SUPRE_DEF  */
#line 1699 "M.y"
{
        //printf("->SUPRE_DEF");
        (yyval.a) = (newast(ntl_SUPRE_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4382 "M.tab.c"
    break;

  case 282: /* LSUPRE_DEF: SUPRE_DEF TLINE  */
#line 1704 "M.y"
    {
        printf("->Line SUPRE_DEF");
        (yyval.a) = (newast(ntl_SUPRE_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4391 "M.tab.c"
    break;

  case 283: /* LINFI_DEF: INFI_DEF  */
#line 1711 "M.y"
{
        //printf("->INFI_DEF");
        (yyval.a) = (newast(ntl_INFI_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4400 "M.tab.c"
    break;

  case 284: /* LINFI_DEF: INFI_DEF TLINE  */
#line 1716 "M.y"
    {
        printf("->Line INFI_DEF");
        (yyval.a) = (newast(ntl_INFI_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4409 "M.tab.c"
    break;

  case 285: /* LBOUND_BELOW: BOUND_BELOW  */
#line 1723 "M.y"
{
        //printf("->BOUND_BELOW");
        (yyval.a) = (newast(ntl_BOUND_BELOW,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4418 "M.tab.c"
    break;

  case 286: /* LBOUND_BELOW: BOUND_BELOW TLINE  */
#line 1728 "M.y"
    {
        printf("->Line BOUND_BELOW");
        (yyval.a) = (newast(ntl_BOUND_BELOW,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4427 "M.tab.c"
    break;

  case 287: /* LBOUND_ABOVE: BOUND_ABOVE  */
#line 1735 "M.y"
{
        //printf("->BOUND_ABOVE");
        (yyval.a) = (newast(ntl_BOUND_ABOVE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4436 "M.tab.c"
    break;

  case 288: /* LBOUND_ABOVE: BOUND_ABOVE TLINE  */
#line 1740 "M.y"
    {
        printf("->Line BOUND_ABOVE");
        (yyval.a) = (newast(ntl_BOUND_ABOVE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4445 "M.tab.c"
    break;

  case 289: /* LCONVERGE: CONVERGE  */
#line 1747 "M.y"
{
        //printf("->CONVERGE");
        (yyval.a) = (newast(ntl_CONVERGE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4454 "M.tab.c"
    break;

  case 290: /* LCONVERGE: CONVERGE TLINE  */
#line 1752 "M.y"
    {
        printf("->Line CONVERGE");
        (yyval.a) = (newast(ntl_CONVERGE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4463 "M.tab.c"
    break;

  case 291: /* LDIVERGE: DIVERGE  */
#line 1759 "M.y"
{
        //printf("->DIVERGE");
        (yyval.a) = (newast(ntl_DIVERGE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4472 "M.tab.c"
    break;

  case 292: /* LDIVERGE: DIVERGE TLINE  */
#line 1764 "M.y"
    {
        printf("->Line DIVERGE");
        (yyval.a) = (newast(ntl_DIVERGE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4481 "M.tab.c"
    break;

  case 293: /* LBOUND: BOUND  */
#line 1771 "M.y"
{
        //printf("->BOUND");
        (yyval.a) = (newast(ntl_BOUND,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4490 "M.tab.c"
    break;

  case 294: /* LBOUND: BOUND TLINE  */
#line 1776 "M.y"
    {
        printf("->Line BOUND");
        (yyval.a) = (newast(ntl_BOUND,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4499 "M.tab.c"
    break;

  case 295: /* LUNIQUE: UNIQUE  */
#line 1783 "M.y"
{
        //printf("->UNIQUE");
        (yyval.a) = (newast(ntl_UNIQUE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4508 "M.tab.c"
    break;

  case 296: /* LUNIQUE: UNIQUE TLINE  */
#line 1788 "M.y"
    {
        printf("->Line UNIQUE");
        (yyval.a) = (newast(ntl_UNIQUE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4517 "M.tab.c"
    break;

  case 297: /* LFSqueeze: FSqueeze  */
#line 1795 "M.y"
    {
        //printf("->FSqueeze");
        (yyval.a) = (newast(ntl_FSqueeze,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4526 "M.tab.c"
    break;

  case 298: /* LFSqueeze: FSqueeze TLINE  */
#line 1800 "M.y"
    {
        printf("->Line FSqueeze");
        (yyval.a) = (newast(ntl_FSqueeze,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4535 "M.tab.c"
    break;

  case 299: /* LINTROS: INTROS  */
#line 1806 "M.y"
    {
        //printf("->INTROS");
        (yyval.a) = (newast(ntl_INTROS,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4544 "M.tab.c"
    break;

  case 300: /* LINTROS: INTROS TLINE  */
#line 1811 "M.y"
    {
        printf("->Line INTROS");
        (yyval.a) = (newast(ntl_INTROS,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4553 "M.tab.c"
    break;

  case 301: /* LSET: SET  */
#line 1818 "M.y"
    {
        //printf("->SET");
        (yyval.a) = (newast(ntl_SET,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4562 "M.tab.c"
    break;

  case 302: /* LSET: SET TLINE  */
#line 1823 "M.y"
    {
        printf("->Line SET");
        (yyval.a) = (newast(ntl_SET,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4571 "M.tab.c"
    break;

  case 303: /* LFOR: FOR  */
#line 1830 "M.y"
    {
        //printf("->FOR");
        (yyval.a) = (newast(ntl_FOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4580 "M.tab.c"
    break;

  case 304: /* LFOR: FOR TLINE  */
#line 1835 "M.y"
    {
        printf("->Line FOR");
        (yyval.a) = (newast(ntl_FOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4589 "M.tab.c"
    break;

  case 305: /* LDERI: DERI  */
#line 1842 "M.y"
    {
        //printf("->DERI");
        (yyval.a) = (newast(ntl_DERI,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4598 "M.tab.c"
    break;

  case 306: /* LDERI: DERI TLINE  */
#line 1847 "M.y"
    {
        printf("->Line DERI");
        (yyval.a) = (newast(ntl_DERI,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4607 "M.tab.c"
    break;

  case 307: /* LSQUARE: SQUARE  */
#line 1854 "M.y"
    {
        //printf("->SQUARE");
        (yyval.a) = (newast(ntl_SQUARE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4616 "M.tab.c"
    break;

  case 308: /* LSQUARE: SQUARE TLINE  */
#line 1859 "M.y"
    {
        printf("->Line SQUARE");
        (yyval.a) = (newast(ntl_SQUARE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4625 "M.tab.c"
    break;

  case 309: /* LBOTH: BOTH  */
#line 1866 "M.y"
    {
        //printf("->BOTH");
        (yyval.a) = (newast(ntl_BOTH,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4634 "M.tab.c"
    break;

  case 310: /* LBOTH: BOTH TLINE  */
#line 1871 "M.y"
    {
        printf("->Line BOTH");
        (yyval.a) = (newast(ntl_BOTH,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4643 "M.tab.c"
    break;

  case 311: /* LCOMMA: COMMA  */
#line 1878 "M.y"
    {
        //printf("->COMMA");
        (yyval.a) = (newast(ntl_COMMA,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4652 "M.tab.c"
    break;

  case 312: /* LCOMMA: COMMA TLINE  */
#line 1883 "M.y"
    {
        printf("->Line COMMA");
        (yyval.a) = (newast(ntl_COMMA,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4661 "M.tab.c"
    break;

  case 313: /* TLforall: Tforall  */
#line 1890 "M.y"
    {
        //printf("->Tforall");
        (yyval.a) = (newast(ntl_Tforall,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4670 "M.tab.c"
    break;

  case 314: /* TLforall: Tforall TLINE  */
#line 1895 "M.y"
    {
        printf("->Line Tforall");
        (yyval.a) = (newast(ntl_Tforall,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4679 "M.tab.c"
    break;

  case 315: /* TLexists: Texists  */
#line 1902 "M.y"
    {
        //printf("->Texists");
        (yyval.a) = (newast(ntl_Texists,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4688 "M.tab.c"
    break;

  case 316: /* TLexists: Texists TLINE  */
#line 1907 "M.y"
    {
        printf("->Line Texists");
        (yyval.a) = (newast(ntl_Texists,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4697 "M.tab.c"
    break;

  case 317: /* LSUPPOSE: SUPPOSE  */
#line 1914 "M.y"
    {
        //printf("->SUPPOSE");
        (yyval.a) = (newast(ntl_SUPPOSE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4706 "M.tab.c"
    break;

  case 318: /* LSUPPOSE: SUPPOSE TLINE  */
#line 1919 "M.y"
    {
        printf("->Line SUPPOSE");
        (yyval.a) = (newast(ntl_SUPPOSE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4715 "M.tab.c"
    break;

  case 319: /* LIN: IN  */
#line 1926 "M.y"
    {
        //printf("->IN");
        (yyval.a) = (newast(ntl_IN,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4724 "M.tab.c"
    break;

  case 320: /* LIN: IN TLINE  */
#line 1931 "M.y"
    {
        printf("->Line IN");
        (yyval.a) = (newast(ntl_IN,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4733 "M.tab.c"
    break;

  case 321: /* LIS: IS  */
#line 1938 "M.y"
    {
        //printf("->IS");
        (yyval.a) = (newast(ntl_IS,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4742 "M.tab.c"
    break;

  case 322: /* LIS: IS TLINE  */
#line 1943 "M.y"
    {
        printf("->Line IS");
        (yyval.a) = (newast(ntl_IS,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4751 "M.tab.c"
    break;

  case 323: /* LIF: IF  */
#line 1950 "M.y"
    {
        //printf("->IF");
        (yyval.a) = (newast(ntl_IF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4760 "M.tab.c"
    break;

  case 324: /* LIF: IF TLINE  */
#line 1955 "M.y"
    {
        printf("->Line IF");
        (yyval.a) = (newast(ntl_IF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4769 "M.tab.c"
    break;

  case 325: /* LHAVE: HAVE  */
#line 1962 "M.y"
    {
        //printf("->HAVE");
        (yyval.a) = (newast(ntl_HAVE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4778 "M.tab.c"
    break;

  case 326: /* LHAVE: HAVE TLINE  */
#line 1967 "M.y"
    {
        printf("->Line HAVE");
        (yyval.a) = (newast(ntl_HAVE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4787 "M.tab.c"
    break;

  case 327: /* LCONTINUE: CONTINUE  */
#line 1974 "M.y"
    {
        //printf("->CONTINUE");
        (yyval.a) = (newast(ntl_CONTINUE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4796 "M.tab.c"
    break;

  case 328: /* LCONTINUE: CONTINUE TLINE  */
#line 1979 "M.y"
    {
        printf("->Line CONTINUE");
        (yyval.a) = (newast(ntl_CONTINUE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4805 "M.tab.c"
    break;

  case 329: /* LUCONTINUE: UCONTINUE  */
#line 1986 "M.y"
    {
        //printf("->UCONTINUE");
        (yyval.a) = (newast(ntl_UCONTINUE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4814 "M.tab.c"
    break;

  case 330: /* LUCONTINUE: UCONTINUE TLINE  */
#line 1991 "M.y"
    {
        printf("->Line UCONTINUE");
        (yyval.a) = (newast(ntl_UCONTINUE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4823 "M.tab.c"
    break;

  case 331: /* LAUTO_CONC: AUTO_CONC  */
#line 1997 "M.y"
    {
        //printf("->AUTO_CONC");
        (yyval.a) = (newast(ntl_AUTO_CONC,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4832 "M.tab.c"
    break;

  case 332: /* LAUTO_CONC: AUTO_CONC TLINE  */
#line 2002 "M.y"
    {
        printf("->Line AUTO_CONC");
        (yyval.a) = (newast(ntl_AUTO_CONC,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4841 "M.tab.c"
    break;

  case 333: /* LAUTO_NOHINT: AUTO_NOHINT  */
#line 2009 "M.y"
    {
        //printf("->AUTO_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_NOHINT,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4850 "M.tab.c"
    break;

  case 334: /* LAUTO_NOHINT: AUTO_NOHINT TLINE  */
#line 2014 "M.y"
    {
        printf("->Line AUTO_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_NOHINT,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4859 "M.tab.c"
    break;

  case 335: /* LAUTO_BWD_NOHINT: AUTO_BWD_NOHINT  */
#line 2020 "M.y"
    {
        //printf("->AUTO_BWD_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_BWD_NOHINT,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4868 "M.tab.c"
    break;

  case 336: /* LAUTO_BWD_NOHINT: AUTO_BWD_NOHINT TLINE  */
#line 2025 "M.y"
    {
        printf("->Line AUTO_BWD_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_BWD_NOHINT,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4877 "M.tab.c"
    break;

  case 337: /* LBECAUSE: BECAUSE  */
#line 2031 "M.y"
    {
        //printf("->BECAUSE");
        (yyval.a) = (newast(ntl_BECAUSE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4886 "M.tab.c"
    break;

  case 338: /* LBECAUSE: BECAUSE TLINE  */
#line 2036 "M.y"
    {
        printf("->Line BECAUSE");
        (yyval.a) = (newast(ntl_BECAUSE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4895 "M.tab.c"
    break;

  case 339: /* TLBELONG: TBELONG  */
#line 2042 "M.y"
    {
        //printf("->TBELONG");
        (yyval.a) = (newast(ntl_TBELONG,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4904 "M.tab.c"
    break;

  case 340: /* TLBELONG: TBELONG TLINE  */
#line 2047 "M.y"
    {
        printf("->Line TBELONG");
        (yyval.a) = (newast(ntl_TBELONG,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4913 "M.tab.c"
    break;

  case 341: /* LMONOINC: MONOINC  */
#line 2053 "M.y"
    {
        //printf("->MONOINC");
        (yyval.a) = (newast(ntl_MONOINC,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4922 "M.tab.c"
    break;

  case 342: /* LMONOINC: MONOINC TLINE  */
#line 2058 "M.y"
    {
        printf("->Line MONOINC");
        (yyval.a) = (newast(ntl_MONOINC,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4931 "M.tab.c"
    break;

  case 343: /* LMONODEC: MONODEC  */
#line 2064 "M.y"
    {
        //printf("->MONODEC");
        (yyval.a) = (newast(ntl_MONODEC,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4940 "M.tab.c"
    break;

  case 344: /* LMONODEC: MONODEC TLINE  */
#line 2069 "M.y"
    {
        printf("->Line MONOINC");
        (yyval.a) = (newast(ntl_MONODEC,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4949 "M.tab.c"
    break;

  case 345: /* LPAP: PAP  */
#line 2075 "M.y"
    {
        //printf("->PAP");
        (yyval.a) = (newast(ntl_PAP,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4958 "M.tab.c"
    break;

  case 346: /* LPAP: PAP TLINE  */
#line 2080 "M.y"
    {
        printf("->Line PAP ");
        (yyval.a) = (newast(ntl_PAP,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4967 "M.tab.c"
    break;


#line 4971 "M.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 2085 "M.y"


void yyerror(char* s)
{
    fprintf(stderr , "%s\n",s);
}
