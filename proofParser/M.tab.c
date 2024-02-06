/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "M.y" /* yacc.c:339  */

	// this part is copied to the beginning of the parser 
	#include "func.h"
	#include <stdio.h>
	#include "flex.h"
	void yyerror(char*);
	int yylex(void);
	struct ast *root;

#line 76 "M.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "M.tab.h".  */
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
#line 11 "M.y" /* yacc.c:355  */

//no special need for double ,just to make a union to define the type as node.
struct ast* a;
double d;

#line 209 "M.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_M_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 226 "M.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

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

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
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


#if ! defined yyoverflow || YYERROR_VERBOSE

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
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
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
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  59
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   767

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  87
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  91
/* YYNRULES -- Number of rules.  */
#define YYNRULES  246
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  413

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   341

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
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
      85,    86
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    66,    66,    72,    81,    86,    91,    96,   101,   107,
     113,   118,   124,   130,   136,   141,   146,   151,   159,   165,
     173,   181,   188,   194,   199,   205,   212,   217,   222,   227,
     232,   237,   242,   247,   252,   257,   264,   272,   278,   284,
     290,   299,   304,   309,   314,   319,   324,   329,   336,   342,
     350,   355,   361,   366,   371,   376,   383,   389,   394,   399,
     404,   409,   414,   419,   424,   433,   438,   443,   448,   453,
     458,   463,   468,   473,   478,   483,   488,   493,   498,   503,
     508,   513,   518,   523,   528,   534,   539,   544,   549,   554,
     563,   568,   573,   578,   583,   588,   595,   600,   606,   612,
     617,   622,   627,   632,   639,   645,   654,   661,   666,   674,
     679,   686,   691,   698,   703,   712,   717,   724,   729,   736,
     741,   748,   753,   760,   765,   772,   777,   784,   789,   796,
     801,   808,   813,   820,   825,   832,   837,   844,   849,   856,
     861,   868,   873,   880,   885,   892,   897,   904,   909,   916,
     921,   929,   934,   941,   946,   953,   958,   965,   970,   979,
     984,   992,   997,  1004,  1009,  1016,  1021,  1028,  1033,  1040,
    1045,  1052,  1057,  1064,  1069,  1076,  1081,  1088,  1093,  1100,
    1105,  1112,  1117,  1124,  1129,  1136,  1141,  1148,  1153,  1160,
    1165,  1172,  1177,  1184,  1189,  1196,  1201,  1208,  1213,  1220,
    1225,  1232,  1237,  1244,  1249,  1256,  1261,  1268,  1273,  1280,
    1285,  1292,  1297,  1304,  1309,  1316,  1321,  1328,  1333,  1340,
    1345,  1351,  1356,  1363,  1368,  1375,  1380,  1387,  1392,  1399,
    1404,  1411,  1416,  1423,  1428,  1435,  1440,  1447,  1452,  1459,
    1464,  1471,  1476,  1483,  1488,  1495,  1500
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "TCONST", "TFUNC", "TNUM", "TVAR",
  "Tadd", "Ttimes", "Tdiv", "Tminus", "Tfrac", "Tsqrt", "Tsin", "Tcos",
  "Tln", "Tderi", "DERI", "BOTH", "Teq", "Tleq", "Tgeq", "Tneq", "Tequiv",
  "Tlt", "Tgt", "Deq", "Tlim", "Tto", "Tinfty", "TPinfty", "TNinfty",
  "GOAL", "MATH1", "MATH2", "PROOF", "CODEBOX", "QED", "ASSUM", "GIVEN",
  "COMMA", "PWP", "PAP", "CWP", "CAP", "CS", "PS", "KASaverage",
  "KSGaverage", "KAGaverage", "REMEMBER", "CONCLUDE", "EQUNADD", "SINCE",
  "TRANS", "THEN", "SAME", "FOR", "LB1L", "LB1R", "LB2L", "LB2R", "LB3L",
  "LB3R", "ABS", "MIN", "LCEIL", "RCEIL", "LFLOOR", "RFLOOR", "LIM_DEF",
  "TO_PROVE", "INTROS", "SUPPOSE", "SET", "AUTO_CONC", "AUTO_NOHINT",
  "USE", "Tforall", "Texists", "Tpower", "IN", "CONTINUE", "CONTINUE_DEF",
  "UC_DEF", "FSqueeze", "TLINE", "$accept", "PROGRAM", "STATEMENT",
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
  "LRFLOOR", "LLIM_DEF", "LTO_PROVE", "TLsin", "TLcos", "LCONTINUE_DEF",
  "LUC_DEF", "LFSqueeze", "LINTROS", "LSET", "LFOR", "LDERI", "LBOTH",
  "LCOMMA", "TLforall", "TLexists", "LSUPPOSE", "LIN", "LCONTINUE",
  "LAUTO_CONC", "LAUTO_NOHINT", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341
};
# endif

