
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     plus = 258,
     division = 259,
     minus = 260,
     multiple = 261,
     mc_import = 262,
     pvg = 263,
     bib_io = 264,
     bib_lang = 265,
     mc_class = 266,
     mc_public = 267,
     mc_private = 268,
     mc_protected = 269,
     idf = 270,
     aco_ov = 271,
     aco_fr = 272,
     mc_entier = 273,
     mc_reel = 274,
     mc_chaine = 275,
     vrg = 276,
     cst = 277,
     idf_tab = 278,
     cr_ov = 279,
     cr_fm = 280,
     mc_const = 281,
     cnst_entier = 282,
     cnst_reel = 283,
     cnst_chaine = 284,
     equals = 285,
     mc_main = 286,
     pr_fr = 287,
     pr_ov = 288,
     inferieur = 289,
     superieur = 290,
     infrieurOuEgal = 291,
     superieurOuEgal = 292,
     mc_for = 293,
     glm = 294,
     p_entier = 295,
     p_reel = 296,
     p_chaine = 297,
     mc_In = 298,
     mc_Out = 299,
     comentaire = 300,
     dj = 301
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 18 "synt.y"

int  entier;
char* str;



/* Line 1676 of yacc.c  */
#line 105 "synt.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


