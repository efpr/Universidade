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

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
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
    ID = 258,
    LINT = 259,
    LFLOAT = 260,
    LSTRING = 261,
    LBOOL = 262,
    INT = 263,
    FLOAT = 264,
    STRING = 265,
    BOOL = 266,
    VOID = 267,
    AND = 268,
    OR = 269,
    NOT = 270,
    EQU = 271,
    DIF = 272,
    LEQU = 273,
    BEQU = 274,
    LESS = 275,
    BIGG = 276,
    ADD = 277,
    SUB = 278,
    MUL = 279,
    DIV = 280,
    MOD = 281,
    POT = 282,
    LPAR = 283,
    RPAR = 284,
    LRPAR = 285,
    RRPAR = 286,
    LCBRACE = 287,
    RCBRACE = 288,
    ASP = 289,
    SEMI = 290,
    DOT = 291,
    DPOINT = 292,
    COMMA = 293,
    ASSIGN = 294,
    DEFINE = 295,
    IF = 296,
    THEN = 297,
    ELSE = 298,
    WHILE = 299,
    DO = 300,
    RETURN = 301,
    BREAK = 302,
    NEXT = 303,
    PRINT = 304,
    INPUT = 305
  };
#endif
/* Tokens.  */
#define ID 258
#define LINT 259
#define LFLOAT 260
#define LSTRING 261
#define LBOOL 262
#define INT 263
#define FLOAT 264
#define STRING 265
#define BOOL 266
#define VOID 267
#define AND 268
#define OR 269
#define NOT 270
#define EQU 271
#define DIF 272
#define LEQU 273
#define BEQU 274
#define LESS 275
#define BIGG 276
#define ADD 277
#define SUB 278
#define MUL 279
#define DIV 280
#define MOD 281
#define POT 282
#define LPAR 283
#define RPAR 284
#define LRPAR 285
#define RRPAR 286
#define LCBRACE 287
#define RCBRACE 288
#define ASP 289
#define SEMI 290
#define DOT 291
#define DPOINT 292
#define COMMA 293
#define ASSIGN 294
#define DEFINE 295
#define IF 296
#define THEN 297
#define ELSE 298
#define WHILE 299
#define DO 300
#define RETURN 301
#define BREAK 302
#define NEXT 303
#define PRINT 304
#define INPUT 305

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "ya.y" /* yacc.c:1909  */

	char *id;
	int ival;
	float fval;
	int bval;
	char *sval;

	t_decl      decl;
	t_decls     decls;
	t_ids       ids;
	t_type      type;
	t_argdefs   argdefs;
	t_argdef    argdef;
	t_literais  literais;
	t_stmts     stmts;
	t_stmt      stmt;
	t_exp       exp;

#line 173 "parser.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_H_INCLUDED  */
