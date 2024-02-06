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
  YYSYMBOL_BOTH = 19,                      /* BOTH  */
  YYSYMBOL_Teq = 20,                       /* Teq  */
  YYSYMBOL_Tleq = 21,                      /* Tleq  */
  YYSYMBOL_Tgeq = 22,                      /* Tgeq  */
  YYSYMBOL_Tneq = 23,                      /* Tneq  */
  YYSYMBOL_Tequiv = 24,                    /* Tequiv  */
  YYSYMBOL_Tlt = 25,                       /* Tlt  */
  YYSYMBOL_Tgt = 26,                       /* Tgt  */
  YYSYMBOL_Deq = 27,                       /* Deq  */
  YYSYMBOL_Tlim = 28,                      /* Tlim  */
  YYSYMBOL_Tto = 29,                       /* Tto  */
  YYSYMBOL_Tinfty = 30,                    /* Tinfty  */
  YYSYMBOL_TPinfty = 31,                   /* TPinfty  */
  YYSYMBOL_TNinfty = 32,                   /* TNinfty  */
  YYSYMBOL_GOAL = 33,                      /* GOAL  */
  YYSYMBOL_MATH1 = 34,                     /* MATH1  */
  YYSYMBOL_MATH2 = 35,                     /* MATH2  */
  YYSYMBOL_PROOF = 36,                     /* PROOF  */
  YYSYMBOL_CODEBOX = 37,                   /* CODEBOX  */
  YYSYMBOL_QED = 38,                       /* QED  */
  YYSYMBOL_ASSUM = 39,                     /* ASSUM  */
  YYSYMBOL_GIVEN = 40,                     /* GIVEN  */
  YYSYMBOL_COMMA = 41,                     /* COMMA  */
  YYSYMBOL_PWP = 42,                       /* PWP  */
  YYSYMBOL_PAP = 43,                       /* PAP  */
  YYSYMBOL_CWP = 44,                       /* CWP  */
  YYSYMBOL_CAP = 45,                       /* CAP  */
  YYSYMBOL_CS = 46,                        /* CS  */
  YYSYMBOL_PS = 47,                        /* PS  */
  YYSYMBOL_KASaverage = 48,                /* KASaverage  */
  YYSYMBOL_KSGaverage = 49,                /* KSGaverage  */
  YYSYMBOL_KAGaverage = 50,                /* KAGaverage  */
  YYSYMBOL_REMEMBER = 51,                  /* REMEMBER  */
  YYSYMBOL_CONCLUDE = 52,                  /* CONCLUDE  */
  YYSYMBOL_EQUNADD = 53,                   /* EQUNADD  */
  YYSYMBOL_SINCE = 54,                     /* SINCE  */
  YYSYMBOL_TRANS = 55,                     /* TRANS  */
  YYSYMBOL_THEN = 56,                      /* THEN  */
  YYSYMBOL_SAME = 57,                      /* SAME  */
  YYSYMBOL_FOR = 58,                       /* FOR  */
  YYSYMBOL_LB1L = 59,                      /* LB1L  */
  YYSYMBOL_LB1R = 60,                      /* LB1R  */
  YYSYMBOL_LB2L = 61,                      /* LB2L  */
  YYSYMBOL_LB2R = 62,                      /* LB2R  */
  YYSYMBOL_LB3L = 63,                      /* LB3L  */
  YYSYMBOL_LB3R = 64,                      /* LB3R  */
  YYSYMBOL_ABS = 65,                       /* ABS  */
  YYSYMBOL_MIN = 66,                       /* MIN  */
  YYSYMBOL_LCEIL = 67,                     /* LCEIL  */
  YYSYMBOL_RCEIL = 68,                     /* RCEIL  */
  YYSYMBOL_LFLOOR = 69,                    /* LFLOOR  */
  YYSYMBOL_RFLOOR = 70,                    /* RFLOOR  */
  YYSYMBOL_LIM_DEF = 71,                   /* LIM_DEF  */
  YYSYMBOL_TO_PROVE = 72,                  /* TO_PROVE  */
  YYSYMBOL_INTROS = 73,                    /* INTROS  */
  YYSYMBOL_SUPPOSE = 74,                   /* SUPPOSE  */
  YYSYMBOL_SET = 75,                       /* SET  */
  YYSYMBOL_AUTO_CONC = 76,                 /* AUTO_CONC  */
  YYSYMBOL_AUTO_NOHINT = 77,               /* AUTO_NOHINT  */
  YYSYMBOL_USE = 78,                       /* USE  */
  YYSYMBOL_Tforall = 79,                   /* Tforall  */
  YYSYMBOL_Texists = 80,                   /* Texists  */
  YYSYMBOL_Tpower = 81,                    /* Tpower  */
  YYSYMBOL_BECAUSE = 82,                   /* BECAUSE  */
  YYSYMBOL_IN = 83,                        /* IN  */
  YYSYMBOL_IF = 84,                        /* IF  */
  YYSYMBOL_IS = 85,                        /* IS  */
  YYSYMBOL_HAVE = 86,                      /* HAVE  */
  YYSYMBOL_CONTINUE = 87,                  /* CONTINUE  */
  YYSYMBOL_CONTINUE_DEF = 88,              /* CONTINUE_DEF  */
  YYSYMBOL_UCONTINUE = 89,                 /* UCONTINUE  */
  YYSYMBOL_UC_DEF = 90,                    /* UC_DEF  */
  YYSYMBOL_FSqueeze = 91,                  /* FSqueeze  */
  YYSYMBOL_SUPRE_THEOREM = 92,             /* SUPRE_THEOREM  */
  YYSYMBOL_SUPRE_DEF = 93,                 /* SUPRE_DEF  */
  YYSYMBOL_BOUND_BELOW = 94,               /* BOUND_BELOW  */
  YYSYMBOL_BOUND_ABOVE = 95,               /* BOUND_ABOVE  */
  YYSYMBOL_MONOINC = 96,                   /* MONOINC  */
  YYSYMBOL_MONODEC = 97,                   /* MONODEC  */
  YYSYMBOL_TBELONG = 98,                   /* TBELONG  */
  YYSYMBOL_TLINE = 99,                     /* TLINE  */
  YYSYMBOL_YYACCEPT = 100,                 /* $accept  */
  YYSYMBOL_PROGRAM = 101,                  /* PROGRAM  */
  YYSYMBOL_STATEMENT = 102,                /* STATEMENT  */
  YYSYMBOL_PROOF_STATEMENT_LIST = 103,     /* PROOF_STATEMENT_LIST  */
  YYSYMBOL_PROOF_STATEMENT = 104,          /* PROOF_STATEMENT  */
  YYSYMBOL_MATH_EQUATION_LIST = 105,       /* MATH_EQUATION_LIST  */
  YYSYMBOL_GIVEN_STATEMENT = 106,          /* GIVEN_STATEMENT  */
  YYSYMBOL_GOAL_STATEMENT = 107,           /* GOAL_STATEMENT  */
  YYSYMBOL_ACTION_STATEMENT = 108,         /* ACTION_STATEMENT  */
  YYSYMBOL_MATH_EQUATION = 109,            /* MATH_EQUATION  */
  YYSYMBOL_EQUATION = 110,                 /* EQUATION  */
  YYSYMBOL_FUNC_EQUATION = 111,            /* FUNC_EQUATION  */
  YYSYMBOL_TEQ = 112,                      /* TEQ  */
  YYSYMBOL_CONTINUED_EQUATION = 113,       /* CONTINUED_EQUATION  */
  YYSYMBOL_CONTINUED_VAR = 114,            /* CONTINUED_VAR  */
  YYSYMBOL_LIM_HEAD = 115,                 /* LIM_HEAD  */
  YYSYMBOL_FUNC_HEAD = 116,                /* FUNC_HEAD  */
  YYSYMBOL_INTERVAL = 117,                 /* INTERVAL  */
  YYSYMBOL_EXPR = 118,                     /* EXPR  */
  YYSYMBOL_KNOWLEDGE = 119,                /* KNOWLEDGE  */
  YYSYMBOL_SINCE_CLAUSE = 120,             /* SINCE_CLAUSE  */
  YYSYMBOL_ACTION = 121,                   /* ACTION  */
  YYSYMBOL_MEMORY_TERM = 122,              /* MEMORY_TERM  */
  YYSYMBOL_EQS = 123,                      /* EQS  */
  YYSYMBOL_TLCONST = 124,                  /* TLCONST  */
  YYSYMBOL_TLVAR = 125,                    /* TLVAR  */
  YYSYMBOL_TLNUM = 126,                    /* TLNUM  */
  YYSYMBOL_TLsqrt = 127,                   /* TLsqrt  */
  YYSYMBOL_TLln = 128,                     /* TLln  */
  YYSYMBOL_TLderi = 129,                   /* TLderi  */
  YYSYMBOL_TLfrac = 130,                   /* TLfrac  */
  YYSYMBOL_TLeq = 131,                     /* TLeq  */
  YYSYMBOL_DLeq = 132,                     /* DLeq  */
  YYSYMBOL_TLleq = 133,                    /* TLleq  */
  YYSYMBOL_TLgeq = 134,                    /* TLgeq  */
  YYSYMBOL_TLlt = 135,                     /* TLlt  */
  YYSYMBOL_TLgt = 136,                     /* TLgt  */
  YYSYMBOL_TLneq = 137,                    /* TLneq  */
  YYSYMBOL_TLequiv = 138,                  /* TLequiv  */
  YYSYMBOL_TLlim = 139,                    /* TLlim  */
  YYSYMBOL_TLto = 140,                     /* TLto  */
  YYSYMBOL_TLinfty = 141,                  /* TLinfty  */
  YYSYMBOL_TLPinfty = 142,                 /* TLPinfty  */
  YYSYMBOL_TLNinfty = 143,                 /* TLNinfty  */
  YYSYMBOL_LGOAL = 144,                    /* LGOAL  */
  YYSYMBOL_LMATH1 = 145,                   /* LMATH1  */
  YYSYMBOL_LMATH2 = 146,                   /* LMATH2  */
  YYSYMBOL_LPROOF = 147,                   /* LPROOF  */
  YYSYMBOL_LQED = 148,                     /* LQED  */
  YYSYMBOL_LGIVEN = 149,                   /* LGIVEN  */
  YYSYMBOL_LSINCE = 150,                   /* LSINCE  */
  YYSYMBOL_LTRANS = 151,                   /* LTRANS  */
  YYSYMBOL_LUSE = 152,                     /* LUSE  */
  YYSYMBOL_LKASaverage = 153,              /* LKASaverage  */
  YYSYMBOL_LKSGaverage = 154,              /* LKSGaverage  */
  YYSYMBOL_LKAGaverage = 155,              /* LKAGaverage  */
  YYSYMBOL_LREMEMBER = 156,                /* LREMEMBER  */
  YYSYMBOL_LEQUNADD = 157,                 /* LEQUNADD  */
  YYSYMBOL_LCONCLUDE = 158,                /* LCONCLUDE  */
  YYSYMBOL_LTHEN = 159,                    /* LTHEN  */
  YYSYMBOL_LSAME = 160,                    /* LSAME  */
  YYSYMBOL_LLB1L = 161,                    /* LLB1L  */
  YYSYMBOL_LLB1R = 162,                    /* LLB1R  */
  YYSYMBOL_LLB2L = 163,                    /* LLB2L  */
  YYSYMBOL_LLB2R = 164,                    /* LLB2R  */
  YYSYMBOL_LLB3L = 165,                    /* LLB3L  */
  YYSYMBOL_LLB3R = 166,                    /* LLB3R  */
  YYSYMBOL_LABS = 167,                     /* LABS  */
  YYSYMBOL_LMIN = 168,                     /* LMIN  */
  YYSYMBOL_LLCEIL = 169,                   /* LLCEIL  */
  YYSYMBOL_LRCEIL = 170,                   /* LRCEIL  */
  YYSYMBOL_LLFLOOR = 171,                  /* LLFLOOR  */
  YYSYMBOL_LRFLOOR = 172,                  /* LRFLOOR  */
  YYSYMBOL_LLIM_DEF = 173,                 /* LLIM_DEF  */
  YYSYMBOL_LTO_PROVE = 174,                /* LTO_PROVE  */
  YYSYMBOL_TLsin = 175,                    /* TLsin  */
  YYSYMBOL_TLcos = 176,                    /* TLcos  */
  YYSYMBOL_TLsup = 177,                    /* TLsup  */
  YYSYMBOL_LCONTINUE_DEF = 178,            /* LCONTINUE_DEF  */
  YYSYMBOL_LUC_DEF = 179,                  /* LUC_DEF  */
  YYSYMBOL_LSUPRE_THEOREM = 180,           /* LSUPRE_THEOREM  */
  YYSYMBOL_LSUPRE_DEF = 181,               /* LSUPRE_DEF  */
  YYSYMBOL_LBOUND_BELOW = 182,             /* LBOUND_BELOW  */
  YYSYMBOL_LBOUND_ABOVE = 183,             /* LBOUND_ABOVE  */
  YYSYMBOL_LFSqueeze = 184,                /* LFSqueeze  */
  YYSYMBOL_LINTROS = 185,                  /* LINTROS  */
  YYSYMBOL_LSET = 186,                     /* LSET  */
  YYSYMBOL_LFOR = 187,                     /* LFOR  */
  YYSYMBOL_LDERI = 188,                    /* LDERI  */
  YYSYMBOL_LBOTH = 189,                    /* LBOTH  */
  YYSYMBOL_LCOMMA = 190,                   /* LCOMMA  */
  YYSYMBOL_TLforall = 191,                 /* TLforall  */
  YYSYMBOL_TLexists = 192,                 /* TLexists  */
  YYSYMBOL_LSUPPOSE = 193,                 /* LSUPPOSE  */
  YYSYMBOL_LIN = 194,                      /* LIN  */
  YYSYMBOL_LIS = 195,                      /* LIS  */
  YYSYMBOL_LIF = 196,                      /* LIF  */
  YYSYMBOL_LHAVE = 197,                    /* LHAVE  */
  YYSYMBOL_LCONTINUE = 198,                /* LCONTINUE  */
  YYSYMBOL_LUCONTINUE = 199,               /* LUCONTINUE  */
  YYSYMBOL_LAUTO_CONC = 200,               /* LAUTO_CONC  */
  YYSYMBOL_LAUTO_NOHINT = 201,             /* LAUTO_NOHINT  */
  YYSYMBOL_LBECAUSE = 202,                 /* LBECAUSE  */
  YYSYMBOL_TLBELONG = 203,                 /* TLBELONG  */
  YYSYMBOL_LMONOINC = 204,                 /* LMONOINC  */
  YYSYMBOL_LMONODEC = 205,                 /* LMONODEC  */
  YYSYMBOL_LPAP = 206                      /* LPAP  */
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
#define YYFINAL  60
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1019

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  100
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  107
/* YYNRULES -- Number of rules.  */
#define YYNRULES  307
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  514

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   354


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
      95,    96,    97,    98,    99
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    68,    68,    74,    84,    89,    94,    99,   107,   112,
     118,   124,   132,   137,   143,   149,   154,   160,   166,   172,
     177,   182,   191,   197,   205,   213,   220,   226,   232,   238,
     243,   249,   261,   266,   271,   276,   281,   286,   291,   296,
     301,   306,   311,   317,   322,   327,   332,   337,   342,   347,
     352,   357,   362,   367,   372,   377,   382,   387,   392,   397,
     402,   407,   416,   424,   430,   436,   442,   451,   456,   461,
     466,   471,   476,   481,   488,   494,   502,   507,   514,   519,
     524,   529,   536,   543,   548,   553,   558,   563,   568,   573,
     578,   587,   592,   597,   602,   607,   612,   617,   622,   627,
     632,   637,   642,   647,   652,   657,   662,   667,   672,   677,
     682,   687,   693,   698,   703,   708,   713,   718,   723,   733,
     738,   743,   748,   753,   758,   763,   768,   773,   780,   785,
     791,   797,   802,   807,   812,   817,   822,   830,   836,   845,
     852,   857,   865,   870,   877,   882,   889,   894,   903,   908,
     915,   920,   927,   932,   939,   944,   951,   956,   963,   968,
     975,   980,   987,   992,   999,  1004,  1011,  1016,  1023,  1028,
    1035,  1040,  1047,  1052,  1059,  1064,  1071,  1076,  1083,  1088,
    1095,  1100,  1107,  1112,  1120,  1125,  1132,  1137,  1144,  1149,
    1156,  1161,  1170,  1175,  1183,  1188,  1195,  1200,  1207,  1212,
    1219,  1224,  1231,  1236,  1243,  1248,  1255,  1260,  1267,  1272,
    1279,  1284,  1291,  1296,  1303,  1308,  1315,  1320,  1327,  1332,
    1339,  1344,  1351,  1356,  1363,  1368,  1375,  1380,  1387,  1392,
    1399,  1404,  1411,  1416,  1423,  1428,  1435,  1440,  1447,  1452,
    1459,  1464,  1471,  1476,  1483,  1488,  1495,  1500,  1507,  1512,
    1519,  1524,  1531,  1536,  1543,  1548,  1555,  1560,  1567,  1572,
    1579,  1584,  1591,  1596,  1602,  1607,  1615,  1620,  1627,  1632,
    1639,  1644,  1651,  1656,  1663,  1668,  1675,  1680,  1687,  1692,
    1699,  1704,  1711,  1716,  1723,  1728,  1735,  1740,  1747,  1752,
    1759,  1764,  1771,  1776,  1782,  1787,  1794,  1799,  1805,  1810,
    1816,  1821,  1827,  1832,  1838,  1843,  1849,  1854
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
  "Tsin", "Tcos", "Tsup", "Tln", "Tderi", "DERI", "BOTH", "Teq", "Tleq",
  "Tgeq", "Tneq", "Tequiv", "Tlt", "Tgt", "Deq", "Tlim", "Tto", "Tinfty",
  "TPinfty", "TNinfty", "GOAL", "MATH1", "MATH2", "PROOF", "CODEBOX",
  "QED", "ASSUM", "GIVEN", "COMMA", "PWP", "PAP", "CWP", "CAP", "CS", "PS",
  "KASaverage", "KSGaverage", "KAGaverage", "REMEMBER", "CONCLUDE",
  "EQUNADD", "SINCE", "TRANS", "THEN", "SAME", "FOR", "LB1L", "LB1R",
  "LB2L", "LB2R", "LB3L", "LB3R", "ABS", "MIN", "LCEIL", "RCEIL", "LFLOOR",
  "RFLOOR", "LIM_DEF", "TO_PROVE", "INTROS", "SUPPOSE", "SET", "AUTO_CONC",
  "AUTO_NOHINT", "USE", "Tforall", "Texists", "Tpower", "BECAUSE", "IN",
  "IF", "IS", "HAVE", "CONTINUE", "CONTINUE_DEF", "UCONTINUE", "UC_DEF",
  "FSqueeze", "SUPRE_THEOREM", "SUPRE_DEF", "BOUND_BELOW", "BOUND_ABOVE",
  "MONOINC", "MONODEC", "TBELONG", "TLINE", "$accept", "PROGRAM",
  "STATEMENT", "PROOF_STATEMENT_LIST", "PROOF_STATEMENT",
  "MATH_EQUATION_LIST", "GIVEN_STATEMENT", "GOAL_STATEMENT",
  "ACTION_STATEMENT", "MATH_EQUATION", "EQUATION", "FUNC_EQUATION", "TEQ",
  "CONTINUED_EQUATION", "CONTINUED_VAR", "LIM_HEAD", "FUNC_HEAD",
  "INTERVAL", "EXPR", "KNOWLEDGE", "SINCE_CLAUSE", "ACTION", "MEMORY_TERM",
  "EQS", "TLCONST", "TLVAR", "TLNUM", "TLsqrt", "TLln", "TLderi", "TLfrac",
  "TLeq", "DLeq", "TLleq", "TLgeq", "TLlt", "TLgt", "TLneq", "TLequiv",
  "TLlim", "TLto", "TLinfty", "TLPinfty", "TLNinfty", "LGOAL", "LMATH1",
  "LMATH2", "LPROOF", "LQED", "LGIVEN", "LSINCE", "LTRANS", "LUSE",
  "LKASaverage", "LKSGaverage", "LKAGaverage", "LREMEMBER", "LEQUNADD",
  "LCONCLUDE", "LTHEN", "LSAME", "LLB1L", "LLB1R", "LLB2L", "LLB2R",
  "LLB3L", "LLB3R", "LABS", "LMIN", "LLCEIL", "LRCEIL", "LLFLOOR",
  "LRFLOOR", "LLIM_DEF", "LTO_PROVE", "TLsin", "TLcos", "TLsup",
  "LCONTINUE_DEF", "LUC_DEF", "LSUPRE_THEOREM", "LSUPRE_DEF",
  "LBOUND_BELOW", "LBOUND_ABOVE", "LFSqueeze", "LINTROS", "LSET", "LFOR",
  "LDERI", "LBOTH", "LCOMMA", "TLforall", "TLexists", "LSUPPOSE", "LIN",
  "LIS", "LIF", "LHAVE", "LCONTINUE", "LUCONTINUE", "LAUTO_CONC",
  "LAUTO_NOHINT", "LBECAUSE", "TLBELONG", "LMONOINC", "LMONODEC", "LPAP", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-332)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     937,   -63,   -53,   -47,    -6,    33,    48,    57,    67,    70,
      75,    77,    89,   121,   134,   141,   144,    68,   937,  -332,
      72,  -332,  -332,    64,   165,   142,   154,   202,   151,  -332,
    -332,   151,   250,    99,  -332,   248,    26,   251,    29,   151,
    -332,  -332,   151,   151,  -332,  -332,  -332,  -332,  -332,  -332,
    -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,
    -332,  -332,   170,   852,   171,   852,   177,   179,   181,   182,
     183,   187,   196,  -332,  -332,    53,   -42,   760,   760,   151,
     263,   263,   151,   288,  -332,   203,  -332,  -332,  -332,   151,
     204,   205,   207,   208,   211,   213,   216,  -332,  -332,   -26,
     690,   690,  -332,  -332,  -332,   248,  -332,  -332,  -332,  -332,
     218,   227,   229,   229,   229,   228,   269,  -332,   251,   313,
     236,   237,   251,  -332,  -332,  -332,    64,  -332,  -332,  -332,
     282,  -332,  -332,  -332,  -332,  -332,  -332,  -332,   256,   266,
     271,   151,  -332,  -332,   274,   284,   251,   251,   289,   293,
     294,   297,   298,   301,   309,   311,   312,   315,   316,   326,
     263,   263,    64,   320,   263,   397,  -332,   114,  -332,    87,
      64,    64,    64,   849,   938,   938,   938,   290,    64,    64,
      64,    64,    64,   251,   251,   327,   327,   320,   327,   501,
     114,   251,   251,   331,   938,   938,   307,   329,   331,  -332,
    -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,   333,
    -332,   263,   561,   561,   327,   269,  -332,  -332,   335,  -332,
    -332,  -332,  -332,   338,  -332,   263,   339,   194,  -332,  -332,
     369,   852,   340,   852,  -332,  -332,  -332,   122,   760,  -332,
    -332,   366,  -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,
    -332,  -332,  -332,  -332,  -332,  -332,  -332,   938,   347,   938,
    -332,   938,   938,   938,   938,   355,   357,   362,   367,   368,
     370,    64,   938,  -332,  -332,  -332,  -332,  -332,  -332,  -332,
     116,   376,   290,   251,   938,   938,   938,   938,   251,   938,
     378,  -332,   343,    40,    72,   623,   349,   264,    84,   283,
     938,   938,   938,   938,   938,   938,   263,   251,   263,  -332,
    -332,   938,  -332,   251,   327,   327,   380,   154,   434,   434,
     151,  -332,   154,  -332,  -332,  -332,  -332,  -332,  -332,   151,
    -332,   938,   938,  -332,   282,  -332,  -332,  -332,  -332,   397,
     383,  -332,   264,  -332,   434,    35,   404,   404,    35,  -332,
    -332,  -332,  -332,  -332,  -332,   938,  -332,  -332,   501,   388,
     127,   389,   393,   263,   354,  -332,  -332,  -332,   251,   263,
     290,   450,   264,   264,   264,   457,   258,  -332,   476,   873,
     938,   258,   873,    64,   151,   151,  -332,   349,   264,   264,
     264,   264,   264,   151,  -332,    28,   455,   327,   151,   151,
    -332,  -332,    28,    28,  -332,  -332,  -332,   434,   455,   852,
     387,  -332,  -332,  -332,   264,  -332,   401,  -332,  -332,  -332,
    -332,   938,   406,  -332,   366,  -332,    64,  -332,  -332,    64,
     407,   784,  -332,  -332,   408,   494,   366,   494,   494,   366,
     938,   282,   282,   938,   428,   443,  -332,  -332,  -332,  -332,
    -332,   151,  -332,  -332,  -332,  -332,  -332,   151,  -332,   151,
    -332,  -332,  -332,  -332,  -332,  -332,  -332,   434,  -332,  -332,
     938,   938,  -332,   417,   264,   282,   282,   282,  -332,  -332,
    -332,  -332,  -332,  -332,  -332,  -332,  -332,   264,  -332,  -332,
     258,   419,  -332,   420,  -332,  -332,  -332,  -332,   156,   264,
     264,  -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,  -332,
    -332,  -332,  -332,  -332
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int16 yydefact[] =
{
       0,   272,   182,   188,   190,   192,   306,   194,   214,   220,
     264,   280,   266,   294,   296,   198,   298,     0,     2,     6,
       8,     5,     4,    19,     0,     0,   140,     0,     0,     7,
      12,     0,     0,     0,   131,     0,     0,     0,     0,     0,
     138,   132,     0,     0,   273,   183,   189,   191,   193,   307,
     195,   215,   221,   265,   281,   267,   295,   297,   199,   299,
       1,     3,   274,     0,   224,     0,   144,   184,   186,   212,
     276,   278,   286,    20,    38,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   141,   208,   137,    25,    24,    22,
     200,   202,   204,   240,   262,   254,   256,   129,   128,     0,
       0,     0,   119,   120,   121,     0,   127,   126,   125,   124,
     250,   252,     0,     0,     0,   146,     0,    26,     0,     0,
     270,   268,     0,   134,    29,   136,     0,   275,     9,   225,
       0,   145,   185,   187,   213,   277,   279,   287,   282,   290,
     292,     0,    50,    53,   216,   300,     0,     0,   142,   154,
     148,   244,   246,   248,   150,   172,   228,   230,   232,   236,
       0,     0,     0,   116,     0,     0,    92,    91,    93,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   116,     0,     0,
      91,     0,     0,    21,     0,     0,     0,   210,     0,    15,
     209,    23,   201,   203,   205,   241,   263,   255,   257,   196,
     133,     0,     0,     0,     0,     0,   251,   253,   242,    16,
      17,    18,   147,   222,   139,     0,   156,     0,   271,   269,
       0,     0,   226,     0,   283,   291,   293,     0,     0,   217,
     301,     0,    61,   143,   155,   149,   245,   247,   249,   151,
     173,   229,   231,   233,   237,    32,    35,     0,   158,     0,
      36,     0,     0,     0,     0,   160,   162,   168,   170,   164,
     166,     0,     0,    67,    68,    69,    72,    73,    70,    71,
       0,   152,     0,     0,     0,     0,     0,     0,     0,     0,
     180,   116,     0,    91,     0,     0,     0,     0,    91,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,    33,
      34,     0,    37,     0,     0,     0,   206,     0,     0,     0,
       0,   211,     0,   197,   122,   123,   130,   243,   223,    28,
     157,     0,     0,   135,     0,   227,    11,    49,    52,     0,
     218,    82,     0,   159,     0,    96,    99,    98,    97,   161,
     163,   169,   171,   165,   167,     0,    74,    75,    62,   284,
     288,   302,   304,     0,     0,    54,    55,   153,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   181,   107,     0,
       0,     0,     0,     0,     0,     0,    95,     0,     0,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
     207,    13,     0,     0,    58,    14,    27,     0,     0,     0,
       0,   219,   111,    64,     0,   285,   260,   289,    59,   303,
     305,     0,   258,    60,     0,    66,     0,   100,   102,     0,
     174,     0,    94,   108,   178,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   103,   104,   105,    39,
      40,     0,    63,    65,    41,    42,    46,     0,    44,     0,
      30,    31,    10,    48,    51,   114,   261,     0,   259,   109,
       0,     0,   175,   176,     0,     0,     0,     0,   179,    83,
      85,    87,    89,    90,    84,    86,    88,     0,   118,   117,
       0,   234,   112,   238,   113,    43,    47,    45,     0,     0,
       0,   177,    81,    78,    80,    79,   106,   115,   235,   239,
      57,    56,   101,   110
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -332,   502,  -332,   -23,  -332,   -87,  -332,  -332,  -332,    96,
     -75,  -332,  -332,   -56,  -161,  -332,    -4,   -30,   276,   -18,
    -332,  -332,  -196,   503,  -332,   -24,   -10,  -332,  -332,   150,
    -332,   411,  -126,  -332,  -332,  -332,  -332,  -332,  -332,  -332,
    -332,  -332,  -331,   101,  -332,   -31,     5,  -332,  -332,  -332,
    -332,  -332,  -332,  -332,  -332,  -332,   345,  -332,  -332,   516,
    -332,   147,  -232,   -11,  -199,   -17,   200,   -38,  -332,  -332,
    -332,  -332,  -332,   511,   149,  -332,  -332,  -332,  -332,  -332,
    -332,  -332,    47,    51,  -332,  -332,  -332,  -332,   321,  -332,
    -210,     3,    14,  -284,  -332,  -332,  -332,  -332,  -227,  -226,
    -332,  -332,  -332,  -332,  -332,  -332,  -332
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,    17,    18,    19,    20,    88,    21,    22,    23,    89,
     160,    74,   272,   161,   306,   162,   291,   164,   165,   211,
      24,    25,    26,    27,   166,   293,   168,   169,   170,   282,
     171,   273,   259,   274,   275,   276,   277,   278,   279,   172,
     431,   475,   436,   294,    28,    77,    78,    29,    30,    31,
      32,   210,    33,   102,   103,   104,   317,    86,   199,    79,
      34,   295,   378,    35,   224,   175,   233,   176,   177,   178,
     492,   179,   494,   106,   219,   180,   181,   182,   113,   114,
     107,   108,   423,   418,   109,    36,    37,   122,   123,    38,
      63,    80,    81,    39,   141,   363,    82,   364,   142,   143,
      40,    41,    42,   147,   365,   366,    43
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      76,   100,   201,   185,    76,   118,    65,    76,    99,   341,
     337,   338,   117,   119,    98,    76,   326,   144,    76,    76,
      75,   105,   186,   308,    75,   116,   185,    75,    75,   209,
     314,   315,    66,   144,    66,    75,    44,   101,    75,    75,
     128,   283,   130,   262,   263,   186,    45,   120,   188,   194,
     195,   439,    46,   167,   190,    76,   145,   281,    76,    76,
      67,   311,    67,    68,   313,    76,   174,   174,    60,   212,
     212,   188,   145,   163,   187,    75,   167,   190,    75,    75,
     183,   191,   379,   214,   380,    75,   382,   121,   385,   174,
     174,   184,   192,    47,   225,   215,   163,   187,   230,   144,
     476,   281,    11,   183,   191,   213,   213,    70,    71,   231,
     238,   451,    72,    62,   184,   192,   271,    76,   457,   459,
      73,   401,   241,   242,    87,    62,   405,    64,    97,   255,
     256,   281,    48,   260,   280,   124,   138,    75,   125,   126,
     139,   258,   140,   144,   432,   257,   394,    49,     9,   156,
      64,   298,   285,   286,   287,   288,    50,    66,   284,   307,
     307,   301,   302,   303,   304,   305,    51,   307,   307,    52,
      93,    66,   426,   144,    53,   193,    54,   443,   196,   198,
     324,   212,   212,   463,   464,    67,    68,   110,    55,   111,
     309,   310,   469,   312,   329,   214,   331,   356,    69,    67,
      68,   359,   360,   479,   481,   482,   484,   486,   334,   139,
     336,   140,   361,   362,   167,     9,   357,   213,   213,   325,
      56,    69,   416,   146,   173,   173,   417,   174,    67,    68,
      70,    71,   332,    57,   163,    72,   480,   237,   483,   485,
      58,   183,   406,    59,    70,    71,   146,   173,   173,    72,
     422,   416,   184,   115,   355,    85,    66,    66,   507,   370,
     384,   386,   220,   221,   375,   261,   262,   263,   264,   127,
     129,   261,   262,   263,   264,   393,   131,   395,   132,   369,
     133,   134,   135,   307,    67,    68,   136,   402,   403,   370,
     261,   262,   263,   264,    66,   137,    76,    67,    90,    91,
      92,   218,   200,   202,   203,    76,   204,   205,   410,   397,
     206,     9,   207,   413,   146,   208,    75,   216,   340,   398,
     399,    93,    67,    68,   300,    75,   217,   222,   232,    70,
      71,   223,   421,   226,    72,   228,   229,   146,   425,   271,
     197,    94,    95,    96,   424,   271,   232,   258,   156,   144,
     261,   262,   263,   264,   189,   234,   261,   262,   263,   264,
      76,    76,    68,   320,   271,   235,   440,    70,    71,    76,
     236,    76,    72,   239,    76,    76,   460,   189,    76,    76,
      75,    75,   316,   240,    62,   173,   462,   120,   243,    75,
      62,    75,   244,   245,    75,    75,   246,   247,    75,    75,
     248,   452,   453,   340,   261,   262,   263,   264,   249,   470,
     250,   251,   471,   461,   252,   253,   404,   226,   265,   266,
     267,   268,   269,   270,   271,   254,   340,    76,   321,   368,
     271,    67,   323,    76,   327,    76,   498,   328,   330,   335,
     146,   261,   262,   263,   264,   146,   343,    75,   422,   292,
     296,   297,   299,    75,   349,    75,   350,   261,   262,   263,
     264,   351,   261,   262,   263,   264,   352,   353,    67,   354,
     318,   319,   359,   360,   139,   367,   140,   377,   271,   400,
     441,   442,   411,   361,   362,   271,   430,   415,   419,   449,
      68,   450,   420,   281,   454,   455,   491,   383,   456,   458,
     466,   261,   262,   263,   264,   468,   472,   478,   261,   262,
     263,   264,   223,   493,   339,   271,   501,   146,   508,   509,
      61,   226,   265,   266,   267,   268,   269,   270,   433,    84,
     227,   271,   477,   342,   409,   344,   271,   345,   346,   347,
     348,    83,   412,   322,   112,   510,     0,   495,   358,   511,
       0,   333,     0,   496,   340,   497,   223,     0,     0,     0,
     371,   372,   373,   374,     0,   376,     0,     0,     0,     0,
       0,   381,   427,   428,   429,   271,   387,   388,   389,   390,
     391,   392,   271,     0,     0,     0,     0,   396,   444,   445,
     446,   447,   448,     0,     0,    67,    68,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   407,   408,    90,
      91,    92,     0,     0,   465,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   148,     0,   115,    66,
       0,   414,    93,   289,   149,   150,   151,   152,   153,   154,
       0,   488,   489,     0,     0,     0,     0,     0,     0,     0,
       0,   155,    94,    95,    96,   435,   437,     0,   438,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   502,   503,   504,   505,     0,     0,
       0,     0,   144,     0,     0,     0,    64,   506,   156,   157,
     158,     0,   159,   148,     0,   115,    66,   467,     0,   512,
     513,   149,   150,   151,   152,   153,   154,   474,     0,     0,
       0,     0,     0,     0,     0,     0,   487,     0,   155,   490,
       0,     0,     0,     0,    67,    68,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    90,    91,
      92,     0,     0,     0,     0,     0,   499,   500,     0,   144,
       0,     9,     0,    64,     0,   156,   157,   158,     0,   159,
       0,    93,     0,   148,     0,   115,    66,     0,     0,    70,
      71,   149,   150,   151,   152,   153,   154,     0,     0,     0,
       0,    94,    95,    96,     0,     0,     0,   148,   155,   115,
      66,     0,     0,     0,     0,   149,   150,   151,   152,   153,
     154,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   155,     0,   473,   434,   290,     0,     0,   144,
       0,     9,     0,    64,     0,   156,   157,   158,     0,   159,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    70,
      71,     0,     0,   144,     0,     0,     0,    64,     0,   156,
     157,   158,   148,   159,   115,    66,     0,     0,     0,   289,
     149,   150,   151,   152,   153,   154,     0,     0,     0,     0,
       0,     1,     0,     0,     0,     0,   148,   155,   115,    66,
       0,   290,     0,     0,   149,   150,   151,   152,   153,   154,
       4,     0,     0,     0,     0,     6,     0,     0,     0,     0,
       0,   155,     0,     0,   434,     0,     7,     0,   144,     8,
       0,     0,    64,     9,   156,   157,   158,     0,   159,     0,
       0,     0,     0,     0,     0,    10,    11,    12,    13,    14,
      15,     0,   144,     0,    16,     0,    64,     0,   156,   157,
     158,   148,   159,   115,    66,     0,     0,     0,     0,   149,
     150,   151,   152,   153,   154,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   155,     0,     0,     0,
       2,     0,     0,     3,     0,     4,     0,     5,     0,     0,
       6,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     7,     0,     0,     8,     0,     0,   144,     9,     0,
       0,    64,     0,   156,   157,   158,     0,   159,     0,     0,
      10,    11,    12,    13,    14,    15,     0,     0,     0,    16
};