#define YYPACT_NINF -317

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-317)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     690,   -67,   -54,   -28,    12,    24,    30,    41,    46,    66,
      70,    76,    81,    86,    90,   109,   114,   179,   690,  -317,
    -317,  -317,   -18,    -3,    31,   138,   149,   115,   198,   198,
    -317,  -317,   115,   310,   133,  -317,   200,   198,   198,   -13,
     115,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
    -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
    -317,   121,   691,   127,  -317,  -317,   483,   506,   115,   -17,
    -317,   129,  -317,  -317,   136,   199,   -15,   199,   -15,  -317,
     115,   140,   146,   147,   148,  -317,  -317,   170,   375,   415,
    -317,  -317,  -317,   200,  -317,   155,   157,   158,   174,   174,
     174,   161,   187,  -317,   243,   177,   178,   198,  -317,  -317,
    -317,   183,   184,   185,   188,   189,   201,   204,   205,   206,
     211,   216,   217,   220,   223,  -317,    93,  -317,    -2,  -317,
      63,   223,   223,   223,   610,   691,   691,   215,   223,   223,
     223,   223,  -317,   225,   228,   276,   199,   276,   230,   112,
     587,   691,   198,   198,   281,   281,   199,   281,   230,   112,
     198,   280,   245,   280,  -317,  -317,  -317,   246,   691,   198,
     198,   691,   198,  -317,  -317,  -317,  -317,  -317,   255,  -317,
     276,   365,   365,   281,   187,  -317,  -317,  -317,   259,  -317,
    -317,  -317,  -317,   262,  -317,   263,   115,  -317,  -317,   338,
    -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
    -317,  -317,  -317,   691,   691,   691,   691,   691,   223,   270,
    -317,   288,   215,   691,   691,   691,   691,   198,   691,   126,
     291,   249,   691,   691,   691,   691,   691,  -317,  -317,  -317,
    -317,   289,   290,   293,   296,   297,   306,   691,  -317,  -317,
    -317,  -317,  -317,  -317,  -317,   308,   134,   337,   313,   276,
     198,   115,  -317,  -317,  -317,   691,   281,   314,   138,  -317,
     138,  -317,   317,   276,   215,   342,   326,   281,  -317,  -317,
    -317,  -317,  -317,  -317,  -317,   691,   691,  -317,   291,   354,
      13,    13,   354,   691,  -317,  -317,   198,   330,   291,   291,
     291,   368,   126,   318,   387,   319,   223,  -317,   313,   291,
     291,   291,   291,  -317,  -317,  -317,  -317,  -317,  -317,   354,
    -317,   321,   627,   691,   627,   115,  -317,   115,   115,  -317,
    -317,   230,   115,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
    -317,   317,   326,  -317,   291,   342,   223,  -317,  -317,   223,
     325,   523,  -317,  -317,  -317,  -317,   691,   691,   348,   347,
    -317,  -317,  -317,   331,   110,   342,   110,   110,   342,  -317,
    -317,  -317,  -317,  -317,  -317,  -317,  -317,   691,   691,  -317,
     333,   291,   362,   362,   362,   291,   126,   345,  -317,   346,
    -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
     291,   291,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
    -317,  -317,  -317
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,   229,   149,   151,   153,   155,   157,   159,   161,   181,
     187,   221,   237,   223,   243,   245,   165,     0,     2,     5,
       4,    14,     0,     0,     0,   107,     0,     0,     0,     0,
       7,     6,     0,     0,     0,    99,     0,     0,     0,     0,
       0,   105,   100,   230,   150,   152,   154,   156,   158,   160,
     162,   182,   188,   222,   238,   224,   244,   246,   166,     1,
       3,   239,     0,   179,    15,    31,     0,     0,     0,     0,
     108,   175,   104,    21,   111,     0,     0,     0,     0,    20,
      18,   167,   169,   171,   219,    97,    96,     0,     0,     0,
      90,    91,    92,     0,    95,   207,   215,   217,     0,     0,
       0,   113,     0,    22,     0,   227,   225,     0,   102,    23,
     240,   109,   121,   115,   211,   213,   117,   139,   183,   191,
     195,   197,   199,   203,     0,    89,     0,    66,    65,    67,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   180,   233,   235,     0,    89,     0,     0,    65,
       0,     0,     0,     0,     0,     0,    89,     0,     0,    65,
       0,    16,   177,     0,    10,   176,   112,   125,     0,     0,
       0,     0,     0,    19,   168,   170,   172,   220,   163,   101,
       0,     0,     0,     0,     0,   208,   216,   218,   209,    11,
      12,    13,   114,   189,   106,   123,     0,   228,   226,     0,
     110,   122,   116,   212,   214,   118,   140,   184,   192,   196,
     198,   200,   204,     0,     0,     0,     0,     0,     0,   241,
      17,   119,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   234,   236,    26,
      29,   127,   129,   135,   137,   131,   133,     0,    41,    42,
      43,    46,    47,    44,    45,   147,     0,     0,     0,     0,
      50,     0,    27,    28,    30,     0,     0,   173,     0,   178,
       0,   126,     0,     0,     0,     0,     0,     0,   164,    93,
      94,    98,   210,   190,   124,     0,     0,   103,     0,    70,
      73,    72,    71,     0,   242,   120,     0,     0,     0,     0,
       0,     0,     0,   185,    80,   193,     0,    69,     0,     0,
       0,     0,     0,   128,   130,   136,   138,   132,   134,    36,
     148,   231,     0,     0,     0,     0,    51,     0,     0,    48,
      49,    36,     0,   174,     8,     9,    38,    40,    56,    37,
      39,     0,     0,    84,     0,     0,     0,    74,    76,     0,
     141,     0,    68,   186,    81,   194,     0,     0,     0,     0,
      77,    78,   232,   145,     0,     0,     0,     0,     0,    32,
      33,    35,    34,    24,    25,    87,    82,     0,     0,   142,
     143,     0,     0,     0,     0,     0,     0,   201,    85,   205,
      86,   146,    57,    59,    61,    63,    64,    58,    60,    62,
       0,     0,   144,    55,    52,    54,    53,    79,    88,   202,
     206,    75,    83
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -317,   418,  -317,   358,  -317,  -317,  -317,   -20,   -66,    47,
     298,   180,  -148,  -317,    25,   -12,    -5,   -23,  -317,  -317,
    -131,   419,  -317,     8,   -34,  -317,  -317,   143,  -317,   351,
      -9,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
    -316,   100,  -317,     6,     0,  -317,  -317,  -317,  -317,  -317,
    -317,  -317,  -317,  -317,   294,  -317,  -317,   428,  -317,   -38,
    -260,    -6,  -175,   -60,   -16,   227,  -317,  -317,  -317,  -317,
    -317,  -317,    65,  -317,  -317,  -317,  -317,  -317,  -317,  -317,
    -317,   257,  -317,  -232,    20,  -317,  -317,  -317,  -317,  -317,
    -317
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    17,    18,    79,    19,    20,    21,    80,   145,    65,
     265,   155,   259,   124,   125,   147,   148,   180,    23,    24,
      25,    26,   127,   128,   129,   130,   131,   222,   132,   248,
     168,   249,   250,   251,   252,   253,   254,   133,   351,   382,
     365,   257,    27,    66,    67,    30,    31,    32,    33,   179,
      34,    90,    91,    92,   268,    72,   164,    68,    35,   134,
     304,    36,   194,   135,   306,   136,   137,   138,   388,   139,
     390,    98,   189,   140,   141,    99,   100,    94,    37,    38,
     107,   108,    39,   322,   152,   153,    40,    62,   220,    41,
      42
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint16 yytable[] =
{
      29,   154,   102,    64,   105,   261,    28,    73,   368,   281,
      86,   167,   266,    85,   221,   338,     3,     4,    29,    43,
     109,   215,   216,   154,    28,   323,   324,    93,   150,   150,
       3,     4,    44,    89,   162,   383,    76,    78,   170,    88,
     170,    87,   352,   118,   106,   103,   104,    22,   161,   163,
     150,   150,    63,    75,    77,   157,   118,   126,    45,   184,
     151,   151,   158,    61,   213,    22,   183,   169,   171,   172,
     224,   225,   226,   227,   149,   159,   357,   157,   233,   234,
     235,   236,   151,   151,   158,   376,    63,   160,   182,   182,
     170,   146,   156,   218,   181,   181,   149,   159,    46,   232,
     214,   215,   216,   217,   392,   394,   395,   397,   399,   160,
      47,   170,   326,   146,   156,   199,    48,   214,   215,   216,
     217,   170,   346,    10,   223,   119,   408,    49,   221,   229,
     230,   231,    50,   214,   215,   216,   217,   334,   167,   335,
     169,   214,   215,   216,   217,   256,   258,   171,     3,     4,
     172,   239,    51,   240,   262,   263,    52,   264,   293,   183,
     260,   260,    53,   272,   190,   191,   276,    54,   260,   303,
     118,   193,    55,   218,   321,   219,    56,   274,   275,    59,
     274,   182,   182,   280,   296,   303,   279,   181,   181,   393,
     218,   396,   398,   303,   273,    57,   286,   277,    10,   329,
      58,    71,   285,    95,    74,   101,   218,   110,   288,   289,
     290,   291,   292,   142,   218,   165,    96,    97,   297,   298,
     299,   300,   166,   302,   178,   167,   174,   308,   309,   310,
     311,   312,   175,   176,   177,   301,   170,   214,   215,   216,
     217,   185,   319,   186,   187,   188,   356,   192,   193,   195,
     241,   242,   243,   244,   245,   246,   214,   215,   216,   217,
     331,   328,   195,   197,   198,   325,   332,   327,   260,   200,
     201,   202,   343,   118,   203,   204,   339,   340,   336,   337,
     341,   342,   347,   348,   349,   119,   377,   205,   344,   378,
     206,   207,   208,   358,   359,   360,   361,   209,   214,   215,
     216,   217,   210,   211,   345,   369,   212,   370,   371,     3,
     218,   237,   372,   120,   238,     4,    74,   364,   366,   367,
     214,   215,   216,   217,   214,   215,   216,   217,   375,   218,
     267,   269,   271,   214,   215,   216,   217,   214,   215,   216,
     217,   278,   374,     3,     4,   282,   381,   373,   283,   284,
       3,   385,   386,   321,   305,   105,   294,    81,    82,    83,
       4,   214,   215,   216,   217,   403,   404,   405,   406,   407,
      10,   218,   400,   401,   295,   313,   314,   321,   111,   315,
     101,    74,   316,   317,   411,   412,   112,   113,   114,   115,
     116,   193,   318,   218,   320,    84,   350,   218,     3,     4,
     333,   303,   117,   221,   353,   355,   218,   362,     3,     4,
     218,   379,    81,    82,    83,   387,   389,   391,   111,   402,
     101,    74,    81,    82,    83,   305,   112,   113,   114,   115,
     116,   409,   410,   118,   218,    10,    60,   119,   173,   120,
     121,   122,   117,   123,    70,   330,   247,   354,     3,     4,
      84,   384,    69,   143,   144,   196,   287,   270,   307,     0,
      84,     0,    81,    82,    83,     0,     0,     0,     0,     0,
       0,     0,     0,   118,     0,    10,     0,   119,     0,   120,
     121,   122,     0,   123,     0,     0,   111,     0,   101,    74,
       0,     0,     0,   143,   112,   113,   114,   115,   116,     0,
      84,     0,     0,     0,     0,     0,     0,     0,     0,   111,
     117,   101,    74,     0,     0,     0,     0,   112,   113,   114,
     115,   116,     0,     0,     0,     0,   111,     0,   101,    74,
       0,     0,     0,   117,   112,   113,   114,   115,   116,     0,
       0,   118,     0,    10,     0,   119,     0,   120,   121,   122,
     117,   123,   380,   363,   255,     0,     0,     0,     0,     0,
       0,   143,   144,     0,   118,     0,    10,     0,   119,     0,
     120,   121,   122,     0,   123,     0,     0,     0,     0,     0,
       0,   118,     0,     0,   143,   119,     0,   120,   121,   122,
     111,   123,   101,    74,     0,     0,     0,   228,   112,   113,
     114,   115,   116,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   111,   117,   101,    74,     0,   255,     0,
     228,   112,   113,   114,   115,   116,     0,     0,     0,     0,
     111,     0,   101,    74,     0,     0,     0,   117,   112,   113,
     114,   115,   116,     0,     0,   118,     0,     0,     0,   119,
       0,   120,   121,   122,   117,   123,     0,   363,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   118,     0,
       0,     0,   119,     0,   120,   121,   122,     0,   123,     0,
       0,     0,     0,     0,     0,   118,     0,     0,     0,   119,
       0,   120,   121,   122,   111,   123,   101,    74,     0,     0,
       0,     0,   112,   113,   114,   115,   116,     0,     1,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   117,     0,
       0,     0,     2,     3,     4,     5,     0,     6,     0,     7,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     9,     0,     0,   118,
      10,     0,     0,   119,     0,   120,   121,   122,     0,   123,
       0,     0,    11,    12,    13,    14,    15,    16
};

