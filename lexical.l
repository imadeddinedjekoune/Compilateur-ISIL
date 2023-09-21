%{
#include "synt.tab.h"
extern nb_ligne = 1;
extern t =0 ;
#include "fonction2.h"

%}
lettres [a-zA-Z]
chiffres [+-]?[0-9]+
entier {chiffres}
reel {entier}("."{entier})?
idf "$"{lettres}({lettres}|{chiffres}|_)*
idf_tab "@"{lettres}({lettres}|{chiffres}|_)*
chaine \"[^"]*\"
comentaire \#\#([^\#]|\#[^\#])*\#\#
comentaire2 "##" .* "##"
comentaire3 \#\#([^\#]|\#[^\#*])*\#+\#
%%
import return mc_import;
ISIL.io return bib_io;
IISIL_lang return bib_lang ;
public return mc_public ;
private return mc_private ;
protected return mc_protected ;
class return mc_class ;

"{" return aco_ov;
"}" return aco_fr;
Entier {  yylval.str=strdup("Entier"); //strcpy(yylval.str,"Entier");
		  return mc_entier;
		  }
Reel {  yylval.str=strdup("Reel");
               return mc_reel;
			   }
Chaine { yylval.str=strdup("Chaine");
          return mc_chaine;
		  }
{idf} {if (yyleng<20) {
                        yylval.str=strdup(yytext);
                        return idf;
						}
         else printf("erreur lexical a la ligne %d: l'idf %s trop long\n",nb_ligne,yytext);
		 }        
"," return vrg;
{chiffres} { yylval.entier=atoi(yytext);
             return cst;}
"[" return cr_ov;
"]" return cr_fm;
{idf_tab}  {yylval.str=strdup(yytext);
            return idf_tab;
			}
"=" return equals;
entier  return (cnst_entier);
{reel}   return (cnst_reel);
{chaine} {
                        yylval.str=strdup(yytext);
                        return cnst_chaine;
						}
CONST {yylval.str=strdup(yytext);
            return mc_const ;
			}
main return mc_main;
"(" return pr_ov ;
")" return pr_fr ;
"+" return plus ;
"-" return minus ;
"*" return multiple;
"/" return division;
">=" return superieurOuEgal;
"<=" return infrieurOuEgal ;
">" return superieur ;
"<" return inferieur ;
for return mc_for ;
"'" return glm ;
"%d" return p_entier ;
"%f" return p_reel ;
"%s" return p_chaine ;
"In" return mc_In ;
Out return mc_Out ;
"##" return dj;
{comentaire}
; return pvg;
[ \t]
[\n] nb_ligne++;
. {t++ ;
printf("erreur lexicale a ligne %d\n %d est %s\n",nb_ligne,t,yytext);}