static const yytype_int16 yycheck[] =
{
      24,    32,    89,    78,    28,    36,    23,    31,    32,   241,
     237,   237,    36,    37,    32,    39,   215,    59,    42,    43,
      24,    32,    78,   184,    28,    35,   101,    31,    32,    55,
     191,   192,     6,    59,     6,    39,    99,    32,    42,    43,
      63,   167,    65,     8,     9,   101,    99,    18,    78,    80,
      81,   382,    99,    77,    78,    79,    98,    17,    82,    83,
      34,   187,    34,    35,   190,    89,    77,    78,     0,   100,
     101,   101,    98,    77,    78,    79,   100,   101,    82,    83,
      77,    78,   292,   101,   294,    89,   296,    58,   298,   100,
     101,    77,    78,    99,   118,   105,   100,   101,   122,    59,
     431,    17,    74,   100,   101,   100,   101,    79,    80,   126,
     141,   395,    84,    41,   100,   101,    81,   141,   402,   403,
      24,   317,   146,   147,    28,    41,   322,    63,    32,   160,
     161,    17,    99,   164,   165,    39,    83,   141,    42,    43,
      87,    27,    89,    59,   376,   162,   307,    99,    61,    65,
      63,   175,   169,   170,   171,   172,    99,     6,   169,   183,
     184,   178,   179,   180,   181,   182,    99,   191,   192,    99,
      71,     6,   371,    59,    99,    79,    99,   387,    82,    83,
     211,   212,   213,   410,   410,    34,    35,    88,    99,    90,
     185,   186,   424,   188,   225,   213,   227,   272,    56,    34,
      35,    85,    86,   435,   436,   437,   438,   439,   231,    87,
     233,    89,    96,    97,   238,    61,   272,   212,   213,   214,
      99,    56,    95,    76,    77,    78,    99,   238,    34,    35,
      79,    80,   227,    99,   238,    84,   435,   141,   437,   438,
      99,   238,   329,    99,    79,    80,    99,   100,   101,    84,
      94,    95,   238,     5,   271,    53,     6,     6,   490,   283,
     298,   299,   113,   114,   288,     7,     8,     9,    10,    99,
      99,     7,     8,     9,    10,   306,    99,   308,    99,   283,
      99,    99,    99,   307,    34,    35,    99,   318,   319,   313,
       7,     8,     9,    10,     6,    99,   320,    34,    48,    49,
      50,    72,    99,    99,    99,   329,    99,    99,   339,   313,
      99,    61,    99,   344,   167,    99,   320,    99,    60,   314,
     315,    71,    34,    35,   177,   329,    99,    99,    64,    79,
      80,    62,   363,    20,    84,    99,    99,   190,   369,    81,
      52,    91,    92,    93,   368,    81,    64,    27,    65,    59,
       7,     8,     9,    10,    78,    99,     7,     8,     9,    10,
     384,   385,    35,    56,    81,    99,   383,    79,    80,   393,
      99,   395,    84,    99,   398,   399,   407,   101,   402,   403,
     384,   385,    51,    99,    41,   238,   409,    18,    99,   393,
      41,   395,    99,    99,   398,   399,    99,    99,   402,   403,
      99,   396,   397,    60,     7,     8,     9,    10,    99,   426,
      99,    99,   429,   408,    99,    99,   320,    20,    21,    22,
      23,    24,    25,    26,    81,    99,    60,   451,    99,   282,
      81,    34,    99,   457,    99,   459,   467,    99,    99,    99,
     293,     7,     8,     9,    10,   298,    99,   451,    94,   173,
     174,   175,   176,   457,    99,   459,    99,     7,     8,     9,
      10,    99,     7,     8,     9,    10,    99,    99,    34,    99,
     194,   195,    85,    86,    87,    99,    89,    99,    81,    99,
     384,   385,    99,    96,    97,    81,    29,    99,    99,   393,
      35,   395,    99,    17,   398,   399,    68,   297,   402,   403,
      99,     7,     8,     9,    10,    99,    99,    99,     7,     8,
       9,    10,    62,    70,   238,    81,    99,   370,    99,    99,
      18,    20,    21,    22,    23,    24,    25,    26,   378,    26,
     119,    81,   431,   257,   334,   259,    81,   261,   262,   263,
     264,    25,   342,   198,    33,   498,    -1,   451,   272,   498,
      -1,   230,    -1,   457,    60,   459,    62,    -1,    -1,    -1,
     284,   285,   286,   287,    -1,   289,    -1,    -1,    -1,    -1,
      -1,   295,   372,   373,   374,    81,   300,   301,   302,   303,
     304,   305,    81,    -1,    -1,    -1,    -1,   311,   388,   389,
     390,   391,   392,    -1,    -1,    34,    35,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   331,   332,    48,
      49,    50,    -1,    -1,   414,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,     5,     6,
      -1,   355,    71,    10,    11,    12,    13,    14,    15,    16,
      -1,   441,   442,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    91,    92,    93,   379,   380,    -1,   382,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   474,   475,   476,   477,    -1,    -1,
      -1,    -1,    59,    -1,    -1,    -1,    63,   487,    65,    66,
      67,    -1,    69,     3,    -1,     5,     6,   421,    -1,   499,
     500,    11,    12,    13,    14,    15,    16,   431,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   440,    -1,    28,   443,
      -1,    -1,    -1,    -1,    34,    35,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,   470,   471,    -1,    59,
      -1,    61,    -1,    63,    -1,    65,    66,    67,    -1,    69,
      -1,    71,    -1,     3,    -1,     5,     6,    -1,    -1,    79,
      80,    11,    12,    13,    14,    15,    16,    -1,    -1,    -1,
      -1,    91,    92,    93,    -1,    -1,    -1,     3,    28,     5,
       6,    -1,    -1,    -1,    -1,    11,    12,    13,    14,    15,
      16,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    30,    31,    32,    -1,    -1,    59,
      -1,    61,    -1,    63,    -1,    65,    66,    67,    -1,    69,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    79,
      80,    -1,    -1,    59,    -1,    -1,    -1,    63,    -1,    65,
      66,    67,     3,    69,     5,     6,    -1,    -1,    -1,    10,
      11,    12,    13,    14,    15,    16,    -1,    -1,    -1,    -1,
      -1,    19,    -1,    -1,    -1,    -1,     3,    28,     5,     6,
      -1,    32,    -1,    -1,    11,    12,    13,    14,    15,    16,
      38,    -1,    -1,    -1,    -1,    43,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    31,    -1,    54,    -1,    59,    57,
      -1,    -1,    63,    61,    65,    66,    67,    -1,    69,    -1,
      -1,    -1,    -1,    -1,    -1,    73,    74,    75,    76,    77,
      78,    -1,    59,    -1,    82,    -1,    63,    -1,    65,    66,
      67,     3,    69,     5,     6,    -1,    -1,    -1,    -1,    11,
      12,    13,    14,    15,    16,    -1,    19,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      33,    -1,    -1,    36,    -1,    38,    -1,    40,    -1,    -1,
      43,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    54,    -1,    -1,    57,    -1,    -1,    59,    61,    -1,
      -1,    63,    -1,    65,    66,    67,    -1,    69,    -1,    -1,
      73,    74,    75,    76,    77,    78,    -1,    -1,    -1,    82
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    19,    33,    36,    38,    40,    43,    54,    57,    61,
      73,    74,    75,    76,    77,    78,    82,   101,   102,   103,
     104,   106,   107,   108,   120,   121,   122,   123,   144,   147,
     148,   149,   150,   152,   160,   163,   185,   186,   189,   193,
     200,   201,   202,   206,    99,    99,    99,    99,    99,    99,
      99,    99,    99,    99,    99,    99,    99,    99,    99,    99,
       0,   101,    41,   190,    63,   165,     6,    34,    35,    56,
      79,    80,    84,   109,   111,   116,   125,   145,   146,   159,
     191,   192,   196,   159,   123,    53,   157,   109,   105,   109,
      48,    49,    50,    71,    91,    92,    93,   109,   119,   125,
     145,   146,   153,   154,   155,   163,   173,   180,   181,   184,
      88,    90,   173,   178,   179,     5,   126,   125,   145,   125,
      18,    58,   187,   188,   109,   109,   109,    99,   103,    99,
     103,    99,    99,    99,    99,    99,    99,    99,    83,    87,
      89,   194,   198,   199,    59,    98,   161,   203,     3,    11,
      12,    13,    14,    15,    16,    28,    65,    66,    67,    69,
     110,   113,   115,   116,   117,   118,   124,   125,   126,   127,
     128,   130,   139,   161,   163,   165,   167,   168,   169,   171,
     175,   176,   177,   191,   192,   110,   113,   116,   117,   118,
     125,   191,   192,   109,   145,   145,   109,    52,   109,   158,
      99,   105,    99,    99,    99,    99,    99,    99,    99,    55,
     151,   119,   145,   146,   119,   126,    99,    99,    72,   174,
     174,   174,    99,    62,   164,   125,    20,   131,    99,    99,
     125,   165,    64,   166,    99,    99,    99,   109,   145,    99,
      99,   125,   125,    99,    99,    99,    99,    99,    99,    99,
      99,    99,    99,    99,    99,   145,   145,   165,    27,   132,
     145,     7,     8,     9,    10,    21,    22,    23,    24,    25,
      26,    81,   112,   131,   133,   134,   135,   136,   137,   138,
     145,    17,   129,   132,   163,   165,   165,   165,   165,    10,
      32,   116,   118,   125,   143,   161,   118,   118,   125,   118,
     161,   165,   165,   165,   165,   165,   114,   125,   114,   146,
     146,   132,   146,   132,   114,   114,    51,   156,   118,   118,
      56,    99,   156,    99,   145,   146,   164,    99,    99,   145,
      99,   145,   146,   188,   103,    99,   103,   198,   199,   118,
      60,   162,   118,    99,   118,   118,   118,   118,   118,    99,
      99,    99,    99,    99,    99,   165,   110,   113,   118,    85,
      86,    96,    97,   195,   197,   204,   205,    99,   161,   116,
     125,   118,   118,   118,   118,   125,   118,    99,   162,   190,
     190,   118,   190,   166,   167,   190,   167,   118,   118,   118,
     118,   118,   118,   145,   114,   145,   118,   116,   146,   146,
      99,   122,   145,   145,   109,   122,   105,   118,   118,   166,
     145,    99,   166,   145,   118,    99,    95,    99,   183,    99,
      99,   145,    94,   182,   125,   145,   164,   166,   166,   166,
      29,   140,   162,   129,    31,   118,   142,   118,   118,   142,
     165,   109,   109,   190,   166,   166,   166,   166,   166,   109,
     109,   193,   146,   146,   109,   109,   109,   193,   109,   193,
     145,   146,   103,   198,   199,   166,    99,   118,    99,   162,
     165,   165,    99,    30,   118,   141,   142,   143,    99,   162,
     164,   162,   162,   164,   162,   164,   162,   118,   166,   166,
     118,    68,   170,    70,   172,   109,   109,   109,   145,   118,
     118,    99,   166,   166,   166,   166,   166,   162,    99,    99,
     182,   183,   166,   166
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_uint8 yyr1[] =
{
       0,   100,   101,   101,   102,   102,   102,   102,   103,   103,
     103,   103,   104,   104,   104,   104,   104,   104,   104,   104,
     104,   104,   105,   105,   106,   107,   108,   108,   108,   108,
     108,   108,   109,   109,   109,   109,   109,   109,   109,   109,
     109,   109,   109,   109,   109,   109,   109,   109,   109,   109,
     109,   109,   109,   109,   109,   109,   109,   109,   109,   109,
     109,   109,   110,   111,   111,   111,   111,   112,   112,   112,
     112,   112,   112,   112,   113,   113,   114,   114,   115,   115,
     115,   115,   116,   117,   117,   117,   117,   117,   117,   117,
     117,   118,   118,   118,   118,   118,   118,   118,   118,   118,
     118,   118,   118,   118,   118,   118,   118,   118,   118,   118,
     118,   118,   118,   118,   118,   118,   118,   118,   118,   119,
     119,   119,   119,   119,   119,   119,   119,   119,   120,   120,
     120,   120,   120,   120,   120,   120,   120,   121,   121,   122,
     123,   123,   124,   124,   125,   125,   126,   126,   127,   127,
     128,   128,   129,   129,   130,   130,   131,   131,   132,   132,
     133,   133,   134,   134,   135,   135,   136,   136,   137,   137,
     138,   138,   139,   139,   140,   140,   141,   141,   142,   142,
     143,   143,   144,   144,   145,   145,   146,   146,   147,   147,
     148,   148,   149,   149,   150,   150,   151,   151,   152,   152,
     153,   153,   154,   154,   155,   155,   156,   156,   157,   157,
     158,   158,   159,   159,   160,   160,   161,   161,   162,   162,
     163,   163,   164,   164,   165,   165,   166,   166,   167,   167,
     168,   168,   169,   169,   170,   170,   171,   171,   172,   172,
     173,   173,   174,   174,   175,   175,   176,   176,   177,   177,
     178,   178,   179,   179,   180,   180,   181,   181,   182,   182,
     183,   183,   184,   184,   185,   185,   186,   186,   187,   187,
     188,   188,   189,   189,   190,   190,   191,   191,   192,   192,
     193,   193,   194,   194,   195,   195,   196,   196,   197,   197,
     198,   198,   199,   199,   200,   200,   201,   201,   202,   202,
     203,   203,   204,   204,   205,   205,   206,   206
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     1,     3,
       6,     5,     1,     5,     5,     3,     3,     3,     3,     1,
       2,     3,     1,     2,     2,     2,     2,     5,     4,     2,
       6,     6,     3,     3,     3,     3,     3,     3,     1,     5,
       5,     5,     5,     6,     5,     6,     5,     6,     6,     4,
       2,     6,     4,     2,     4,     4,     8,     8,     4,     5,
       5,     3,     3,     5,     5,     5,     5,     1,     1,     1,
       1,     1,     1,     1,     3,     3,     1,     2,     6,     6,
       6,     6,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     1,     1,     1,     4,     3,     3,     3,     3,     3,
       4,     7,     4,     4,     4,     4,     6,     3,     4,     5,
       7,     4,     5,     5,     5,     6,     1,     5,     5,     1,
       1,     1,     3,     3,     1,     1,     1,     1,     2,     2,
       4,     1,     1,     3,     2,     4,     2,     2,     1,     3,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2
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
#line 69 "M.y"
        {
	printf("->PROGRAM\n");
	(yyval.a) = (newast(nt_PROGRAM,NULL,prog_single,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
	root=(yyval.a);
	}
#line 1769 "M.tab.c"
    break;

  case 3: /* PROGRAM: STATEMENT PROGRAM  */
#line 75 "M.y"
        {
	printf("->PROGRAM\n");
	(yyval.a) = (newast(nt_PROGRAM,NULL,prog_list,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
	root=(yyval.a);
	}
#line 1779 "M.tab.c"
    break;

  case 4: /* STATEMENT: GOAL_STATEMENT  */
#line 85 "M.y"
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_goal,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1788 "M.tab.c"
    break;

  case 5: /* STATEMENT: GIVEN_STATEMENT  */
#line 90 "M.y"
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_given,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1797 "M.tab.c"
    break;

  case 6: /* STATEMENT: PROOF_STATEMENT_LIST  */
#line 95 "M.y"
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_proof_list,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1806 "M.tab.c"
    break;

  case 7: /* STATEMENT: LPROOF  */
#line 100 "M.y"
    {
        printf("STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_proof,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1815 "M.tab.c"
    break;

  case 8: /* PROOF_STATEMENT_LIST: PROOF_STATEMENT  */
#line 108 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_list_single)\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_list_single,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1824 "M.tab.c"
    break;

  case 9: /* PROOF_STATEMENT_LIST: PROOF_STATEMENT LCOMMA PROOF_STATEMENT_LIST  */
#line 113 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_list)\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_list,(yyvsp[-1].a),label,label->lineNum));
    }
#line 1834 "M.tab.c"
    break;

  case 10: /* PROOF_STATEMENT_LIST: LPAP MATH_EQUATION LLB3L PROOF_STATEMENT_LIST LLB3R PROOF_STATEMENT_LIST  */
#line 119 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_PoseAndProve)\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_PoseAndProve,(yyvsp[-4].a),label,(yyvsp[-1].a)->lineNum));
    }
#line 1844 "M.tab.c"
    break;

  case 11: /* PROOF_STATEMENT_LIST: ACTION_STATEMENT LLB3L PROOF_STATEMENT_LIST LLB3R PROOF_STATEMENT_LIST  */
#line 125 "M.y"
    {
        printf("->PROOF_STATEMENT_LIST (proof_stmt_PoseVar)\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_PROOF_STATEMENT_LIST,NULL,proof_stmt_PoseVar,(yyvsp[-4].a),label,(yyvsp[-1].a)->lineNum));
    }
#line 1854 "M.tab.c"
    break;

  case 12: /* PROOF_STATEMENT: LQED  */
#line 133 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_qed,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1863 "M.tab.c"
    break;

  case 13: /* PROOF_STATEMENT: SINCE_CLAUSE LTHEN MATH_EQUATION LREMEMBER MEMORY_TERM  */
#line 138 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_since_remember_as,(yyvsp[-4].a),label,label->lineNum);
    }
#line 1873 "M.tab.c"
    break;

  case 14: /* PROOF_STATEMENT: ACTION LTHEN MATH_EQUATION LREMEMBER MEMORY_TERM  */
#line 144 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_action_math_equation,(yyvsp[-4].a),label,label->lineNum);
    }
#line 1883 "M.tab.c"
    break;

  case 15: /* PROOF_STATEMENT: ACTION LTHEN LCONCLUDE  */
#line 150 "M.y"
    {
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_action_conclude,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 1892 "M.tab.c"
    break;

  case 16: /* PROOF_STATEMENT: LUSE LLIM_DEF LTO_PROVE  */
#line 155 "M.y"
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_limit_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1902 "M.tab.c"
    break;

  case 17: /* PROOF_STATEMENT: LUSE LCONTINUE_DEF LTO_PROVE  */
#line 161 "M.y"
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_continue_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1912 "M.tab.c"
    break;

  case 18: /* PROOF_STATEMENT: LUSE LUC_DEF LTO_PROVE  */
#line 167 "M.y"
    {
        //使用xxx证明。
        printf("->PROOF_STATEMENT\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_use_uc_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1922 "M.tab.c"
    break;

  case 19: /* PROOF_STATEMENT: ACTION_STATEMENT  */
#line 173 "M.y"
    {
        printf("->proof_statement:action_statement\n");
        (yyval.a) = (newast(nt_PROOF_STATEMENT,NULL,stmt_action,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1931 "M.tab.c"
    break;

  case 20: /* PROOF_STATEMENT: SINCE_CLAUSE MATH_EQUATION  */
#line 178 "M.y"
    {
        printf("->PROOF_STATEMENT no remember\n");
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_since_no_remember,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 1940 "M.tab.c"
    break;

  case 21: /* PROOF_STATEMENT: SINCE_CLAUSE LTHEN MATH_EQUATION  */
#line 183 "M.y"
    {
        printf("->PROOF_STATEMENT no remember\n");
        (yyval.a) = newast(nt_PROOF_STATEMENT,NULL,stmt_since_no_remember,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 1949 "M.tab.c"
    break;

  case 22: /* MATH_EQUATION_LIST: MATH_EQUATION  */
#line 192 "M.y"
    {
        printf("->MATH_LIST\n");
        (yyval.a) = (newast(nt_MATH_LIST,NULL,math_list_two,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));

    }
#line 1959 "M.tab.c"
    break;

  case 23: /* MATH_EQUATION_LIST: MATH_EQUATION MATH_EQUATION_LIST  */
#line 198 "M.y"
    {
        printf("->MATH_LIST\n");
        (yyval.a) = (newast(nt_MATH_LIST,NULL,math_list_n,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));

    }
#line 1969 "M.tab.c"
    break;

  case 24: /* GIVEN_STATEMENT: LGIVEN MATH_EQUATION_LIST  */
#line 206 "M.y"
    {
        printf("->GIVEN_STATEMENT\n");
        (yyval.a) = (newast(nt_GIVEN_STATEMENT,NULL,given_list,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
        
    }
#line 1979 "M.tab.c"
    break;

  case 25: /* GOAL_STATEMENT: LGOAL MATH_EQUATION  */
#line 214 "M.y"
    {
        printf("->GOAL_STATEMENT\n");
        (yyval.a) = (newast(nt_GOAL_STATEMENT,NULL,goal_math_equa,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1988 "M.tab.c"
    break;

  case 26: /* ACTION_STATEMENT: LINTROS TLVAR  */
#line 221 "M.y"
    {
        //引入变量
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 1998 "M.tab.c"
    break;

  case 27: /* ACTION_STATEMENT: LINTROS LMATH1 TLVAR LMATH1 MATH_EQUATION_LIST  */
#line 227 "M.y"
    {
        //引入满足一系列条件的变量
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros_suppose_list_equation, (yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2008 "M.tab.c"
    break;

  case 28: /* ACTION_STATEMENT: LINTROS LMATH1 TLVAR LMATH1  */
#line 233 "M.y"
    {
        //引入变量
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2018 "M.tab.c"
    break;

  case 29: /* ACTION_STATEMENT: LSUPPOSE MATH_EQUATION  */
#line 239 "M.y"
    {
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_suppose,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2027 "M.tab.c"
    break;

  case 30: /* ACTION_STATEMENT: LSET TLVAR TLeq LMATH1 EXPR LMATH1  */
#line 244 "M.y"
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr1,(yyvsp[-5].a),to_set,to_set->lineNum);
    }
#line 2037 "M.tab.c"
    break;

  case 31: /* ACTION_STATEMENT: LSET TLVAR TLeq LMATH2 EXPR LMATH2  */
#line 250 "M.y"
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr2,(yyvsp[-5].a),to_set,to_set->lineNum);
    }
#line 2047 "M.tab.c"
    break;

  case 32: /* MATH_EQUATION: LMATH1 EQUATION LMATH1  */
#line 262 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_math1,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2056 "M.tab.c"
    break;

  case 33: /* MATH_EQUATION: LMATH2 EQUATION LMATH2  */
#line 267 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_math2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2065 "M.tab.c"
    break;

  case 34: /* MATH_EQUATION: LMATH2 CONTINUED_EQUATION LMATH2  */
#line 272 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_continued2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2074 "M.tab.c"
    break;

  case 35: /* MATH_EQUATION: LMATH1 CONTINUED_EQUATION LMATH1  */
#line 277 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_continued2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2083 "M.tab.c"
    break;

  case 36: /* MATH_EQUATION: LMATH1 INTERVAL LMATH1  */
#line 282 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_interval1,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2092 "M.tab.c"
    break;

  case 37: /* MATH_EQUATION: LMATH2 INTERVAL LMATH2  */
#line 287 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_interval2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2101 "M.tab.c"
    break;

  case 38: /* MATH_EQUATION: FUNC_EQUATION  */
#line 292 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_func,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2110 "M.tab.c"
    break;

  case 39: /* MATH_EQUATION: LMATH1 TLforall CONTINUED_VAR LMATH1 MATH_EQUATION  */
#line 297 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2119 "M.tab.c"
    break;

  case 40: /* MATH_EQUATION: LMATH1 TLexists CONTINUED_VAR LMATH1 MATH_EQUATION  */
#line 302 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2128 "M.tab.c"
    break;

  case 41: /* MATH_EQUATION: LMATH2 TLforall CONTINUED_VAR LMATH2 MATH_EQUATION  */
#line 307 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2137 "M.tab.c"
    break;

  case 42: /* MATH_EQUATION: LMATH2 TLexists CONTINUED_VAR LMATH2 MATH_EQUATION  */
#line 312 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2146 "M.tab.c"
    break;

  case 43: /* MATH_EQUATION: LMATH1 TLexists CONTINUED_VAR LMATH1 LSUPPOSE MATH_EQUATION  */
#line 318 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-3].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2155 "M.tab.c"
    break;

  case 44: /* MATH_EQUATION: TLexists LMATH1 EXPR LMATH1 MATH_EQUATION  */
#line 323 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists_sets,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2164 "M.tab.c"
    break;

  case 45: /* MATH_EQUATION: TLexists LMATH1 EXPR LMATH1 LSUPPOSE MATH_EQUATION  */
#line 328 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[-1].a)->lineNum));
    }
#line 2173 "M.tab.c"
    break;

  case 46: /* MATH_EQUATION: TLforall LMATH1 EXPR LMATH1 MATH_EQUATION  */
#line 333 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall_sets,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2182 "M.tab.c"
    break;

  case 47: /* MATH_EQUATION: TLforall LMATH1 EXPR LMATH1 LSUPPOSE MATH_EQUATION  */
#line 338 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[-1].a)->lineNum));
    }
#line 2191 "M.tab.c"
    break;

  case 48: /* MATH_EQUATION: FUNC_HEAD LIN LMATH1 EXPR LMATH1 LCONTINUE  */
#line 343 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_var_continue,(yyvsp[-5].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2200 "M.tab.c"
    break;

  case 49: /* MATH_EQUATION: FUNC_HEAD LIN MATH_EQUATION LCONTINUE  */
#line 348 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_interval_continue,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));  
    }
#line 2209 "M.tab.c"
    break;

  case 50: /* MATH_EQUATION: FUNC_HEAD LCONTINUE  */
#line 353 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_continue,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2218 "M.tab.c"
    break;

  case 51: /* MATH_EQUATION: FUNC_HEAD LIN LMATH1 EXPR LMATH1 LUCONTINUE  */
#line 358 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_var_ucontinue,(yyvsp[-5].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2227 "M.tab.c"
    break;

  case 52: /* MATH_EQUATION: FUNC_HEAD LIN MATH_EQUATION LUCONTINUE  */
#line 363 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_in_interval_ucontinue,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));  
    }
#line 2236 "M.tab.c"
    break;

  case 53: /* MATH_EQUATION: FUNC_HEAD LUCONTINUE  */
#line 368 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_ucontinue,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2245 "M.tab.c"
    break;

  case 54: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LMONOINC  */
#line 373 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_monoinc,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2254 "M.tab.c"
    break;

  case 55: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LMONODEC  */
#line 378 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_monodec,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2263 "M.tab.c"
    break;

  case 56: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LIS LMATH1 EXPR LMATH1 LBOUND_ABOVE  */
#line 383 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_bound_above,(yyvsp[-6].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2272 "M.tab.c"
    break;

  case 57: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LIS LMATH1 EXPR LMATH1 LBOUND_BELOW  */
#line 388 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_bound_below,(yyvsp[-6].a),(yyvsp[-2].a),(yyvsp[0].a)->lineNum));  
    }
#line 2281 "M.tab.c"
    break;

  case 58: /* MATH_EQUATION: LIF MATH_EQUATION THEN MATH_EQUATION  */
#line 393 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_impl,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));  
    }
#line 2290 "M.tab.c"
    break;

  case 59: /* MATH_EQUATION: LMATH1 EXPR LMATH1 HAVE LBOUND_ABOVE  */
#line 398 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_have_bound_above,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2299 "M.tab.c"
    break;

  case 60: /* MATH_EQUATION: LMATH1 EXPR LMATH1 LHAVE LBOUND_BELOW  */
#line 403 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_have_bound_below,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));  
    }
#line 2308 "M.tab.c"
    break;

  case 61: /* MATH_EQUATION: TLVAR TLBELONG TLVAR  */
#line 408 "M.y"
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_n_belong_N,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2317 "M.tab.c"
    break;

  case 62: /* EQUATION: EXPR TEQ EXPR  */
#line 417 "M.y"
    {
        printf("->EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_EQUATION,NULL,equation_expr,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2327 "M.tab.c"
    break;

  case 63: /* FUNC_EQUATION: LMATH2 FUNC_HEAD DLeq EXPR LMATH2  */
#line 425 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2337 "M.tab.c"
    break;

  case 64: /* FUNC_EQUATION: LMATH1 FUNC_HEAD DLeq EXPR LMATH1  */
#line 431 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2347 "M.tab.c"
    break;

  case 65: /* FUNC_EQUATION: LMATH2 TLVAR DLeq FUNC_HEAD LMATH2  */
#line 437 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2357 "M.tab.c"
    break;

  case 66: /* FUNC_EQUATION: LMATH1 TLVAR DLeq FUNC_HEAD LMATH1  */
#line 443 "M.y"
{
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2367 "M.tab.c"
    break;

  case 67: /* TEQ: TLeq  */
#line 452 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_teq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2376 "M.tab.c"
    break;

  case 68: /* TEQ: TLleq  */
#line 457 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tleq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2385 "M.tab.c"
    break;

  case 69: /* TEQ: TLgeq  */
#line 462 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tgeq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2394 "M.tab.c"
    break;

  case 70: /* TEQ: TLneq  */
#line 467 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tneq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2403 "M.tab.c"
    break;

  case 71: /* TEQ: TLequiv  */
#line 472 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tequiv,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2412 "M.tab.c"
    break;

  case 72: /* TEQ: TLlt  */
#line 477 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tlt,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2421 "M.tab.c"
    break;

  case 73: /* TEQ: TLgt  */
#line 482 "M.y"
{
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tgt,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2430 "M.tab.c"
    break;

  case 74: /* CONTINUED_EQUATION: EXPR TEQ EQUATION  */
#line 489 "M.y"
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_equation,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2440 "M.tab.c"
    break;

  case 75: /* CONTINUED_EQUATION: EXPR TEQ CONTINUED_EQUATION  */
#line 495 "M.y"
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_continued_equation,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2450 "M.tab.c"
    break;

  case 76: /* CONTINUED_VAR: TLVAR  */
#line 503 "M.y"
    {
        printf("->CONTINUED_VAR\n");
        (yyval.a) = (newast(nt_CONTINUED_VAR,NULL,0,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2459 "M.tab.c"
    break;

  case 77: /* CONTINUED_VAR: TLVAR CONTINUED_VAR  */
#line 508 "M.y"
    {
        printf("->CONTINUED_VAR\n");
        (yyval.a) = (newast(nt_CONTINUED_VAR,NULL,0,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2468 "M.tab.c"
    break;

  case 78: /* LIM_HEAD: TLlim LLB3L TLVAR TLto TLinfty LLB3R  */
#line 515 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_infty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2477 "M.tab.c"
    break;

  case 79: /* LIM_HEAD: TLlim LLB3L TLVAR TLto TLNinfty LLB3R  */
#line 520 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Ninfty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2486 "M.tab.c"
    break;

  case 80: /* LIM_HEAD: TLlim LLB3L TLVAR TLto TLPinfty LLB3R  */
#line 525 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Pinfty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2495 "M.tab.c"
    break;

  case 81: /* LIM_HEAD: TLlim LLB3L TLVAR TLto EXPR LLB3R  */
#line 530 "M.y"
   {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_expr,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2504 "M.tab.c"
    break;

  case 82: /* FUNC_HEAD: TLVAR LLB1L TLVAR LLB1R  */
#line 537 "M.y"
   {  
        printf("->FUNC_HEAD\n");
    (yyval.a) = (newast(nt_FUNC_HEAD,NULL,func_head_binding,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2513 "M.tab.c"
    break;

  case 83: /* INTERVAL: LLB1L EXPR LCOMMA EXPR LLB1R  */
#line 544 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2522 "M.tab.c"
    break;

  case 84: /* INTERVAL: LLB2L EXPR LCOMMA EXPR LLB1R  */
#line 549 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2531 "M.tab.c"
    break;

  case 85: /* INTERVAL: LLB1L EXPR LCOMMA EXPR LLB2R  */
#line 554 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2540 "M.tab.c"
    break;

  case 86: /* INTERVAL: LLB2L EXPR LCOMMA EXPR LLB2R  */
#line 559 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2549 "M.tab.c"
    break;

  case 87: /* INTERVAL: LLB1L EXPR LCOMMA TLPinfty LLB1R  */
#line 564 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_rinfty,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2558 "M.tab.c"
    break;

  case 88: /* INTERVAL: LLB2L EXPR LCOMMA TLPinfty LLB1R  */
#line 569 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_rinfty,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2567 "M.tab.c"
    break;

  case 89: /* INTERVAL: LLB1L TLNinfty LCOMMA EXPR LLB1R  */
#line 574 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_linfty_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2576 "M.tab.c"
    break;

  case 90: /* INTERVAL: LLB1L TLNinfty LCOMMA EXPR LLB2R  */
#line 579 "M.y"
{
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_linfty_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2585 "M.tab.c"
    break;

  case 91: /* EXPR: TLVAR  */
#line 588 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tvar,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2594 "M.tab.c"
    break;

  case 92: /* EXPR: TLCONST  */
#line 593 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tconst,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2603 "M.tab.c"
    break;

  case 93: /* EXPR: TLNUM  */
#line 598 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tnum,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2612 "M.tab.c"
    break;

  case 94: /* EXPR: LLB1L Tminus EXPR LLB1R  */
#line 603 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_1L_minus_1R,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2621 "M.tab.c"
    break;

  case 95: /* EXPR: LABS EXPR LABS  */
#line 608 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_abs,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2630 "M.tab.c"
    break;

  case 96: /* EXPR: EXPR Tadd EXPR  */
#line 613 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tadd,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2639 "M.tab.c"
    break;

  case 97: /* EXPR: EXPR Tminus EXPR  */
#line 618 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tminus,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2648 "M.tab.c"
    break;

  case 98: /* EXPR: EXPR Tdiv EXPR  */
#line 623 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tdiv,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2657 "M.tab.c"
    break;

  case 99: /* EXPR: EXPR Ttimes EXPR  */
#line 628 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_ttimes,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2666 "M.tab.c"
    break;

  case 100: /* EXPR: TLsqrt LLB3L EXPR LLB3R  */
#line 633 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsqrt_2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2675 "M.tab.c"
    break;

  case 101: /* EXPR: TLsqrt LLB2L EXPR LLB2R LLB3L EXPR LLB3R  */
#line 638 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsqrt_n,(yyvsp[-1].a),(yyvsp[-4].a),(yyvsp[0].a)->lineNum));
    }
#line 2684 "M.tab.c"
    break;

  case 102: /* EXPR: TLln LLB3L EXPR LLB3R  */
#line 643 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tln,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2693 "M.tab.c"
    break;

  case 103: /* EXPR: TLsin LLB3L EXPR LLB3R  */
#line 648 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsin,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2702 "M.tab.c"
    break;

  case 104: /* EXPR: TLcos LLB3L EXPR LLB3R  */
#line 653 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tcos,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2711 "M.tab.c"
    break;

  case 105: /* EXPR: TLsup LLB3L EXPR LLB3R  */
#line 658 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsup,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2720 "M.tab.c"
    break;

  case 106: /* EXPR: LLB3L EXPR LLB3R LLB3L EXPR LLB3R  */
#line 663 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_3L_3R_3L_3R,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2729 "M.tab.c"
    break;

  case 107: /* EXPR: LLB1L EXPR LLB1R  */
#line 668 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_1L_1R,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2738 "M.tab.c"
    break;

  case 108: /* EXPR: LLB1L EXPR LLB1R TLderi  */
#line 673 "M.y"
    {
        printf("->EXPR_deri\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_derivative,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2747 "M.tab.c"
    break;

  case 109: /* EXPR: TLVAR TLderi LLB1L TLVAR LLB1R  */
#line 678 "M.y"
    {
        printf("->EXPR_deri_f\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_derivative_f,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2756 "M.tab.c"
    break;

  case 110: /* EXPR: TLfrac LLB3L EXPR LLB3R LLB3L EXPR LLB3R  */
#line 683 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tfrac_3L_3R_3L_3R,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2765 "M.tab.c"
    break;

  case 111: /* EXPR: LIM_HEAD LLB3L EXPR LLB3R  */
#line 688 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_lim_head,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    
    }
#line 2775 "M.tab.c"
    break;

  case 112: /* EXPR: LLCEIL LLB3L EXPR LLB3R LRCEIL  */
#line 694 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_Lceil_3L_3R_Rceil,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2784 "M.tab.c"
    break;

  case 113: /* EXPR: LLFLOOR LLB3L EXPR LLB3R LRFLOOR  */
#line 699 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_Lfloor_3L_3R_Rfloor,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2793 "M.tab.c"
    break;

  case 114: /* EXPR: EXPR Tpower LLB3L EXPR LLB3R  */
#line 704 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tpower,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2802 "M.tab.c"
    break;

  case 115: /* EXPR: LMIN LLB1L EXPR LCOMMA EXPR LLB1R  */
#line 709 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tmin,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2811 "M.tab.c"
    break;

  case 116: /* EXPR: FUNC_HEAD  */
#line 714 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_func,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2820 "M.tab.c"
    break;

  case 117: /* EXPR: LLB3L TLVAR LCOMMA MATH_EQUATION LLB3R  */
#line 719 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_seq_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2829 "M.tab.c"
    break;

  case 118: /* EXPR: LLB3L TLVAR LABS MATH_EQUATION LLB3R  */
#line 724 "M.y"
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_seq_sets,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2838 "M.tab.c"
    break;

  case 119: /* KNOWLEDGE: LKASaverage  */
#line 734 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KASaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2847 "M.tab.c"
    break;

  case 120: /* KNOWLEDGE: LKSGaverage  */
#line 739 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KSGaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2856 "M.tab.c"
    break;

  case 121: /* KNOWLEDGE: LKAGaverage  */
#line 744 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KAGaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2865 "M.tab.c"
    break;

  case 122: /* KNOWLEDGE: LMATH1 KNOWLEDGE LMATH1  */
#line 749 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math1,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2874 "M.tab.c"
    break;

  case 123: /* KNOWLEDGE: LMATH2 KNOWLEDGE LMATH2  */
#line 754 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2883 "M.tab.c"
    break;

  case 124: /* KNOWLEDGE: LFSqueeze  */
#line 759 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_FSqueeze,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2892 "M.tab.c"
    break;

  case 125: /* KNOWLEDGE: LSUPRE_DEF  */
#line 764 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Supre_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2901 "M.tab.c"
    break;

  case 126: /* KNOWLEDGE: LSUPRE_THEOREM  */
#line 769 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Supre_the,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2910 "M.tab.c"
    break;

  case 127: /* KNOWLEDGE: LLIM_DEF  */
#line 774 "M.y"
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Lim_def,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2919 "M.tab.c"
    break;

  case 128: /* SINCE_CLAUSE: LSINCE KNOWLEDGE  */
#line 781 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_knowledge,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2928 "M.tab.c"
    break;

  case 129: /* SINCE_CLAUSE: LSINCE MATH_EQUATION  */
#line 786 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_math_equation,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2937 "M.tab.c"
    break;

  case 130: /* SINCE_CLAUSE: LSINCE LLB2L TLNUM LLB2R  */
#line 792 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_tnum,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2946 "M.tab.c"
    break;

  case 131: /* SINCE_CLAUSE: LSAME  */
#line 798 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_same,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2955 "M.tab.c"
    break;

  case 132: /* SINCE_CLAUSE: LAUTO_NOHINT  */
#line 803 "M.y"
    {
        printf("->since\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_auto_nohint,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2964 "M.tab.c"
    break;

  case 133: /* SINCE_CLAUSE: LSINCE TLVAR LTRANS  */
#line 808 "M.y"
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_trans,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2973 "M.tab.c"
    break;

  case 134: /* SINCE_CLAUSE: LBOTH LDERI  */
#line 813 "M.y"
    {
        printf("->STATEMENT Both deri\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 2982 "M.tab.c"
    break;

  case 135: /* SINCE_CLAUSE: LBOTH LFOR TLVAR LDERI  */
#line 818 "M.y"
    {
        printf("->STATEMENT Both deri\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri_var,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum); 
    }
#line 2991 "M.tab.c"
    break;

  case 136: /* SINCE_CLAUSE: LBECAUSE MATH_EQUATION  */
#line 823 "M.y"
    {
        printf("->STATEMENT Because\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_because,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum); 
    }
#line 3000 "M.tab.c"
    break;

  case 137: /* ACTION: EQS LEQUNADD  */
#line 831 "M.y"
    {
        //等式们相加
        printf("->ACTION");
        (yyval.a) = (newast(nt_ACTION,NULL,Action_eqs_equnadd,(yyvsp[0].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum)); 
    }
#line 3010 "M.tab.c"
    break;

  case 138: /* ACTION: LAUTO_CONC  */
#line 837 "M.y"
    {
        //“综上”
        printf("->ACTION");
        (yyval.a) = newast(nt_ACTION,NULL,Action_auto_conc,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum);
    }
#line 3020 "M.tab.c"
    break;

  case 139: /* MEMORY_TERM: LLB2L TLNUM LLB2R  */
#line 846 "M.y"
    {
        printf("->Memory Term");
        (yyval.a) = (newast(nt_MEMORY_TERM,NULL,Memory_term_tnum,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 3029 "M.tab.c"
    break;

  case 140: /* EQS: MEMORY_TERM  */
#line 853 "M.y"
    {
        printf("->Equation list");
        (yyval.a) = (newast(nt_EQS,NULL,Eqs_memory_term,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 3038 "M.tab.c"
    break;

  case 141: /* EQS: MEMORY_TERM EQS  */
#line 858 "M.y"
    {
        //at least two.
        printf("->Equation list");
        (yyval.a) = (newast(nt_EQS,NULL,Eqs_memory_term_eqs,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 3048 "M.tab.c"
    break;

  case 142: /* TLCONST: TCONST  */
#line 866 "M.y"
    {
        //printf("->TLCONST");
        (yyval.a) = (newast(ntl_TCONST,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3057 "M.tab.c"
    break;

  case 143: /* TLCONST: TCONST TLINE  */
#line 871 "M.y"
    {
        printf("->Line CONST");
        (yyval.a) = (newast(ntl_TCONST,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3066 "M.tab.c"
    break;

  case 144: /* TLVAR: TVAR  */
#line 878 "M.y"
    {
        //printf("->TLVAR");
        (yyval.a) = (newast(ntl_TVAR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3075 "M.tab.c"
    break;

  case 145: /* TLVAR: TVAR TLINE  */
#line 883 "M.y"
    {
        printf("->Line VAR");
        (yyval.a) = (newast(ntl_TVAR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3084 "M.tab.c"
    break;

  case 146: /* TLNUM: TNUM  */
#line 890 "M.y"
    {
        //printf("->TLNUM");
        (yyval.a) = (newast(ntl_TNUM,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3093 "M.tab.c"
    break;

  case 147: /* TLNUM: TNUM TLINE  */
#line 895 "M.y"
    {
        printf("->Line NUM");
        (yyval.a) = (newast(ntl_TNUM,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3102 "M.tab.c"
    break;

  case 148: /* TLsqrt: Tsqrt  */
#line 904 "M.y"
    {
        //printf("->Tsqrt");
        (yyval.a) = (newast(ntl_Tsqrt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3111 "M.tab.c"
    break;

  case 149: /* TLsqrt: Tsqrt TLINE  */
#line 909 "M.y"
    {
        printf("->Line sqrt");
        (yyval.a) = (newast(ntl_Tsqrt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3120 "M.tab.c"
    break;

  case 150: /* TLln: Tln  */
#line 916 "M.y"
    {
        //printf("->Tln");
        (yyval.a) = (newast(ntl_Tln,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3129 "M.tab.c"
    break;

  case 151: /* TLln: Tln TLINE  */
#line 921 "M.y"
    {
        printf("->Line ln");
        (yyval.a) = (newast(ntl_Tln,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3138 "M.tab.c"
    break;

  case 152: /* TLderi: Tderi  */
#line 928 "M.y"
    {
        //printf("->Tderi");
        (yyval.a) = (newast(ntl_Tderi,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3147 "M.tab.c"
    break;

  case 153: /* TLderi: Tderi TLINE  */
#line 933 "M.y"
    {
        printf("->Line ln");
        (yyval.a) = (newast(ntl_Tderi,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3156 "M.tab.c"
    break;

  case 154: /* TLfrac: Tfrac  */
#line 940 "M.y"
    {
        //printf("->Tfrac");
        (yyval.a) = (newast(ntl_Tfrac,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3165 "M.tab.c"
    break;

  case 155: /* TLfrac: Tfrac TLINE  */
#line 945 "M.y"
    {
        printf("->Line frac");
        (yyval.a) = (newast(ntl_Tfrac,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3174 "M.tab.c"
    break;

  case 156: /* TLeq: Teq  */
#line 952 "M.y"
    {
        //printf("->Teq");
        (yyval.a) = (newast(ntl_Teq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3183 "M.tab.c"
    break;

  case 157: /* TLeq: Teq TLINE  */
#line 957 "M.y"
    {
        printf("->Line eq");
        (yyval.a) = (newast(ntl_Teq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3192 "M.tab.c"
    break;

  case 158: /* DLeq: Deq  */
#line 964 "M.y"
    {
        //printf("->Deq");
        (yyval.a) = (newast(ntl_Deq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3201 "M.tab.c"
    break;

  case 159: /* DLeq: Deq TLINE  */
#line 969 "M.y"
    {
        printf("->Line deq");
        (yyval.a) = (newast(ntl_Deq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3210 "M.tab.c"
    break;

  case 160: /* TLleq: Tleq  */
#line 976 "M.y"
    {
        //printf("->Tleq");
        (yyval.a) = (newast(ntl_Tleq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3219 "M.tab.c"
    break;

  case 161: /* TLleq: Tleq TLINE  */
#line 981 "M.y"
    {
        printf("->Line leq");
        (yyval.a) = (newast(ntl_Tleq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3228 "M.tab.c"
    break;

  case 162: /* TLgeq: Tgeq  */
#line 988 "M.y"
    {
        //printf("->Tgeq");
        (yyval.a) = (newast(ntl_Tgeq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3237 "M.tab.c"
    break;

  case 163: /* TLgeq: Tgeq TLINE  */
#line 993 "M.y"
    {
        printf("->Line geq");
        (yyval.a) = (newast(ntl_Tgeq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3246 "M.tab.c"
    break;

  case 164: /* TLlt: Tlt  */
#line 1000 "M.y"
    {
        //printf("->Tlt");
        (yyval.a) = (newast(ntl_Tlt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3255 "M.tab.c"
    break;

  case 165: /* TLlt: Tlt TLINE  */
#line 1005 "M.y"
    {
        printf("->Line lt");
        (yyval.a) = (newast(ntl_Tlt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3264 "M.tab.c"
    break;

  case 166: /* TLgt: Tgt  */
#line 1012 "M.y"
    {
        //printf("->Tgt");
        (yyval.a) = (newast(ntl_Tgt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3273 "M.tab.c"
    break;

  case 167: /* TLgt: Tgt TLINE  */
#line 1017 "M.y"
    {
        printf("->Line gt");
        (yyval.a) = (newast(ntl_Tgt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3282 "M.tab.c"
    break;

  case 168: /* TLneq: Tneq  */
#line 1024 "M.y"
    {
        //printf("->Tneq");
        (yyval.a) = (newast(ntl_Tneq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3291 "M.tab.c"
    break;

  case 169: /* TLneq: Tneq TLINE  */
#line 1029 "M.y"
    {
        printf("->Line neq");
        (yyval.a) = (newast(ntl_Tneq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3300 "M.tab.c"
    break;

  case 170: /* TLequiv: Tequiv  */
#line 1036 "M.y"
    {
        //printf("->Tequiv");
        (yyval.a) = (newast(ntl_Tequiv,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3309 "M.tab.c"
    break;

  case 171: /* TLequiv: Tequiv TLINE  */
#line 1041 "M.y"
    {
        printf("->Line equiv");
        (yyval.a) = (newast(ntl_Tequiv,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3318 "M.tab.c"
    break;

  case 172: /* TLlim: Tlim  */
#line 1048 "M.y"
    {
        //printf("->Tlim");
        (yyval.a) = (newast(ntl_Tlim,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3327 "M.tab.c"
    break;

  case 173: /* TLlim: Tlim TLINE  */
#line 1053 "M.y"
    {
        printf("->Line lim");
        (yyval.a) = (newast(ntl_Tlim,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3336 "M.tab.c"
    break;

  case 174: /* TLto: Tto  */
#line 1060 "M.y"
    {
        //printf("->Tto");
        (yyval.a) = (newast(ntl_Tto,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3345 "M.tab.c"
    break;

  case 175: /* TLto: Tto TLINE  */
#line 1065 "M.y"
     {
        printf("->Line to");
        (yyval.a) = (newast(ntl_Tto,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3354 "M.tab.c"
    break;

  case 176: /* TLinfty: Tinfty  */
#line 1072 "M.y"
    {
        //printf("->Tinfty");
        (yyval.a) = (newast(ntl_Tinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3363 "M.tab.c"
    break;

  case 177: /* TLinfty: Tinfty TLINE  */
#line 1077 "M.y"
    {
        printf("->Line infty");
        (yyval.a) = (newast(ntl_Tinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3372 "M.tab.c"
    break;

  case 178: /* TLPinfty: TPinfty  */
#line 1084 "M.y"
    {
        //printf("->TPinfty");
        (yyval.a) = (newast(ntl_TPinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3381 "M.tab.c"
    break;

  case 179: /* TLPinfty: TPinfty TLINE  */
#line 1089 "M.y"
    {
        printf("->Line Pinfty");
        (yyval.a) = (newast(ntl_TPinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3390 "M.tab.c"
    break;

  case 180: /* TLNinfty: TNinfty  */
#line 1096 "M.y"
    {
        //printf("->TNinfty");
        (yyval.a) = (newast(ntl_TNinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3399 "M.tab.c"
    break;

  case 181: /* TLNinfty: TNinfty TLINE  */
#line 1101 "M.y"
    {
        printf("->Line Ninfty");
        (yyval.a) = (newast(ntl_TNinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3408 "M.tab.c"
    break;

  case 182: /* LGOAL: GOAL  */
#line 1108 "M.y"
    {
        //printf("->GOAL");
        (yyval.a) = (newast(ntl_goal,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3417 "M.tab.c"
    break;

  case 183: /* LGOAL: GOAL TLINE  */
#line 1113 "M.y"
    {
        printf("->Line GOAL");
        (yyval.a) = (newast(ntl_goal,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3426 "M.tab.c"
    break;

  case 184: /* LMATH1: MATH1  */
#line 1121 "M.y"
    {
        //printf("->MATH1");
        (yyval.a) = (newast(ntl_math1,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3435 "M.tab.c"
    break;

  case 185: /* LMATH1: MATH1 TLINE  */
#line 1126 "M.y"
    {
        printf("->Line MATH1");
        (yyval.a) = (newast(ntl_math1,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3444 "M.tab.c"
    break;

  case 186: /* LMATH2: MATH2  */
#line 1133 "M.y"
    {
        //printf("->MATH2");
        (yyval.a) = (newast(ntl_math2,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3453 "M.tab.c"
    break;

  case 187: /* LMATH2: MATH2 TLINE  */
#line 1138 "M.y"
    {
        printf("->Line MATH2");
        (yyval.a) = (newast(ntl_math2,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3462 "M.tab.c"
    break;

  case 188: /* LPROOF: PROOF  */
#line 1145 "M.y"
    {
        //printf("->PROOF");
        (yyval.a) = (newast(ntl_proof,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3471 "M.tab.c"
    break;

  case 189: /* LPROOF: PROOF TLINE  */
#line 1150 "M.y"
    {
        printf("->Line PROOF");
        (yyval.a) = (newast(ntl_proof,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3480 "M.tab.c"
    break;

  case 190: /* LQED: QED  */
#line 1157 "M.y"
    {
        //printf("->QED");
        (yyval.a) = (newast(ntl_qed,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3489 "M.tab.c"
    break;

  case 191: /* LQED: QED TLINE  */
#line 1162 "M.y"
    {
        printf("->Line QED");
        (yyval.a) = (newast(ntl_qed,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3498 "M.tab.c"
    break;

  case 192: /* LGIVEN: GIVEN  */
#line 1171 "M.y"
    {
        //printf("->GIVEN");
        (yyval.a) = (newast(ntl_given,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3507 "M.tab.c"
    break;

  case 193: /* LGIVEN: GIVEN TLINE  */
#line 1176 "M.y"
    {
        printf("->Line GIVEN");
        (yyval.a) = (newast(ntl_given,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3516 "M.tab.c"
    break;

  case 194: /* LSINCE: SINCE  */
#line 1184 "M.y"
    {
        //printf("->SINCE");
        (yyval.a) = (newast(ntl_since,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3525 "M.tab.c"
    break;

  case 195: /* LSINCE: SINCE TLINE  */
#line 1189 "M.y"
    {
        printf("->Line SINCE");
        (yyval.a) = (newast(ntl_since,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3534 "M.tab.c"
    break;

  case 196: /* LTRANS: TRANS  */
#line 1196 "M.y"
    {
        //printf("->TRANS");
        (yyval.a) = (newast(ntl_trans,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3543 "M.tab.c"
    break;

  case 197: /* LTRANS: TRANS TLINE  */
#line 1201 "M.y"
    {
        printf("->Line TRANS");
        (yyval.a) = (newast(ntl_trans,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3552 "M.tab.c"
    break;

  case 198: /* LUSE: USE  */
#line 1208 "M.y"
    {
        //printf("->USE");
        (yyval.a) = (newast(ntl_use,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3561 "M.tab.c"
    break;

  case 199: /* LUSE: USE TLINE  */
#line 1213 "M.y"
    {
        printf("->Line USE");
        (yyval.a) = (newast(ntl_use,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3570 "M.tab.c"
    break;

  case 200: /* LKASaverage: KASaverage  */
#line 1220 "M.y"
    {
        //printf("->KASaverage");
        (yyval.a) = (newast(ntl_KASaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3579 "M.tab.c"
    break;

  case 201: /* LKASaverage: KASaverage TLINE  */
#line 1225 "M.y"
    {
        printf("->Line KASaverage");
        (yyval.a) = (newast(ntl_KASaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3588 "M.tab.c"
    break;

  case 202: /* LKSGaverage: KSGaverage  */
#line 1232 "M.y"
    {
        //printf("->KSGaverage");
        (yyval.a) = (newast(ntl_KSGaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3597 "M.tab.c"
    break;

  case 203: /* LKSGaverage: KSGaverage TLINE  */
#line 1237 "M.y"
    {
        printf("->Line KSGaverage");
        (yyval.a) = (newast(ntl_KSGaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3606 "M.tab.c"
    break;

  case 204: /* LKAGaverage: KAGaverage  */
#line 1244 "M.y"
    {
        //printf("->KAGaverage");
        (yyval.a) = (newast(ntl_KAGaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3615 "M.tab.c"
    break;

  case 205: /* LKAGaverage: KAGaverage TLINE  */
#line 1249 "M.y"
    {
        printf("->Line KAGaverage");
        (yyval.a) = (newast(ntl_KAGaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3624 "M.tab.c"
    break;

  case 206: /* LREMEMBER: REMEMBER  */
#line 1256 "M.y"
    {
        //printf("->REMEMBER");
        (yyval.a) = (newast(ntl_remember,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3633 "M.tab.c"
    break;

  case 207: /* LREMEMBER: REMEMBER TLINE  */
#line 1261 "M.y"
    {
        printf("->Line REMEMBER");
        (yyval.a) = (newast(ntl_remember,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3642 "M.tab.c"
    break;

  case 208: /* LEQUNADD: EQUNADD  */
#line 1268 "M.y"
    {
        //printf("->EQUNADD");
        (yyval.a) = (newast(ntl_equnadd,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3651 "M.tab.c"
    break;

  case 209: /* LEQUNADD: EQUNADD TLINE  */
#line 1273 "M.y"
    {
        printf("->Line EQUNADD");
        (yyval.a) = (newast(ntl_equnadd,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3660 "M.tab.c"
    break;

  case 210: /* LCONCLUDE: CONCLUDE  */
#line 1280 "M.y"
    {
        //printf("->CONCLUDE");
        (yyval.a) = (newast(ntl_conclude,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3669 "M.tab.c"
    break;

  case 211: /* LCONCLUDE: CONCLUDE TLINE  */
#line 1285 "M.y"
    {
        printf("->Line EQUNADD");
        (yyval.a) = (newast(ntl_conclude,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3678 "M.tab.c"
    break;

  case 212: /* LTHEN: THEN  */
#line 1292 "M.y"
    {
        //printf("->THEN");
        (yyval.a) = (newast(ntl_then,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3687 "M.tab.c"
    break;

  case 213: /* LTHEN: THEN TLINE  */
#line 1297 "M.y"
    {
        printf("->Line THEN");
        (yyval.a) = (newast(ntl_then,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3696 "M.tab.c"
    break;

  case 214: /* LSAME: SAME  */
#line 1304 "M.y"
    {
        //printf("->SAME");
        (yyval.a) = (newast(ntl_same,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3705 "M.tab.c"
    break;

  case 215: /* LSAME: SAME TLINE  */
#line 1309 "M.y"
    {
        printf("->Line SAME");
        (yyval.a) = (newast(ntl_same,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3714 "M.tab.c"
    break;

  case 216: /* LLB1L: LB1L  */
#line 1316 "M.y"
    {
        //printf("->LB1L");
        (yyval.a) = (newast(ntl_LB1L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3723 "M.tab.c"
    break;

  case 217: /* LLB1L: LB1L TLINE  */
#line 1321 "M.y"
    {
        printf("->Line LB1L");
        (yyval.a) = (newast(ntl_LB1L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3732 "M.tab.c"
    break;

  case 218: /* LLB1R: LB1R  */
#line 1328 "M.y"
    {
        //printf("->LB1R");
        (yyval.a) = (newast(ntl_LB1R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3741 "M.tab.c"
    break;

  case 219: /* LLB1R: LB1R TLINE  */
#line 1333 "M.y"
    {
        printf("->Line LB1R");
        (yyval.a) = (newast(ntl_LB1R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3750 "M.tab.c"
    break;

  case 220: /* LLB2L: LB2L  */
#line 1340 "M.y"
    {
        //printf("->LB2L");
        (yyval.a) = (newast(ntl_LB2L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3759 "M.tab.c"
    break;

  case 221: /* LLB2L: LB2L TLINE  */
#line 1345 "M.y"
    {
        printf("->Line LB2L");
        (yyval.a) = (newast(ntl_LB2L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3768 "M.tab.c"
    break;

  case 222: /* LLB2R: LB2R  */
#line 1352 "M.y"
    {
        //printf("->LB2R");
        (yyval.a) = (newast(ntl_LB2R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3777 "M.tab.c"
    break;

  case 223: /* LLB2R: LB2R TLINE  */
#line 1357 "M.y"
    {
        printf("->Line LB2R");
        (yyval.a) = (newast(ntl_LB2R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3786 "M.tab.c"
    break;

  case 224: /* LLB3L: LB3L  */
#line 1364 "M.y"
    {
        //printf("->LB3L");
        (yyval.a) = (newast(ntl_LB3L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3795 "M.tab.c"
    break;

  case 225: /* LLB3L: LB3L TLINE  */
#line 1369 "M.y"
    {
        printf("->Line LB3L");
        (yyval.a) = (newast(ntl_LB3L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3804 "M.tab.c"
    break;

  case 226: /* LLB3R: LB3R  */
#line 1376 "M.y"
    {
        //printf("->LB3R");
        (yyval.a) = (newast(ntl_LB3R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3813 "M.tab.c"
    break;

  case 227: /* LLB3R: LB3R TLINE  */
#line 1381 "M.y"
    {
        printf("->Line LB3R");
        (yyval.a) = (newast(ntl_LB3R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3822 "M.tab.c"
    break;

  case 228: /* LABS: ABS  */
#line 1388 "M.y"
    {
        //printf("->ABS");
        (yyval.a) = (newast(ntl_abs,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3831 "M.tab.c"
    break;

  case 229: /* LABS: ABS TLINE  */
#line 1393 "M.y"
    {
        printf("->Line ABS");
        (yyval.a) = (newast(ntl_abs,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3840 "M.tab.c"
    break;

  case 230: /* LMIN: MIN  */
#line 1400 "M.y"
    {
        //printf("->MIN");
        (yyval.a) = (newast(ntl_min,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3849 "M.tab.c"
    break;

  case 231: /* LMIN: MIN TLINE  */
#line 1405 "M.y"
    {
        printf("->Line MIN");
        (yyval.a) = (newast(ntl_min,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3858 "M.tab.c"
    break;

  case 232: /* LLCEIL: LCEIL  */
#line 1412 "M.y"
    {
        //printf("->LCEIL");
        (yyval.a) = (newast(ntl_LCEIL,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3867 "M.tab.c"
    break;

  case 233: /* LLCEIL: LCEIL TLINE  */
#line 1417 "M.y"
    {
        printf("->Line LCEIL");
        (yyval.a) = (newast(ntl_LCEIL,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3876 "M.tab.c"
    break;

  case 234: /* LRCEIL: RCEIL  */
#line 1424 "M.y"
    {
        //printf("->RCEIL");
        (yyval.a) = (newast(ntl_RCEIL,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3885 "M.tab.c"
    break;

  case 235: /* LRCEIL: RCEIL TLINE  */
#line 1429 "M.y"
    {
        printf("->Line RCEIL");
        (yyval.a) = (newast(ntl_RCEIL,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3894 "M.tab.c"
    break;

  case 236: /* LLFLOOR: LFLOOR  */
#line 1436 "M.y"
    {
        //printf("->LFLOOR");
        (yyval.a) = (newast(ntl_LFLOOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3903 "M.tab.c"
    break;

  case 237: /* LLFLOOR: LFLOOR TLINE  */
#line 1441 "M.y"
    {
        printf("->Line LFLOOR");
        (yyval.a) = (newast(ntl_LFLOOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3912 "M.tab.c"
    break;

  case 238: /* LRFLOOR: RFLOOR  */
#line 1448 "M.y"
    {
        //printf("->RFLOOR");
        (yyval.a) = (newast(ntl_RFLOOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3921 "M.tab.c"
    break;

  case 239: /* LRFLOOR: RFLOOR TLINE  */
#line 1453 "M.y"
    {
        printf("->Line RFLOOR");
        (yyval.a) = (newast(ntl_RFLOOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3930 "M.tab.c"
    break;

  case 240: /* LLIM_DEF: LIM_DEF  */
#line 1460 "M.y"
    {
        //printf("->LIM_DEF");
        (yyval.a) = (newast(ntl_LIM_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3939 "M.tab.c"
    break;

  case 241: /* LLIM_DEF: LIM_DEF TLINE  */
#line 1465 "M.y"
    {
        printf("->Line LIM_DEF");
        (yyval.a) = (newast(ntl_LIM_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3948 "M.tab.c"
    break;

  case 242: /* LTO_PROVE: TO_PROVE  */
#line 1472 "M.y"
    {
        //printf("->TO_PROVE");
        (yyval.a) = (newast(ntl_TO_PROVE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3957 "M.tab.c"
    break;

  case 243: /* LTO_PROVE: TO_PROVE TLINE  */
#line 1477 "M.y"
    {
        printf("->Line TO_PROVE");
        (yyval.a) = (newast(ntl_TO_PROVE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3966 "M.tab.c"
    break;

  case 244: /* TLsin: Tsin  */
#line 1484 "M.y"
    {
        //printf("->Tsin");
        (yyval.a) = (newast(ntl_sin,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3975 "M.tab.c"
    break;

  case 245: /* TLsin: Tsin TLINE  */
#line 1489 "M.y"
    {
        printf("->Line Tsin");
        (yyval.a) = (newast(ntl_sin,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3984 "M.tab.c"
    break;

  case 246: /* TLcos: Tcos  */
#line 1496 "M.y"
    {
        //printf("->Tcos");
        (yyval.a) = (newast(ntl_cos,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3993 "M.tab.c"
    break;

  case 247: /* TLcos: Tcos TLINE  */
#line 1501 "M.y"
    {
        printf("->Line Tcos");
        (yyval.a) = (newast(ntl_cos,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4002 "M.tab.c"
    break;

  case 248: /* TLsup: Tsup  */
#line 1508 "M.y"
    {
        //printf("->Tsup");
        (yyval.a) = (newast(ntl_sup,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4011 "M.tab.c"
    break;

  case 249: /* TLsup: Tsup TLINE  */
#line 1513 "M.y"
    {
        printf("->Line Tsup");
        (yyval.a) = (newast(ntl_sup,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4020 "M.tab.c"
    break;

  case 250: /* LCONTINUE_DEF: CONTINUE_DEF  */
#line 1520 "M.y"
    {
        //printf("->CONTINUE_DEF");
        (yyval.a) = (newast(ntl_CONTINUE_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4029 "M.tab.c"
    break;

  case 251: /* LCONTINUE_DEF: CONTINUE_DEF TLINE  */
#line 1525 "M.y"
    {
        printf("->Line CONTINUE_DEF");
        (yyval.a) = (newast(ntl_CONTINUE_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4038 "M.tab.c"
    break;

  case 252: /* LUC_DEF: UC_DEF  */
#line 1532 "M.y"
    {
        //printf("->UC_DEF");
        (yyval.a) = (newast(ntl_UC_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4047 "M.tab.c"
    break;

  case 253: /* LUC_DEF: UC_DEF TLINE  */
#line 1537 "M.y"
    {
        printf("->Line UC_DEF");
        (yyval.a) = (newast(ntl_UC_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4056 "M.tab.c"
    break;

  case 254: /* LSUPRE_THEOREM: SUPRE_THEOREM  */
#line 1544 "M.y"
{
        //printf("->SUPRE_THEOREM");
        (yyval.a) = (newast(ntl_SUPRE_THEOREM,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4065 "M.tab.c"
    break;

  case 255: /* LSUPRE_THEOREM: SUPRE_THEOREM TLINE  */
#line 1549 "M.y"
    {
        printf("->Line SUPRE_THEOREM");
        (yyval.a) = (newast(ntl_SUPRE_THEOREM,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4074 "M.tab.c"
    break;

  case 256: /* LSUPRE_DEF: SUPRE_DEF  */
#line 1556 "M.y"
{
        //printf("->SUPRE_DEF");
        (yyval.a) = (newast(ntl_SUPRE_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4083 "M.tab.c"
    break;

  case 257: /* LSUPRE_DEF: SUPRE_DEF TLINE  */
#line 1561 "M.y"
    {
        printf("->Line SUPRE_DEF");
        (yyval.a) = (newast(ntl_SUPRE_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4092 "M.tab.c"
    break;

  case 258: /* LBOUND_BELOW: BOUND_BELOW  */
#line 1568 "M.y"
{
        //printf("->BOUND_BELOW");
        (yyval.a) = (newast(ntl_BOUND_BELOW,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4101 "M.tab.c"
    break;

  case 259: /* LBOUND_BELOW: BOUND_BELOW TLINE  */
#line 1573 "M.y"
    {
        printf("->Line BOUND_BELOW");
        (yyval.a) = (newast(ntl_BOUND_BELOW,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4110 "M.tab.c"
    break;

  case 260: /* LBOUND_ABOVE: BOUND_ABOVE  */
#line 1580 "M.y"
{
        //printf("->BOUND_ABOVE");
        (yyval.a) = (newast(ntl_BOUND_ABOVE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4119 "M.tab.c"
    break;

  case 261: /* LBOUND_ABOVE: BOUND_ABOVE TLINE  */
#line 1585 "M.y"
    {
        printf("->Line BOUND_ABOVE");
        (yyval.a) = (newast(ntl_BOUND_ABOVE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4128 "M.tab.c"
    break;

  case 262: /* LFSqueeze: FSqueeze  */
#line 1592 "M.y"
    {
        //printf("->FSqueeze");
        (yyval.a) = (newast(ntl_FSqueeze,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4137 "M.tab.c"
    break;

  case 263: /* LFSqueeze: FSqueeze TLINE  */
#line 1597 "M.y"
    {
        printf("->Line FSqueeze");
        (yyval.a) = (newast(ntl_FSqueeze,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4146 "M.tab.c"
    break;

  case 264: /* LINTROS: INTROS  */
#line 1603 "M.y"
    {
        //printf("->INTROS");
        (yyval.a) = (newast(ntl_INTROS,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4155 "M.tab.c"
    break;

  case 265: /* LINTROS: INTROS TLINE  */
#line 1608 "M.y"
    {
        printf("->Line INTROS");
        (yyval.a) = (newast(ntl_INTROS,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4164 "M.tab.c"
    break;

  case 266: /* LSET: SET  */
#line 1616 "M.y"
    {
        //printf("->SET");
        (yyval.a) = (newast(ntl_SET,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4173 "M.tab.c"
    break;

  case 267: /* LSET: SET TLINE  */
#line 1621 "M.y"
    {
        printf("->Line SET");
        (yyval.a) = (newast(ntl_SET,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4182 "M.tab.c"
    break;

  case 268: /* LFOR: FOR  */
#line 1628 "M.y"
    {
        //printf("->FOR");
        (yyval.a) = (newast(ntl_FOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4191 "M.tab.c"
    break;

  case 269: /* LFOR: FOR TLINE  */
#line 1633 "M.y"
    {
        printf("->Line FOR");
        (yyval.a) = (newast(ntl_FOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4200 "M.tab.c"
    break;

  case 270: /* LDERI: DERI  */
#line 1640 "M.y"
    {
        //printf("->DERI");
        (yyval.a) = (newast(ntl_DERI,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4209 "M.tab.c"
    break;

  case 271: /* LDERI: DERI TLINE  */
#line 1645 "M.y"
    {
        printf("->Line DERI");
        (yyval.a) = (newast(ntl_DERI,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4218 "M.tab.c"
    break;

  case 272: /* LBOTH: BOTH  */
#line 1652 "M.y"
    {
        //printf("->BOTH");
        (yyval.a) = (newast(ntl_BOTH,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4227 "M.tab.c"
    break;

  case 273: /* LBOTH: BOTH TLINE  */
#line 1657 "M.y"
    {
        printf("->Line BOTH");
        (yyval.a) = (newast(ntl_BOTH,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4236 "M.tab.c"
    break;

  case 274: /* LCOMMA: COMMA  */
#line 1664 "M.y"
    {
        //printf("->COMMA");
        (yyval.a) = (newast(ntl_COMMA,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4245 "M.tab.c"
    break;

  case 275: /* LCOMMA: COMMA TLINE  */
#line 1669 "M.y"
    {
        printf("->Line COMMA");
        (yyval.a) = (newast(ntl_COMMA,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4254 "M.tab.c"
    break;

  case 276: /* TLforall: Tforall  */
#line 1676 "M.y"
    {
        //printf("->Tforall");
        (yyval.a) = (newast(ntl_Tforall,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4263 "M.tab.c"
    break;

  case 277: /* TLforall: Tforall TLINE  */
#line 1681 "M.y"
    {
        printf("->Line Tforall");
        (yyval.a) = (newast(ntl_Tforall,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4272 "M.tab.c"
    break;

  case 278: /* TLexists: Texists  */
#line 1688 "M.y"
    {
        //printf("->Texists");
        (yyval.a) = (newast(ntl_Texists,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4281 "M.tab.c"
    break;

  case 279: /* TLexists: Texists TLINE  */
#line 1693 "M.y"
    {
        printf("->Line Texists");
        (yyval.a) = (newast(ntl_Texists,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4290 "M.tab.c"
    break;

  case 280: /* LSUPPOSE: SUPPOSE  */
#line 1700 "M.y"
    {
        //printf("->SUPPOSE");
        (yyval.a) = (newast(ntl_SUPPOSE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4299 "M.tab.c"
    break;

  case 281: /* LSUPPOSE: SUPPOSE TLINE  */
#line 1705 "M.y"
    {
        printf("->Line SUPPOSE");
        (yyval.a) = (newast(ntl_SUPPOSE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4308 "M.tab.c"
    break;

  case 282: /* LIN: IN  */
#line 1712 "M.y"
    {
        //printf("->IN");
        (yyval.a) = (newast(ntl_IN,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4317 "M.tab.c"
    break;

  case 283: /* LIN: IN TLINE  */
#line 1717 "M.y"
    {
        printf("->Line IN");
        (yyval.a) = (newast(ntl_IN,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4326 "M.tab.c"
    break;

  case 284: /* LIS: IS  */
#line 1724 "M.y"
    {
        //printf("->IS");
        (yyval.a) = (newast(ntl_IS,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4335 "M.tab.c"
    break;

  case 285: /* LIS: IS TLINE  */
#line 1729 "M.y"
    {
        printf("->Line IS");
        (yyval.a) = (newast(ntl_IS,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4344 "M.tab.c"
    break;

  case 286: /* LIF: IF  */
#line 1736 "M.y"
    {
        //printf("->IF");
        (yyval.a) = (newast(ntl_IF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4353 "M.tab.c"
    break;

  case 287: /* LIF: IF TLINE  */
#line 1741 "M.y"
    {
        printf("->Line IF");
        (yyval.a) = (newast(ntl_IF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4362 "M.tab.c"
    break;

  case 288: /* LHAVE: HAVE  */
#line 1748 "M.y"
    {
        //printf("->HAVE");
        (yyval.a) = (newast(ntl_HAVE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4371 "M.tab.c"
    break;

  case 289: /* LHAVE: HAVE TLINE  */
#line 1753 "M.y"
    {
        printf("->Line HAVE");
        (yyval.a) = (newast(ntl_HAVE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4380 "M.tab.c"
    break;

  case 290: /* LCONTINUE: CONTINUE  */
#line 1760 "M.y"
    {
        //printf("->CONTINUE");
        (yyval.a) = (newast(ntl_CONTINUE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4389 "M.tab.c"
    break;

  case 291: /* LCONTINUE: CONTINUE TLINE  */
#line 1765 "M.y"
    {
        printf("->Line CONTINUE");
        (yyval.a) = (newast(ntl_CONTINUE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4398 "M.tab.c"
    break;

  case 292: /* LUCONTINUE: UCONTINUE  */
#line 1772 "M.y"
    {
        //printf("->UCONTINUE");
        (yyval.a) = (newast(ntl_UCONTINUE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4407 "M.tab.c"
    break;

  case 293: /* LUCONTINUE: UCONTINUE TLINE  */
#line 1777 "M.y"
    {
        printf("->Line UCONTINUE");
        (yyval.a) = (newast(ntl_UCONTINUE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4416 "M.tab.c"
    break;

  case 294: /* LAUTO_CONC: AUTO_CONC  */
#line 1783 "M.y"
    {
        //printf("->AUTO_CONC");
        (yyval.a) = (newast(ntl_AUTO_CONC,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4425 "M.tab.c"
    break;

  case 295: /* LAUTO_CONC: AUTO_CONC TLINE  */
#line 1788 "M.y"
    {
        printf("->Line AUTO_CONC");
        (yyval.a) = (newast(ntl_AUTO_CONC,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4434 "M.tab.c"
    break;

  case 296: /* LAUTO_NOHINT: AUTO_NOHINT  */
#line 1795 "M.y"
    {
        //printf("->AUTO_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_NOHINT,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4443 "M.tab.c"
    break;

  case 297: /* LAUTO_NOHINT: AUTO_NOHINT TLINE  */
#line 1800 "M.y"
    {
        printf("->Line AUTO_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_NOHINT,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4452 "M.tab.c"
    break;

  case 298: /* LBECAUSE: BECAUSE  */
#line 1806 "M.y"
    {
        //printf("->BECAUSE");
        (yyval.a) = (newast(ntl_BECAUSE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4461 "M.tab.c"
    break;

  case 299: /* LBECAUSE: BECAUSE TLINE  */
#line 1811 "M.y"
    {
        printf("->Line BECAUSE");
        (yyval.a) = (newast(ntl_BECAUSE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4470 "M.tab.c"
    break;

  case 300: /* TLBELONG: TBELONG  */
#line 1817 "M.y"
    {
        //printf("->TBELONG");
        (yyval.a) = (newast(ntl_TBELONG,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4479 "M.tab.c"
    break;

  case 301: /* TLBELONG: TBELONG TLINE  */
#line 1822 "M.y"
    {
        printf("->Line TBELONG");
        (yyval.a) = (newast(ntl_TBELONG,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4488 "M.tab.c"
    break;

  case 302: /* LMONOINC: MONOINC  */
#line 1828 "M.y"
    {
        //printf("->MONOINC");
        (yyval.a) = (newast(ntl_MONOINC,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4497 "M.tab.c"
    break;

  case 303: /* LMONOINC: MONOINC TLINE  */
#line 1833 "M.y"
    {
        printf("->Line MONOINC");
        (yyval.a) = (newast(ntl_MONOINC,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4506 "M.tab.c"
    break;

  case 304: /* LMONODEC: MONODEC  */
#line 1839 "M.y"
    {
        //printf("->MONODEC");
        (yyval.a) = (newast(ntl_MONODEC,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4515 "M.tab.c"
    break;

  case 305: /* LMONODEC: MONODEC TLINE  */
#line 1844 "M.y"
    {
        printf("->Line MONOINC");
        (yyval.a) = (newast(ntl_MONODEC,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4524 "M.tab.c"
    break;

  case 306: /* LPAP: PAP  */
#line 1850 "M.y"
    {
        //printf("->PAP");
        (yyval.a) = (newast(ntl_PAP,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 4533 "M.tab.c"
    break;

  case 307: /* LPAP: PAP TLINE  */
#line 1855 "M.y"
    {
        printf("->Line PAP ");
        (yyval.a) = (newast(ntl_PAP,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 4542 "M.tab.c"
    break;


#line 4546 "M.tab.c"

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

#line 1860 "M.y"


void yyerror(char* s)
{
    fprintf(stderr , "%s\n",s);
}