static const yytype_int16 yycheck[] =
{
       0,    67,    36,    23,    17,   153,     0,    27,   324,   184,
      33,    26,   160,    33,    16,   275,    33,    34,    18,    86,
      40,     8,     9,    89,    18,   257,   258,    33,    66,    67,
      33,    34,    86,    33,    51,   351,    28,    29,    76,    33,
      78,    33,   302,    58,    57,    37,    38,     0,    68,    69,
      88,    89,    55,    28,    29,    67,    58,    62,    86,    93,
      66,    67,    67,    81,   124,    18,    89,    76,    77,    78,
     130,   131,   132,   133,    66,    67,   308,    89,   138,   139,
     140,   141,    88,    89,    89,   345,    55,    67,    88,    89,
     128,    66,    67,    80,    88,    89,    88,    89,    86,   137,
       7,     8,     9,    10,   364,   365,   366,   367,   368,    89,
      86,   149,   260,    88,    89,   107,    86,     7,     8,     9,
      10,   159,   297,    60,   130,    62,   386,    86,    16,   134,
     135,   136,    86,     7,     8,     9,    10,   268,    26,   270,
     149,     7,     8,     9,    10,   150,   151,   156,    33,    34,
     159,   145,    86,   147,   154,   155,    86,   157,   218,   182,
     152,   153,    86,   168,    99,   100,   171,    86,   160,    59,
      58,    61,    86,    80,    40,    82,    86,   169,   170,     0,
     172,   181,   182,   183,   222,    59,   180,   181,   182,   364,
      80,   366,   367,    59,   169,    86,   196,   172,    60,   265,
      86,    52,   196,    70,     6,     5,    80,    86,   213,   214,
     215,   216,   217,    86,    80,    86,    83,    84,   223,   224,
     225,   226,    86,   228,    54,    26,    86,   232,   233,   234,
     235,   236,    86,    86,    86,   227,   274,     7,     8,     9,
      10,    86,   247,    86,    86,    71,   306,    86,    61,    19,
      20,    21,    22,    23,    24,    25,     7,     8,     9,    10,
     265,   261,    19,    86,    86,   259,   266,   261,   260,    86,
      86,    86,   288,    58,    86,    86,   276,   277,   272,   273,
     285,   286,   298,   299,   300,    62,   346,    86,   293,   349,
      86,    86,    86,   309,   310,   311,   312,    86,     7,     8,
       9,    10,    86,    86,   296,   325,    86,   327,   328,    33,
      80,    86,   332,    64,    86,    34,     6,   322,   323,   324,
       7,     8,     9,    10,     7,     8,     9,    10,   344,    80,
      50,    86,    86,     7,     8,     9,    10,     7,     8,     9,
      10,    86,   342,    33,    34,    86,   351,   341,    86,    86,
      33,   356,   357,    40,    63,    17,    86,    47,    48,    49,
      34,     7,     8,     9,    10,   381,   382,   383,   384,   385,
      60,    80,   377,   378,    86,    86,    86,    40,     3,    86,
       5,     6,    86,    86,   400,   401,    11,    12,    13,    14,
      15,    61,    86,    80,    86,    85,    28,    80,    33,    34,
      86,    59,    27,    16,    86,    86,    80,    86,    33,    34,
      80,    86,    47,    48,    49,    67,    69,    86,     3,    86,
       5,     6,    47,    48,    49,    63,    11,    12,    13,    14,
      15,    86,    86,    58,    80,    60,    18,    62,    80,    64,
      65,    66,    27,    68,    25,   265,   148,   304,    33,    34,
      85,   351,    24,    78,    79,   104,   199,   163,   231,    -1,
      85,    -1,    47,    48,    49,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    58,    -1,    60,    -1,    62,    -1,    64,
      65,    66,    -1,    68,    -1,    -1,     3,    -1,     5,     6,
      -1,    -1,    -1,    78,    11,    12,    13,    14,    15,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      27,     5,     6,    -1,    -1,    -1,    -1,    11,    12,    13,
      14,    15,    -1,    -1,    -1,    -1,     3,    -1,     5,     6,
      -1,    -1,    -1,    27,    11,    12,    13,    14,    15,    -1,
      -1,    58,    -1,    60,    -1,    62,    -1,    64,    65,    66,
      27,    68,    29,    30,    31,    -1,    -1,    -1,    -1,    -1,
      -1,    78,    79,    -1,    58,    -1,    60,    -1,    62,    -1,
      64,    65,    66,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    58,    -1,    -1,    78,    62,    -1,    64,    65,    66,
       3,    68,     5,     6,    -1,    -1,    -1,    10,    11,    12,
      13,    14,    15,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    27,     5,     6,    -1,    31,    -1,
      10,    11,    12,    13,    14,    15,    -1,    -1,    -1,    -1,
       3,    -1,     5,     6,    -1,    -1,    -1,    27,    11,    12,
      13,    14,    15,    -1,    -1,    58,    -1,    -1,    -1,    62,
      -1,    64,    65,    66,    27,    68,    -1,    30,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    58,    -1,
      -1,    -1,    62,    -1,    64,    65,    66,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    58,    -1,    -1,    -1,    62,
      -1,    64,    65,    66,     3,    68,     5,     6,    -1,    -1,
      -1,    -1,    11,    12,    13,    14,    15,    -1,    18,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    27,    -1,
      -1,    -1,    32,    33,    34,    35,    -1,    37,    -1,    39,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    53,    -1,    -1,    56,    -1,    -1,    58,
      60,    -1,    -1,    62,    -1,    64,    65,    66,    -1,    68,
      -1,    -1,    72,    73,    74,    75,    76,    77
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    18,    32,    33,    34,    35,    37,    39,    53,    56,
      60,    72,    73,    74,    75,    76,    77,    88,    89,    91,
      92,    93,    96,   105,   106,   107,   108,   129,   130,   131,
     132,   133,   134,   135,   137,   145,   148,   165,   166,   169,
     173,   176,   177,    86,    86,    86,    86,    86,    86,    86,
      86,    86,    86,    86,    86,    86,    86,    86,    86,     0,
      88,    81,   174,    55,    94,    96,   130,   131,   144,   144,
     108,    52,   142,    94,     6,   101,   110,   101,   110,    90,
      94,    47,    48,    49,    85,    94,   104,   110,   130,   131,
     138,   139,   140,   148,   164,    70,    83,    84,   158,   162,
     163,     5,   111,   110,   110,    17,    57,   167,   168,    94,
      86,     3,    11,    12,    13,    14,    15,    27,    58,    62,
      64,    65,    66,    68,   100,   101,   103,   109,   110,   111,
     112,   113,   115,   124,   146,   150,   152,   153,   154,   156,
     160,   161,    86,    78,    79,    95,   101,   102,   103,   110,
     146,   148,   171,   172,    95,    98,   101,   102,   103,   110,
     171,    94,    51,    94,   143,    86,    86,    26,   117,   117,
     146,   117,   117,    90,    86,    86,    86,    86,    54,   136,
     104,   130,   131,   104,   111,    86,    86,    86,    71,   159,
     159,   159,    86,    61,   149,    19,   116,    86,    86,   110,
      86,    86,    86,    86,    86,    86,    86,    86,    86,    86,
      86,    86,    86,   150,     7,     8,     9,    10,    80,    82,
     175,    16,   114,   148,   150,   150,   150,   150,    10,   103,
     103,   103,   146,   150,   150,   150,   150,    86,    86,   130,
     130,    20,    21,    22,    23,    24,    25,    97,   116,   118,
     119,   120,   121,   122,   123,    31,   103,   128,   103,    99,
     110,    99,   131,   131,   131,    97,    99,    50,   141,    86,
     141,    86,   103,   101,   110,   110,   103,   101,    86,   130,
     131,   149,    86,    86,    86,   130,   131,   168,   103,   103,
     103,   103,   103,   150,    86,    86,   146,   103,   103,   103,
     103,   110,   103,    59,   147,    63,   151,   152,   103,   103,
     103,   103,   103,    86,    86,    86,    86,    86,    86,   103,
      86,    40,   170,   170,   170,   130,    99,   130,   131,    95,
      98,   103,   131,    86,   107,   107,   130,   130,   147,   131,
     131,   103,   103,   151,   103,   110,   149,   151,   151,   151,
      28,   125,   147,    86,   114,    86,   150,   170,   151,   151,
     151,   151,    86,    30,   103,   127,   103,   103,   127,    94,
      94,    94,    94,   130,   131,   151,   147,   150,   150,    86,
      29,   103,   126,   127,   128,   103,   103,    67,   155,    69,
     157,    86,   147,   149,   147,   147,   149,   147,   149,   147,
     103,   103,    86,   151,   151,   151,   151,   151,   147,    86,
      86,   151,   151
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    87,    88,    88,    89,    89,    89,    89,    89,    89,
      89,    89,    89,    89,    89,    89,    89,    89,    90,    90,
      91,    92,    93,    93,    93,    93,    94,    94,    94,    94,
      94,    94,    94,    94,    94,    94,    95,    96,    96,    96,
      96,    97,    97,    97,    97,    97,    97,    97,    98,    98,
      99,    99,   100,   100,   100,   100,   101,   102,   102,   102,
     102,   102,   102,   102,   102,   103,   103,   103,   103,   103,
     103,   103,   103,   103,   103,   103,   103,   103,   103,   103,
     103,   103,   103,   103,   103,   103,   103,   103,   103,   103,
     104,   104,   104,   104,   104,   104,   105,   105,   105,   105,
     105,   105,   105,   105,   106,   106,   107,   108,   108,   109,
     109,   110,   110,   111,   111,   112,   112,   113,   113,   114,
     114,   115,   115,   116,   116,   117,   117,   118,   118,   119,
     119,   120,   120,   121,   121,   122,   122,   123,   123,   124,
     124,   125,   125,   126,   126,   127,   127,   128,   128,   129,
     129,   130,   130,   131,   131,   132,   132,   133,   133,   134,
     134,   135,   135,   136,   136,   137,   137,   138,   138,   139,
     139,   140,   140,   141,   141,   142,   142,   143,   143,   144,
     144,   145,   145,   146,   146,   147,   147,   148,   148,   149,
     149,   150,   150,   151,   151,   152,   152,   153,   153,   154,
     154,   155,   155,   156,   156,   157,   157,   158,   158,   159,
     159,   160,   160,   161,   161,   162,   162,   163,   163,   164,
     164,   165,   165,   166,   166,   167,   167,   168,   168,   169,
     169,   170,   170,   171,   171,   172,   172,   173,   173,   174,
     174,   175,   175,   176,   176,   177,   177
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     5,     5,
       3,     3,     3,     3,     1,     2,     3,     4,     1,     2,
       2,     2,     2,     2,     6,     6,     3,     3,     3,     3,
       3,     1,     5,     5,     5,     5,     3,     5,     5,     5,
       5,     1,     1,     1,     1,     1,     1,     1,     3,     3,
       1,     2,     6,     6,     6,     6,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     1,     1,     1,     4,     3,
       3,     3,     3,     3,     4,     7,     4,     4,     4,     6,
       3,     4,     5,     7,     4,     5,     5,     5,     6,     1,
       1,     1,     1,     3,     3,     1,     2,     2,     4,     1,
       1,     3,     2,     4,     2,     1,     3,     1,     2,     1,
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


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
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

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



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

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
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
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
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
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
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


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
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
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

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

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
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

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

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
| yyreduce -- Do a reduction.  |
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
        case 2:
#line 67 "M.y" /* yacc.c:1646  */
    {
	printf("->PROGRAM\n");
	(yyval.a) = (newast(nt_PROGRAM,NULL,prog_single,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
	root=(yyval.a);
	}
#line 1702 "M.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 73 "M.y" /* yacc.c:1646  */
    {
	printf("->PROGRAM\n");
	(yyval.a) = (newast(nt_PROGRAM,NULL,prog_list,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
	root=(yyval.a);
	}
#line 1712 "M.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 82 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_goal,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1721 "M.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 87 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_given,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1730 "M.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 92 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_qed,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1739 "M.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 97 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_proof,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1748 "M.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 102 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_STATEMENT,NULL,stmt_since_remember_as,(yyvsp[-4].a),label,label->lineNum);
    }
#line 1758 "M.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 108 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT\n");
        struct ast *label = newast(others_remember,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_STATEMENT,NULL,stmt_action_math_equation,(yyvsp[-4].a),label,label->lineNum);
    }
#line 1768 "M.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 114 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_action_conclude,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 1777 "M.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 119 "M.y" /* yacc.c:1646  */
    {
        //使用xxx证明。
        printf("->\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_use_limit_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1787 "M.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 125 "M.y" /* yacc.c:1646  */
    {
        //使用xxx证明。
        printf("->\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_use_continue_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1797 "M.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 131 "M.y" /* yacc.c:1646  */
    {
        //使用xxx证明。
        printf("->\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_use_uc_to_prove,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1807 "M.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 137 "M.y" /* yacc.c:1646  */
    {
        printf("->statement:action_statement\n");
        (yyval.a) = (newast(nt_STATEMENT,NULL,stmt_action,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1816 "M.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 142 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT no remember\n");
        (yyval.a) = newast(nt_STATEMENT,NULL,stmt_since_no_remember,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 1825 "M.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 147 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT no remember\n");
        (yyval.a) = newast(nt_STATEMENT,NULL,stmt_since_no_remember,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 1834 "M.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 152 "M.y" /* yacc.c:1646  */
    {   printf("->STATEMENT no remember\n");
        (yyval.a) = newast(nt_STATEMENT,NULL,point_continue,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum); 

    }
#line 1843 "M.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 160 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_LIST\n");
        (yyval.a) = (newast(nt_MATH_LIST,NULL,math_list_two,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));

    }
#line 1853 "M.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 166 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_LIST\n");
        (yyval.a) = (newast(nt_MATH_LIST,NULL,math_list_n,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));

    }
#line 1863 "M.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 174 "M.y" /* yacc.c:1646  */
    {
        printf("->GIVEN_STATEMENT\n");
        (yyval.a) = (newast(nt_GIVEN_STATEMENT,NULL,given_list,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
        
    }
#line 1873 "M.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 182 "M.y" /* yacc.c:1646  */
    {
        printf("->GOAL_STATEMENT\n");
        (yyval.a) = (newast(nt_GOAL_STATEMENT,NULL,goal_math_equa,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1882 "M.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 189 "M.y" /* yacc.c:1646  */
    {
        //引入变量
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_intros,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 1892 "M.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 195 "M.y" /* yacc.c:1646  */
    {
        printf("->ACTION_statement");
        (yyval.a) = (newast(nt_ACTION_STATEMENT,NULL,action_stmt_suppose,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum)); 
    }
#line 1901 "M.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 200 "M.y" /* yacc.c:1646  */
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr1,(yyvsp[-5].a),to_set,to_set->lineNum);
    }
#line 1911 "M.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 206 "M.y" /* yacc.c:1646  */
    {
        printf("->action_statement");
        struct ast *to_set = newast(others_remember,NULL,0,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = newast(nt_ACTION_STATEMENT,NULL,action_stmt_set_as_math_expr2,(yyvsp[-5].a),to_set,to_set->lineNum);
    }
#line 1921 "M.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 213 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_math1,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1930 "M.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 218 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_math2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1939 "M.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 223 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_continued2,(yyvsp[-2].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 1948 "M.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 228 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_interval1,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1957 "M.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 233 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_interval2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1966 "M.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 238 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_func,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 1975 "M.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 243 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 1984 "M.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 248 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 1993 "M.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 253 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_forall,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2002 "M.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 258 "M.y" /* yacc.c:1646  */
    {
        printf("->MATH_EQUATION\n");
        (yyval.a) = (newast(nt_MATH_EQUATION,NULL,math_equation_exists,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2011 "M.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 265 "M.y" /* yacc.c:1646  */
    {
        printf("->EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_EQUATION,NULL,equation_expr,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2021 "M.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 273 "M.y" /* yacc.c:1646  */
    {
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2031 "M.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 279 "M.y" /* yacc.c:1646  */
    {
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2041 "M.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 285 "M.y" /* yacc.c:1646  */
    {
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2051 "M.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 291 "M.y" /* yacc.c:1646  */
    {
        printf("->FUNC_EQUATION\n");
        
        (yyval.a) = (newast(nt_FUNC_EQUATION,NULL,equation_func_y,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
}
#line 2061 "M.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 300 "M.y" /* yacc.c:1646  */
    {
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_teq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2070 "M.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 305 "M.y" /* yacc.c:1646  */
    {
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tleq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2079 "M.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 310 "M.y" /* yacc.c:1646  */
    {
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tgeq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2088 "M.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 315 "M.y" /* yacc.c:1646  */
    {
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tneq,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2097 "M.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 320 "M.y" /* yacc.c:1646  */
    {
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tequiv,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2106 "M.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 325 "M.y" /* yacc.c:1646  */
    {
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tlt,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2115 "M.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 330 "M.y" /* yacc.c:1646  */
    {
    printf("->TEQ");
    (yyval.a) = (newast(nt_TEQ,NULL,Teq_tgt,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
}
#line 2124 "M.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 337 "M.y" /* yacc.c:1646  */
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_equation,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2134 "M.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 343 "M.y" /* yacc.c:1646  */
    {
        printf("->CONTINUED_EQUATION\n");
        struct ast *exprs = newast(others_exps,NULL,0,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum);
        (yyval.a) = (newast(nt_CONTINUED_EQUATION,NULL,Continued_equation_continued_equation,(yyvsp[-1].a),exprs,exprs->lineNum));
    }
#line 2144 "M.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 351 "M.y" /* yacc.c:1646  */
    {
        printf("->CONTINUED_VAR\n");
        (yyval.a) = (newast(nt_CONTINUED_VAR,NULL,0,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2153 "M.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 356 "M.y" /* yacc.c:1646  */
    {
        printf("->CONTINUED_VAR\n");
        (yyval.a) = (newast(nt_CONTINUED_VAR,NULL,0,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2162 "M.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 362 "M.y" /* yacc.c:1646  */
    {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_infty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2171 "M.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 367 "M.y" /* yacc.c:1646  */
    {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Ninfty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2180 "M.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 372 "M.y" /* yacc.c:1646  */
    {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_Pinfty,(yyvsp[-3].a),NULL,(yyvsp[0].a)->lineNum));
   }
#line 2189 "M.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 377 "M.y" /* yacc.c:1646  */
    {
    printf("->LIM_HEAD\n");
    (yyval.a) = (newast(nt_LIM_HEAD,NULL,Lim_head_lim_to_expr,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2198 "M.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 384 "M.y" /* yacc.c:1646  */
    {  
        printf("->FUNC_HEAD\n");
    (yyval.a) = (newast(nt_FUNC_HEAD,NULL,func_head_binding,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2207 "M.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 390 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2216 "M.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 395 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2225 "M.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 400 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2234 "M.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 405 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2243 "M.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 410 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lopen_rinfty,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2252 "M.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 415 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_lclosed_rinfty,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2261 "M.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 420 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_linfty_ropen,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2270 "M.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 425 "M.y" /* yacc.c:1646  */
    {
    printf("->INTERVAL\n");
    (yyval.a) = (newast(nt_INTERVAL,NULL,Interval_linfty_rclosed,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
   }
#line 2279 "M.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 434 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tvar,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2288 "M.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 439 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tconst,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2297 "M.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 444 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tnum,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2306 "M.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 449 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_1L_minus_1R,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2315 "M.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 454 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_abs,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2324 "M.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 459 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tadd,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2333 "M.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 464 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tminus,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2342 "M.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 469 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tdiv,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2351 "M.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 474 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_ttimes,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2360 "M.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 479 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsqrt_2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2369 "M.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 484 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsqrt_n,(yyvsp[-1].a),(yyvsp[-4].a),(yyvsp[0].a)->lineNum));
    }
#line 2378 "M.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 489 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tln,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2387 "M.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 494 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tsin,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2396 "M.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 499 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tcos,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2405 "M.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 504 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_3L_3R_3L_3R,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2414 "M.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 509 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_1L_1R,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2423 "M.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 514 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR_deri\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_derivative,(yyvsp[-2].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2432 "M.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 519 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR_deri_f\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_derivative_f,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2441 "M.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 524 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tfrac_3L_3R_3L_3R,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2450 "M.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 529 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_lim_head,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    
    }
#line 2460 "M.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 535 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_Lceil_3L_3R_Rceil,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2469 "M.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 540 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_Lfloor_3L_3R_Rfloor,(yyvsp[-2].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2478 "M.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 545 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tpower,(yyvsp[-4].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2487 "M.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 550 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_tmin,(yyvsp[-3].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum));
    }
#line 2496 "M.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 555 "M.y" /* yacc.c:1646  */
    {
        printf("->EXPR\n");
        (yyval.a) = (newast(nt_EXPR,NULL,Expr_func,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2505 "M.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 564 "M.y" /* yacc.c:1646  */
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KASaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2514 "M.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 569 "M.y" /* yacc.c:1646  */
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KSGaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2523 "M.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 574 "M.y" /* yacc.c:1646  */
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_KAGaverage,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2532 "M.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 579 "M.y" /* yacc.c:1646  */
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math1,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2541 "M.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 584 "M.y" /* yacc.c:1646  */
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_Math2,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2550 "M.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 589 "M.y" /* yacc.c:1646  */
    {
        printf("->knowledge\n");
        (yyval.a) = (newast(nt_KNOWLEDGE,NULL,Knowledge_FSqueeze,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2559 "M.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 596 "M.y" /* yacc.c:1646  */
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_knowledge,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2568 "M.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 601 "M.y" /* yacc.c:1646  */
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_math_equation,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2577 "M.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 607 "M.y" /* yacc.c:1646  */
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_tnum,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2586 "M.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 613 "M.y" /* yacc.c:1646  */
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_same,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum)); 
    }
#line 2595 "M.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 618 "M.y" /* yacc.c:1646  */
    {
        printf("->since\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_auto_nohint,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2604 "M.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 623 "M.y" /* yacc.c:1646  */
    {
        printf("->SINCE\n");
        (yyval.a) = (newast(nt_SINCE_CLAUSE,NULL,Since_clause_trans,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2613 "M.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 628 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT Both deri\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum); 
    }
#line 2622 "M.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 633 "M.y" /* yacc.c:1646  */
    {
        printf("->STATEMENT Both deri\n");
        (yyval.a) = newast(nt_SINCE_CLAUSE,NULL,Since_clause_BothDeri_var,(yyvsp[-1].a),NULL,(yyvsp[0].a)->lineNum); 
    }
#line 2631 "M.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 640 "M.y" /* yacc.c:1646  */
    {
        //等式们相加
        printf("->ACTION");
        (yyval.a) = (newast(nt_ACTION,NULL,Action_eqs_equnadd,(yyvsp[0].a),(yyvsp[-1].a),(yyvsp[0].a)->lineNum)); 
    }
#line 2641 "M.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 646 "M.y" /* yacc.c:1646  */
    {
        //“综上”
        printf("->ACTION");
        (yyval.a) = newast(nt_ACTION,NULL,Action_auto_conc,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum);
    }
#line 2651 "M.tab.c" /* yacc.c:1646  */
    break;

  case 106:
#line 655 "M.y" /* yacc.c:1646  */
    {
        printf("->Memory Term");
        (yyval.a) = (newast(nt_MEMORY_TERM,NULL,Memory_term_tnum,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2660 "M.tab.c" /* yacc.c:1646  */
    break;

  case 107:
#line 662 "M.y" /* yacc.c:1646  */
    {
        printf("->Equation list");
        (yyval.a) = (newast(nt_EQS,NULL,Eqs_memory_term,(yyvsp[0].a),NULL,(yyvsp[0].a)->lineNum));
    }
#line 2669 "M.tab.c" /* yacc.c:1646  */
    break;

  case 108:
#line 667 "M.y" /* yacc.c:1646  */
    {
        //at least two.
        printf("->Equation list");
        (yyval.a) = (newast(nt_EQS,NULL,Eqs_memory_term_eqs,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)->lineNum));
    }
#line 2679 "M.tab.c" /* yacc.c:1646  */
    break;

  case 109:
#line 675 "M.y" /* yacc.c:1646  */
    {
        //printf("->TLCONST");
        (yyval.a) = (newast(ntl_TCONST,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2688 "M.tab.c" /* yacc.c:1646  */
    break;

  case 110:
#line 680 "M.y" /* yacc.c:1646  */
    {
        printf("->Line CONST");
        (yyval.a) = (newast(ntl_TCONST,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2697 "M.tab.c" /* yacc.c:1646  */
    break;

  case 111:
#line 687 "M.y" /* yacc.c:1646  */
    {
        //printf("->TLVAR");
        (yyval.a) = (newast(ntl_TVAR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2706 "M.tab.c" /* yacc.c:1646  */
    break;

  case 112:
#line 692 "M.y" /* yacc.c:1646  */
    {
        printf("->Line VAR");
        (yyval.a) = (newast(ntl_TVAR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2715 "M.tab.c" /* yacc.c:1646  */
    break;

  case 113:
#line 699 "M.y" /* yacc.c:1646  */
    {
        //printf("->TLNUM");
        (yyval.a) = (newast(ntl_TNUM,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2724 "M.tab.c" /* yacc.c:1646  */
    break;

  case 114:
#line 704 "M.y" /* yacc.c:1646  */
    {
        printf("->Line NUM");
        (yyval.a) = (newast(ntl_TNUM,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2733 "M.tab.c" /* yacc.c:1646  */
    break;

  case 115:
#line 713 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tsqrt");
        (yyval.a) = (newast(ntl_Tsqrt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2742 "M.tab.c" /* yacc.c:1646  */
    break;

  case 116:
#line 718 "M.y" /* yacc.c:1646  */
    {
        printf("->Line sqrt");
        (yyval.a) = (newast(ntl_Tsqrt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2751 "M.tab.c" /* yacc.c:1646  */
    break;

  case 117:
#line 725 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tln");
        (yyval.a) = (newast(ntl_Tln,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2760 "M.tab.c" /* yacc.c:1646  */
    break;

  case 118:
#line 730 "M.y" /* yacc.c:1646  */
    {
        printf("->Line ln");
        (yyval.a) = (newast(ntl_Tln,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2769 "M.tab.c" /* yacc.c:1646  */
    break;

  case 119:
#line 737 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tderi");
        (yyval.a) = (newast(ntl_Tderi,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2778 "M.tab.c" /* yacc.c:1646  */
    break;

  case 120:
#line 742 "M.y" /* yacc.c:1646  */
    {
        printf("->Line ln");
        (yyval.a) = (newast(ntl_Tderi,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2787 "M.tab.c" /* yacc.c:1646  */
    break;

  case 121:
#line 749 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tfrac");
        (yyval.a) = (newast(ntl_Tfrac,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2796 "M.tab.c" /* yacc.c:1646  */
    break;

  case 122:
#line 754 "M.y" /* yacc.c:1646  */
    {
        printf("->Line frac");
        (yyval.a) = (newast(ntl_Tfrac,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2805 "M.tab.c" /* yacc.c:1646  */
    break;

  case 123:
#line 761 "M.y" /* yacc.c:1646  */
    {
        //printf("->Teq");
        (yyval.a) = (newast(ntl_Teq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2814 "M.tab.c" /* yacc.c:1646  */
    break;

  case 124:
#line 766 "M.y" /* yacc.c:1646  */
    {
        printf("->Line eq");
        (yyval.a) = (newast(ntl_Teq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2823 "M.tab.c" /* yacc.c:1646  */
    break;

  case 125:
#line 773 "M.y" /* yacc.c:1646  */
    {
        //printf("->Deq");
        (yyval.a) = (newast(ntl_Deq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2832 "M.tab.c" /* yacc.c:1646  */
    break;

  case 126:
#line 778 "M.y" /* yacc.c:1646  */
    {
        printf("->Line deq");
        (yyval.a) = (newast(ntl_Deq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2841 "M.tab.c" /* yacc.c:1646  */
    break;

  case 127:
#line 785 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tleq");
        (yyval.a) = (newast(ntl_Tleq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2850 "M.tab.c" /* yacc.c:1646  */
    break;

  case 128:
#line 790 "M.y" /* yacc.c:1646  */
    {
        printf("->Line leq");
        (yyval.a) = (newast(ntl_Tleq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2859 "M.tab.c" /* yacc.c:1646  */
    break;

  case 129:
#line 797 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tgeq");
        (yyval.a) = (newast(ntl_Tgeq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2868 "M.tab.c" /* yacc.c:1646  */
    break;

  case 130:
#line 802 "M.y" /* yacc.c:1646  */
    {
        printf("->Line geq");
        (yyval.a) = (newast(ntl_Tgeq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2877 "M.tab.c" /* yacc.c:1646  */
    break;

  case 131:
#line 809 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tlt");
        (yyval.a) = (newast(ntl_Tlt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2886 "M.tab.c" /* yacc.c:1646  */
    break;

  case 132:
#line 814 "M.y" /* yacc.c:1646  */
    {
        printf("->Line lt");
        (yyval.a) = (newast(ntl_Tlt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2895 "M.tab.c" /* yacc.c:1646  */
    break;

  case 133:
#line 821 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tgt");
        (yyval.a) = (newast(ntl_Tgt,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2904 "M.tab.c" /* yacc.c:1646  */
    break;

  case 134:
#line 826 "M.y" /* yacc.c:1646  */
    {
        printf("->Line gt");
        (yyval.a) = (newast(ntl_Tgt,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2913 "M.tab.c" /* yacc.c:1646  */
    break;

  case 135:
#line 833 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tneq");
        (yyval.a) = (newast(ntl_Tneq,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2922 "M.tab.c" /* yacc.c:1646  */
    break;

  case 136:
#line 838 "M.y" /* yacc.c:1646  */
    {
        printf("->Line neq");
        (yyval.a) = (newast(ntl_Tneq,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2931 "M.tab.c" /* yacc.c:1646  */
    break;

  case 137:
#line 845 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tequiv");
        (yyval.a) = (newast(ntl_Tequiv,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2940 "M.tab.c" /* yacc.c:1646  */
    break;

  case 138:
#line 850 "M.y" /* yacc.c:1646  */
    {
        printf("->Line equiv");
        (yyval.a) = (newast(ntl_Tequiv,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2949 "M.tab.c" /* yacc.c:1646  */
    break;

  case 139:
#line 857 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tlim");
        (yyval.a) = (newast(ntl_Tlim,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2958 "M.tab.c" /* yacc.c:1646  */
    break;

  case 140:
#line 862 "M.y" /* yacc.c:1646  */
    {
        printf("->Line lim");
        (yyval.a) = (newast(ntl_Tlim,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2967 "M.tab.c" /* yacc.c:1646  */
    break;

  case 141:
#line 869 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tto");
        (yyval.a) = (newast(ntl_Tto,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2976 "M.tab.c" /* yacc.c:1646  */
    break;

  case 142:
#line 874 "M.y" /* yacc.c:1646  */
    {
        printf("->Line to");
        (yyval.a) = (newast(ntl_Tto,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 2985 "M.tab.c" /* yacc.c:1646  */
    break;

  case 143:
#line 881 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tinfty");
        (yyval.a) = (newast(ntl_Tinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 2994 "M.tab.c" /* yacc.c:1646  */
    break;

  case 144:
#line 886 "M.y" /* yacc.c:1646  */
    {
        printf("->Line infty");
        (yyval.a) = (newast(ntl_Tinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3003 "M.tab.c" /* yacc.c:1646  */
    break;

  case 145:
#line 893 "M.y" /* yacc.c:1646  */
    {
        //printf("->TPinfty");
        (yyval.a) = (newast(ntl_TPinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3012 "M.tab.c" /* yacc.c:1646  */
    break;

  case 146:
#line 898 "M.y" /* yacc.c:1646  */
    {
        printf("->Line Pinfty");
        (yyval.a) = (newast(ntl_TPinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3021 "M.tab.c" /* yacc.c:1646  */
    break;

  case 147:
#line 905 "M.y" /* yacc.c:1646  */
    {
        //printf("->TNinfty");
        (yyval.a) = (newast(ntl_TNinfty,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3030 "M.tab.c" /* yacc.c:1646  */
    break;

  case 148:
#line 910 "M.y" /* yacc.c:1646  */
    {
        printf("->Line Ninfty");
        (yyval.a) = (newast(ntl_TNinfty,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3039 "M.tab.c" /* yacc.c:1646  */
    break;

  case 149:
#line 917 "M.y" /* yacc.c:1646  */
    {
        //printf("->GOAL");
        (yyval.a) = (newast(ntl_goal,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3048 "M.tab.c" /* yacc.c:1646  */
    break;

  case 150:
#line 922 "M.y" /* yacc.c:1646  */
    {
        printf("->Line GOAL");
        (yyval.a) = (newast(ntl_goal,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3057 "M.tab.c" /* yacc.c:1646  */
    break;

  case 151:
#line 930 "M.y" /* yacc.c:1646  */
    {
        //printf("->MATH1");
        (yyval.a) = (newast(ntl_math1,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3066 "M.tab.c" /* yacc.c:1646  */
    break;

  case 152:
#line 935 "M.y" /* yacc.c:1646  */
    {
        printf("->Line MATH1");
        (yyval.a) = (newast(ntl_math1,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3075 "M.tab.c" /* yacc.c:1646  */
    break;

  case 153:
#line 942 "M.y" /* yacc.c:1646  */
    {
        //printf("->MATH2");
        (yyval.a) = (newast(ntl_math2,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3084 "M.tab.c" /* yacc.c:1646  */
    break;

  case 154:
#line 947 "M.y" /* yacc.c:1646  */
    {
        printf("->Line MATH2");
        (yyval.a) = (newast(ntl_math2,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3093 "M.tab.c" /* yacc.c:1646  */
    break;

  case 155:
#line 954 "M.y" /* yacc.c:1646  */
    {
        //printf("->PROOF");
        (yyval.a) = (newast(ntl_proof,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3102 "M.tab.c" /* yacc.c:1646  */
    break;

  case 156:
#line 959 "M.y" /* yacc.c:1646  */
    {
        printf("->Line PROOF");
        (yyval.a) = (newast(ntl_proof,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3111 "M.tab.c" /* yacc.c:1646  */
    break;

  case 157:
#line 966 "M.y" /* yacc.c:1646  */
    {
        //printf("->QED");
        (yyval.a) = (newast(ntl_qed,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3120 "M.tab.c" /* yacc.c:1646  */
    break;

  case 158:
#line 971 "M.y" /* yacc.c:1646  */
    {
        printf("->Line QED");
        (yyval.a) = (newast(ntl_qed,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3129 "M.tab.c" /* yacc.c:1646  */
    break;

  case 159:
#line 980 "M.y" /* yacc.c:1646  */
    {
        //printf("->GIVEN");
        (yyval.a) = (newast(ntl_given,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3138 "M.tab.c" /* yacc.c:1646  */
    break;

  case 160:
#line 985 "M.y" /* yacc.c:1646  */
    {
        printf("->Line GIVEN");
        (yyval.a) = (newast(ntl_given,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3147 "M.tab.c" /* yacc.c:1646  */
    break;

  case 161:
#line 993 "M.y" /* yacc.c:1646  */
    {
        //printf("->SINCE");
        (yyval.a) = (newast(ntl_since,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3156 "M.tab.c" /* yacc.c:1646  */
    break;

  case 162:
#line 998 "M.y" /* yacc.c:1646  */
    {
        printf("->Line SINCE");
        (yyval.a) = (newast(ntl_since,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3165 "M.tab.c" /* yacc.c:1646  */
    break;

  case 163:
#line 1005 "M.y" /* yacc.c:1646  */
    {
        //printf("->TRANS");
        (yyval.a) = (newast(ntl_trans,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3174 "M.tab.c" /* yacc.c:1646  */
    break;

  case 164:
#line 1010 "M.y" /* yacc.c:1646  */
    {
        printf("->Line TRANS");
        (yyval.a) = (newast(ntl_trans,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3183 "M.tab.c" /* yacc.c:1646  */
    break;

  case 165:
#line 1017 "M.y" /* yacc.c:1646  */
    {
        //printf("->USE");
        (yyval.a) = (newast(ntl_use,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3192 "M.tab.c" /* yacc.c:1646  */
    break;

  case 166:
#line 1022 "M.y" /* yacc.c:1646  */
    {
        printf("->Line USE");
        (yyval.a) = (newast(ntl_use,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3201 "M.tab.c" /* yacc.c:1646  */
    break;

  case 167:
#line 1029 "M.y" /* yacc.c:1646  */
    {
        //printf("->KASaverage");
        (yyval.a) = (newast(ntl_KASaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3210 "M.tab.c" /* yacc.c:1646  */
    break;

  case 168:
#line 1034 "M.y" /* yacc.c:1646  */
    {
        printf("->Line KASaverage");
        (yyval.a) = (newast(ntl_KASaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3219 "M.tab.c" /* yacc.c:1646  */
    break;

  case 169:
#line 1041 "M.y" /* yacc.c:1646  */
    {
        //printf("->KSGaverage");
        (yyval.a) = (newast(ntl_KSGaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3228 "M.tab.c" /* yacc.c:1646  */
    break;

  case 170:
#line 1046 "M.y" /* yacc.c:1646  */
    {
        printf("->Line KSGaverage");
        (yyval.a) = (newast(ntl_KSGaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3237 "M.tab.c" /* yacc.c:1646  */
    break;

  case 171:
#line 1053 "M.y" /* yacc.c:1646  */
    {
        //printf("->KAGaverage");
        (yyval.a) = (newast(ntl_KAGaverage,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3246 "M.tab.c" /* yacc.c:1646  */
    break;

  case 172:
#line 1058 "M.y" /* yacc.c:1646  */
    {
        printf("->Line KAGaverage");
        (yyval.a) = (newast(ntl_KAGaverage,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3255 "M.tab.c" /* yacc.c:1646  */
    break;

  case 173:
#line 1065 "M.y" /* yacc.c:1646  */
    {
        //printf("->REMEMBER");
        (yyval.a) = (newast(ntl_remember,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3264 "M.tab.c" /* yacc.c:1646  */
    break;

  case 174:
#line 1070 "M.y" /* yacc.c:1646  */
    {
        printf("->Line REMEMBER");
        (yyval.a) = (newast(ntl_remember,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3273 "M.tab.c" /* yacc.c:1646  */
    break;

  case 175:
#line 1077 "M.y" /* yacc.c:1646  */
    {
        //printf("->EQUNADD");
        (yyval.a) = (newast(ntl_equnadd,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3282 "M.tab.c" /* yacc.c:1646  */
    break;

  case 176:
#line 1082 "M.y" /* yacc.c:1646  */
    {
        printf("->Line EQUNADD");
        (yyval.a) = (newast(ntl_equnadd,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3291 "M.tab.c" /* yacc.c:1646  */
    break;

  case 177:
#line 1089 "M.y" /* yacc.c:1646  */
    {
        //printf("->CONCLUDE");
        (yyval.a) = (newast(ntl_conclude,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3300 "M.tab.c" /* yacc.c:1646  */
    break;

  case 178:
#line 1094 "M.y" /* yacc.c:1646  */
    {
        printf("->Line EQUNADD");
        (yyval.a) = (newast(ntl_conclude,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3309 "M.tab.c" /* yacc.c:1646  */
    break;

  case 179:
#line 1101 "M.y" /* yacc.c:1646  */
    {
        //printf("->THEN");
        (yyval.a) = (newast(ntl_then,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3318 "M.tab.c" /* yacc.c:1646  */
    break;

  case 180:
#line 1106 "M.y" /* yacc.c:1646  */
    {
        printf("->Line THEN");
        (yyval.a) = (newast(ntl_then,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3327 "M.tab.c" /* yacc.c:1646  */
    break;

  case 181:
#line 1113 "M.y" /* yacc.c:1646  */
    {
        //printf("->SAME");
        (yyval.a) = (newast(ntl_same,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3336 "M.tab.c" /* yacc.c:1646  */
    break;

  case 182:
#line 1118 "M.y" /* yacc.c:1646  */
    {
        printf("->Line SAME");
        (yyval.a) = (newast(ntl_same,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3345 "M.tab.c" /* yacc.c:1646  */
    break;

  case 183:
#line 1125 "M.y" /* yacc.c:1646  */
    {
        //printf("->LB1L");
        (yyval.a) = (newast(ntl_LB1L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3354 "M.tab.c" /* yacc.c:1646  */
    break;

  case 184:
#line 1130 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LB1L");
        (yyval.a) = (newast(ntl_LB1L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3363 "M.tab.c" /* yacc.c:1646  */
    break;

  case 185:
#line 1137 "M.y" /* yacc.c:1646  */
    {
        //printf("->LB1R");
        (yyval.a) = (newast(ntl_LB1R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3372 "M.tab.c" /* yacc.c:1646  */
    break;

  case 186:
#line 1142 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LB1R");
        (yyval.a) = (newast(ntl_LB1R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3381 "M.tab.c" /* yacc.c:1646  */
    break;

  case 187:
#line 1149 "M.y" /* yacc.c:1646  */
    {
        //printf("->LB2L");
        (yyval.a) = (newast(ntl_LB2L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3390 "M.tab.c" /* yacc.c:1646  */
    break;

  case 188:
#line 1154 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LB2L");
        (yyval.a) = (newast(ntl_LB2L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3399 "M.tab.c" /* yacc.c:1646  */
    break;

  case 189:
#line 1161 "M.y" /* yacc.c:1646  */
    {
        //printf("->LB2R");
        (yyval.a) = (newast(ntl_LB2R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3408 "M.tab.c" /* yacc.c:1646  */
    break;

  case 190:
#line 1166 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LB2R");
        (yyval.a) = (newast(ntl_LB2R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3417 "M.tab.c" /* yacc.c:1646  */
    break;

  case 191:
#line 1173 "M.y" /* yacc.c:1646  */
    {
        //printf("->LB3L");
        (yyval.a) = (newast(ntl_LB3L,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3426 "M.tab.c" /* yacc.c:1646  */
    break;

  case 192:
#line 1178 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LB3L");
        (yyval.a) = (newast(ntl_LB3L,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3435 "M.tab.c" /* yacc.c:1646  */
    break;

  case 193:
#line 1185 "M.y" /* yacc.c:1646  */
    {
        //printf("->LB3R");
        (yyval.a) = (newast(ntl_LB3R,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3444 "M.tab.c" /* yacc.c:1646  */
    break;

  case 194:
#line 1190 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LB3R");
        (yyval.a) = (newast(ntl_LB3R,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3453 "M.tab.c" /* yacc.c:1646  */
    break;

  case 195:
#line 1197 "M.y" /* yacc.c:1646  */
    {
        //printf("->ABS");
        (yyval.a) = (newast(ntl_abs,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3462 "M.tab.c" /* yacc.c:1646  */
    break;

  case 196:
#line 1202 "M.y" /* yacc.c:1646  */
    {
        printf("->Line ABS");
        (yyval.a) = (newast(ntl_abs,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3471 "M.tab.c" /* yacc.c:1646  */
    break;

  case 197:
#line 1209 "M.y" /* yacc.c:1646  */
    {
        //printf("->MIN");
        (yyval.a) = (newast(ntl_min,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3480 "M.tab.c" /* yacc.c:1646  */
    break;

  case 198:
#line 1214 "M.y" /* yacc.c:1646  */
    {
        printf("->Line MIN");
        (yyval.a) = (newast(ntl_min,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3489 "M.tab.c" /* yacc.c:1646  */
    break;

  case 199:
#line 1221 "M.y" /* yacc.c:1646  */
    {
        //printf("->LCEIL");
        (yyval.a) = (newast(ntl_LCEIL,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3498 "M.tab.c" /* yacc.c:1646  */
    break;

  case 200:
#line 1226 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LCEIL");
        (yyval.a) = (newast(ntl_LCEIL,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3507 "M.tab.c" /* yacc.c:1646  */
    break;

  case 201:
#line 1233 "M.y" /* yacc.c:1646  */
    {
        //printf("->RCEIL");
        (yyval.a) = (newast(ntl_RCEIL,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3516 "M.tab.c" /* yacc.c:1646  */
    break;

  case 202:
#line 1238 "M.y" /* yacc.c:1646  */
    {
        printf("->Line RCEIL");
        (yyval.a) = (newast(ntl_RCEIL,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3525 "M.tab.c" /* yacc.c:1646  */
    break;

  case 203:
#line 1245 "M.y" /* yacc.c:1646  */
    {
        //printf("->LFLOOR");
        (yyval.a) = (newast(ntl_LFLOOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3534 "M.tab.c" /* yacc.c:1646  */
    break;

  case 204:
#line 1250 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LFLOOR");
        (yyval.a) = (newast(ntl_LFLOOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3543 "M.tab.c" /* yacc.c:1646  */
    break;

  case 205:
#line 1257 "M.y" /* yacc.c:1646  */
    {
        //printf("->RFLOOR");
        (yyval.a) = (newast(ntl_RFLOOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3552 "M.tab.c" /* yacc.c:1646  */
    break;

  case 206:
#line 1262 "M.y" /* yacc.c:1646  */
    {
        printf("->Line RFLOOR");
        (yyval.a) = (newast(ntl_RFLOOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3561 "M.tab.c" /* yacc.c:1646  */
    break;

  case 207:
#line 1269 "M.y" /* yacc.c:1646  */
    {
        //printf("->LIM_DEF");
        (yyval.a) = (newast(ntl_LIM_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3570 "M.tab.c" /* yacc.c:1646  */
    break;

  case 208:
#line 1274 "M.y" /* yacc.c:1646  */
    {
        printf("->Line LIM_DEF");
        (yyval.a) = (newast(ntl_LIM_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3579 "M.tab.c" /* yacc.c:1646  */
    break;

  case 209:
#line 1281 "M.y" /* yacc.c:1646  */
    {
        //printf("->TO_PROVE");
        (yyval.a) = (newast(ntl_TO_PROVE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3588 "M.tab.c" /* yacc.c:1646  */
    break;

  case 210:
#line 1286 "M.y" /* yacc.c:1646  */
    {
        printf("->Line TO_PROVE");
        (yyval.a) = (newast(ntl_TO_PROVE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3597 "M.tab.c" /* yacc.c:1646  */
    break;

  case 211:
#line 1293 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tsin");
        (yyval.a) = (newast(ntl_sin,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3606 "M.tab.c" /* yacc.c:1646  */
    break;

  case 212:
#line 1298 "M.y" /* yacc.c:1646  */
    {
        printf("->Line Tsin");
        (yyval.a) = (newast(ntl_sin,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3615 "M.tab.c" /* yacc.c:1646  */
    break;

  case 213:
#line 1305 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tcos");
        (yyval.a) = (newast(ntl_cos,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3624 "M.tab.c" /* yacc.c:1646  */
    break;

  case 214:
#line 1310 "M.y" /* yacc.c:1646  */
    {
        printf("->Line Tcos");
        (yyval.a) = (newast(ntl_cos,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3633 "M.tab.c" /* yacc.c:1646  */
    break;

  case 215:
#line 1317 "M.y" /* yacc.c:1646  */
    {
        //printf("->CONTINUE_DEF");
        (yyval.a) = (newast(ntl_CONTINUE_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3642 "M.tab.c" /* yacc.c:1646  */
    break;

  case 216:
#line 1322 "M.y" /* yacc.c:1646  */
    {
        printf("->Line CONTINUE_DEF");
        (yyval.a) = (newast(ntl_CONTINUE_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3651 "M.tab.c" /* yacc.c:1646  */
    break;

  case 217:
#line 1329 "M.y" /* yacc.c:1646  */
    {
        //printf("->UC_DEF");
        (yyval.a) = (newast(ntl_UC_DEF,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3660 "M.tab.c" /* yacc.c:1646  */
    break;

  case 218:
#line 1334 "M.y" /* yacc.c:1646  */
    {
        printf("->Line UC_DEF");
        (yyval.a) = (newast(ntl_UC_DEF,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3669 "M.tab.c" /* yacc.c:1646  */
    break;

  case 219:
#line 1341 "M.y" /* yacc.c:1646  */
    {
        //printf("->FSqueeze");
        (yyval.a) = (newast(ntl_FSqueeze,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3678 "M.tab.c" /* yacc.c:1646  */
    break;

  case 220:
#line 1346 "M.y" /* yacc.c:1646  */
    {
        printf("->Line FSqueeze");
        (yyval.a) = (newast(ntl_FSqueeze,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3687 "M.tab.c" /* yacc.c:1646  */
    break;

  case 221:
#line 1352 "M.y" /* yacc.c:1646  */
    {
        //printf("->INTROS");
        (yyval.a) = (newast(ntl_INTROS,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3696 "M.tab.c" /* yacc.c:1646  */
    break;

  case 222:
#line 1357 "M.y" /* yacc.c:1646  */
    {
        printf("->Line INTROS");
        (yyval.a) = (newast(ntl_INTROS,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3705 "M.tab.c" /* yacc.c:1646  */
    break;

  case 223:
#line 1364 "M.y" /* yacc.c:1646  */
    {
        //printf("->SET");
        (yyval.a) = (newast(ntl_SET,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3714 "M.tab.c" /* yacc.c:1646  */
    break;

  case 224:
#line 1369 "M.y" /* yacc.c:1646  */
    {
        printf("->Line SET");
        (yyval.a) = (newast(ntl_SET,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3723 "M.tab.c" /* yacc.c:1646  */
    break;

  case 225:
#line 1376 "M.y" /* yacc.c:1646  */
    {
        //printf("->FOR");
        (yyval.a) = (newast(ntl_FOR,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3732 "M.tab.c" /* yacc.c:1646  */
    break;

  case 226:
#line 1381 "M.y" /* yacc.c:1646  */
    {
        printf("->Line FOR");
        (yyval.a) = (newast(ntl_FOR,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3741 "M.tab.c" /* yacc.c:1646  */
    break;

  case 227:
#line 1388 "M.y" /* yacc.c:1646  */
    {
        //printf("->DERI");
        (yyval.a) = (newast(ntl_DERI,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3750 "M.tab.c" /* yacc.c:1646  */
    break;

  case 228:
#line 1393 "M.y" /* yacc.c:1646  */
    {
        printf("->Line DERI");
        (yyval.a) = (newast(ntl_DERI,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3759 "M.tab.c" /* yacc.c:1646  */
    break;

  case 229:
#line 1400 "M.y" /* yacc.c:1646  */
    {
        //printf("->BOTH");
        (yyval.a) = (newast(ntl_BOTH,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3768 "M.tab.c" /* yacc.c:1646  */
    break;

  case 230:
#line 1405 "M.y" /* yacc.c:1646  */
    {
        printf("->Line BOTH");
        (yyval.a) = (newast(ntl_BOTH,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3777 "M.tab.c" /* yacc.c:1646  */
    break;

  case 231:
#line 1412 "M.y" /* yacc.c:1646  */
    {
        //printf("->COMMA");
        (yyval.a) = (newast(ntl_COMMA,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3786 "M.tab.c" /* yacc.c:1646  */
    break;

  case 232:
#line 1417 "M.y" /* yacc.c:1646  */
    {
        printf("->Line COMMA");
        (yyval.a) = (newast(ntl_COMMA,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3795 "M.tab.c" /* yacc.c:1646  */
    break;

  case 233:
#line 1424 "M.y" /* yacc.c:1646  */
    {
        //printf("->Tforall");
        (yyval.a) = (newast(ntl_Tforall,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3804 "M.tab.c" /* yacc.c:1646  */
    break;

  case 234:
#line 1429 "M.y" /* yacc.c:1646  */
    {
        printf("->Line Tforall");
        (yyval.a) = (newast(ntl_Tforall,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3813 "M.tab.c" /* yacc.c:1646  */
    break;

  case 235:
#line 1436 "M.y" /* yacc.c:1646  */
    {
        //printf("->Texists");
        (yyval.a) = (newast(ntl_Texists,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3822 "M.tab.c" /* yacc.c:1646  */
    break;

  case 236:
#line 1441 "M.y" /* yacc.c:1646  */
    {
        printf("->Line Texists");
        (yyval.a) = (newast(ntl_Texists,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3831 "M.tab.c" /* yacc.c:1646  */
    break;

  case 237:
#line 1448 "M.y" /* yacc.c:1646  */
    {
        //printf("->SUPPOSE");
        (yyval.a) = (newast(ntl_SUPPOSE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3840 "M.tab.c" /* yacc.c:1646  */
    break;

  case 238:
#line 1453 "M.y" /* yacc.c:1646  */
    {
        printf("->Line SUPPOSE");
        (yyval.a) = (newast(ntl_SUPPOSE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3849 "M.tab.c" /* yacc.c:1646  */
    break;

  case 239:
#line 1460 "M.y" /* yacc.c:1646  */
    {
        //printf("->IN");
        (yyval.a) = (newast(ntl_IN,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3858 "M.tab.c" /* yacc.c:1646  */
    break;

  case 240:
#line 1465 "M.y" /* yacc.c:1646  */
    {
        printf("->Line IN");
        (yyval.a) = (newast(ntl_IN,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3867 "M.tab.c" /* yacc.c:1646  */
    break;

  case 241:
#line 1472 "M.y" /* yacc.c:1646  */
    {
        //printf("->CONTINUE");
        (yyval.a) = (newast(ntl_CONTINUE,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3876 "M.tab.c" /* yacc.c:1646  */
    break;

  case 242:
#line 1477 "M.y" /* yacc.c:1646  */
    {
        printf("->Line CONTINUE");
        (yyval.a) = (newast(ntl_CONTINUE,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3885 "M.tab.c" /* yacc.c:1646  */
    break;

  case 243:
#line 1484 "M.y" /* yacc.c:1646  */
    {
        //printf("->AUTO_CONC");
        (yyval.a) = (newast(ntl_AUTO_CONC,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3894 "M.tab.c" /* yacc.c:1646  */
    break;

  case 244:
#line 1489 "M.y" /* yacc.c:1646  */
    {
        printf("->Line AUTO_CONC");
        (yyval.a) = (newast(ntl_AUTO_CONC,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3903 "M.tab.c" /* yacc.c:1646  */
    break;

  case 245:
#line 1496 "M.y" /* yacc.c:1646  */
    {
        //printf("->AUTO_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_NOHINT,NULL,Without_line,(yyvsp[0].a),NULL,NULL));
    }
#line 3912 "M.tab.c" /* yacc.c:1646  */
    break;

  case 246:
#line 1501 "M.y" /* yacc.c:1646  */
    {
        printf("->Line AUTO_NOHINT");
        (yyval.a) = (newast(ntl_AUTO_NOHINT,NULL,Has_line,(yyvsp[-1].a),(yyvsp[0].a),(yyvsp[0].a)));
    }
#line 3921 "M.tab.c" /* yacc.c:1646  */
    break;


#line 3925 "M.tab.c" /* yacc.c:1646  */
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
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
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

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

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

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
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
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
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
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 1512 "M.y" /* yacc.c:1906  */


void yyerror(char* s)
{
    fprintf(stderr , "%s\n",s);
}
