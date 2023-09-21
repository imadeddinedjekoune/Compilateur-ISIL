%{
int t ;
int sauvVAleur;
int nb_ligne;
int erreur=1;
int i ;
char sauvType[20];
int io=0;
int lang=0;
char* sauvForm;
int contIdf =0 ;
char sauvTYPEIdf[20] ;
int k = 0;
char charr[50];
char* type[1]; 
%}

%union {
int  entier;
char* str;
}

%left plus
%left division
%left minus 
%left multiple

%token mc_import pvg bib_io bib_lang mc_class mc_public mc_private mc_protected <str>idf aco_ov aco_fr <str>mc_entier <str>mc_reel <str>mc_chaine
vrg <entier>cst <str>idf_tab cr_ov cr_fm mc_const cnst_entier cnst_reel cnst_chaine equals plus minus multiple division mc_main pr_fr pr_ov
inferieur superieur infrieurOuEgal superieurOuEgal mc_for glm p_entier p_reel p_chaine mc_In mc_Out comentaire dj
%% 


S:  LISTE_BIB HEADER_CLASS aco_ov CORPS aco_fr   {
			if (t==0 )printf("pgm syntaxiquement correcte"); 
			else {
			printf("pgm  incorrecte"); 
               YYACCEPT;   }     }
;

HEADER_CLASS : MODIFICATEUR mc_class idf 
; 
CORPS:LISTE_DEC
;
LISTE_DEC: DEC LISTE_DEC
          |
;
DEC: DEC_VAR
    |DEC_TAB
    |DEC_CONST
    |MAIN
    
;
MAIN :mc_main pr_ov pr_fr aco_ov LISTE_INST aco_fr
;

LISTE_INST: INSTRUCTION LISTE_INST
            |
;                        
INSTRUCTION : AFFICTATION 
			| BOUCLE 
			| LECTURE 
			| ECRITURE

			
;
ECRITURE : mc_Out pr_ov  cnst_chaine  vrg LISTE_Idfs pr_fr pvg {if(io==0) printf("bibliotheque 'ISIL.io' n'etait pas importée\n ");
                                                                else{ 
                                                                 if(k!=0){
                                                                 if(strlen(verifierchaine($3))!=k){
                                                                 printf("erreur semantique :Sortie ne respect pas la format a la ligne %d \n  ",nb_ligne );}
                                                                 
                                                                 else{
                                                                 if(strcmp(verifierchaine($3),sauvTYPEIdf)!=0){
                                                                 printf("erreur semantique :Sortie type des signes de formatage incompatible a la ligne %d \n  ",nb_ligne );
                                                                 }
                                                                 }
                                                                 k=0;
                                                                 }}}


;
LECTURE : mc_In pr_ov cnst_chaine vrg LISTE_Idfs pr_fr pvg {if(io==0) printf("bibliotheque 'ISIL.io' n'etait pas importée\n ");
                                                                else{ 
                                                                  if(k!=0){
                                                                 if(strlen(verifierchaine($3))!=k)
                                                                 printf("erreur semantique :entree ne respect pas la format a la ligne %d \n  ",nb_ligne );
                                                                 
                                                                 else{
                                                                 if(strcmp(verifierchaine($3),sauvTYPEIdf)!=0){
                                                                 printf("erreur semantique :entree type des signes de formatage incompatible a la ligne %d \n  ",nb_ligne );
                                                                 }
                                                                 }
                                                                 k=0;
                                                                 }}}

;
LISTE_Idfs : idf vrg LISTE_Idfs { if(!recherche($1)){printf("erreur semantique : idf no declared a la ligne %d \n ",nb_ligne);
									}else {sauvTYPEIdf[k]=gettype($1);

                                  k++;}
													}
			|idf   { if(!recherche($1)){printf("erreur semantique : idf no declared a la ligne %d \n ",nb_ligne);
									}else {sauvTYPEIdf[k]=gettype($1);

                                  k++;}
													}

BOUCLE : mc_for pr_ov idf equals cst  pvg idf EXP_COMPA cst pvg INC pr_fr aco_ov LISTE_INST aco_fr 
;
EXP_COMPA : inferieur
			|superieur
			|infrieurOuEgal
			|superieurOuEgal
;
INC	: idf plus plus 
	|idf minus minus
;
AFFICTATION : idf equals VALUES pvg { if(lang==0) printf("bibliotheque 'ISIL.lang' n'etait pas importée\n ");
                                                                else{ if(doubleDeclaration($1)==0)
		                           printf("erreur semantique %s non delcalrarer a la ligne %d\n",$1,nb_ligne);
		                           else {
		                           		if(isConstante($1)==0 )printf("erreur semantique %s Modification d’une valeur d’une constante a la ligne %d\n",$1,nb_ligne);
		                           		else{ 
 											if(gettype($1)!=type[0]){
 											printf("erreur semantique : Non compatibilité de type a la ligne %d\n",nb_ligne);

 											      }


		                           		    }type[0]='\0';




		                           }
								   }}
			| idf equals LIST_IDF pvg { if(lang==0) printf("bibliotheque 'ISIL.lang' n'etait pas importée\n ");
                                                                else{if(doubleDeclaration($1)==0)
		                           printf("erreur semantique %s non delcalrarer a la ligne %d\n",$1,nb_ligne);
		                           else {
		                           		if(isConstante($1)==0 )printf("erreur semantique :  %s Modification d’une valeur d’une constante a la ligne %d\n",$1,nb_ligne);
		                           		else {sauvTYPEIdf[0] = gettype($1) ;
		                           		      sauvTYPEIdf[1] = '\0' ;
		                           		if( sauvTYPEIdf[0] != type[0] && type[0]!='\0'){
		                           		        
		                           		           
 											printf("erreur semantique Non compatibilité de type a la ligne %d\n",nb_ligne);}
 										else {
 											
 											compaType($1);

 											}


		                           		}




		                           }freet();
		                            
		                           type[0]='\0';
		                           sauvTYPEIdf[0]='\0';
								   }}
			| idf_tab cr_ov cst cr_fm equals  VALUES pvg {
			if(lang==0) printf("bibliotheque 'ISIL.lang' n'etait pas importée\n ");
                                                                else{
			if(rechercheTab($1)!=0){ 
		                           printf("erreur semantique %s non delcalrarer a la ligne %d\n",$1,nb_ligne);}
            else {if(!verifierIndex($1 ,$3)){
            printf("erreur semantique a la ligne %d :value out of range\n",nb_ligne);
            }
			}
			}}
;
LIST_IDF : idf IDFS { 
					fillType($1);
					
								   } 
          |
;


IDFS  :    plus VAL {     }
		| minus VAL 
		| multiple VAL 
		| division VAL {  type[0]='R'; type[1]='\0';
		                 
						if (sauvVAleur==0)
		                printf("erreur devision par 0 ");}
		|

;
VAL :    VALUES  
       | idf IDFS  { fillType($1);
								 }
;
DEC_CONST:mc_const TYPE idf  equals VALUES pvg { if(!recherche($3)){inserer($3,"idf",1);insererTYPE($3,sauvType);insererNature($3,$1) ;}
								else{
	                                  if(doubleDeclaration($3)==0){
                                     insererTYPE($3,sauvType);
                                     insererNature($1,"CONST");}
							    		else
								printf("err semantique: double declaration  de %s a la ligne %d\n",$3,nb_ligne);
								}}
		|mc_const TYPE idf pvg{ if(!recherche($3)){inserer($3,"idf",0);insererTYPE($3,sauvType);insererNature($3,$1) ;}
								else{
	                                  if(doubleDeclaration($3)==0){
                                     insererTYPE($3,sauvType);
                                     insererNature($1,"CONST");}
							    		else
								printf("err semantique: double declaration  de %s a la ligne %d\n",$3,nb_ligne);
								}}
;

VALUES : cst{    sauvVAleur=$1; type[0]='E'; type[1]='\0';} 
		|cnst_reel {    sauvVAleur=$1;type[0]='R'; type[1]='\0';  } 
		|cnst_chaine { type[0]='C'; type[1]='\0';}

;
DEC_VAR: TYPE LISTE_IDF pvg 
;


	

LISTE_IDF: idf vrg LISTE_IDF { if(!recherche($1)){inserer($1,"idf",0);insererTYPE($1,sauvType);insererNature($1,"VARIABLE"); }
								else{
	                                  if(doubleDeclaration($1)==0){
                                     insererTYPE($1,sauvType);
                                     insererNature($1,"VARIABLE");}
							    		else
								printf("err semantique: double declaration  de %s a la ligne %d\n",$1,nb_ligne);
								}}
          |idf  { if(!recherche($1)){inserer($1,"idf",0);insererTYPE($1,sauvType);insererNature($1,"VARIABLE"); }
								else{
	                                  if(doubleDeclaration($1)==0){
                                     insererTYPE($1,sauvType);
                                     insererNature($1,"VARIABLE");}
							    		else
								printf("err semantique: double declaration  de %s a la ligne %d\n",$1,nb_ligne);
								}}
;	



TYPE:mc_entier {strcpy(sauvType,$1);} //sauvType=strdup($1);
    |mc_reel   {strcpy(sauvType,$1);}
	|mc_chaine {strcpy(sauvType,$1);}
;	
	
DEC_TAB:  TYPE LISTE_IDF_TAB pvg
;
LISTE_IDF_TAB: idf_tab cr_ov cst cr_fm vrg LISTE_IDF_TAB { if($3<=0) printf("erreur semantique: un tableau ne pas pas etre de taille 																	negative ou nulle a la ligne  %d\n", nb_ligne);
                                                         else{ 
														if(!recherche($1)){inserer($1,"idf",cst);insererTYPE($1,sauvType);insererNature($1,"Tableau"); }
															else{
								                                  if(doubleDeclaration($1)==0){
							                                     insererTYPE($1,sauvType);
							                                     insererNature($1,"Tableau");}
														    		else
															printf("err semantique: double declaration  de %s a la ligne %d\n",$1,nb_ligne);
															}}}

              |idf_tab cr_ov cst cr_fm  {if($3<=0) printf("erreur semantique: un tableau ne pas pas etre de taille negative ou nulle a la ligne  %d\n", nb_ligne);
															else{ if(!recherche($1)){inserer($1,"idf",cst);insererTYPE($1,sauvType);insererNature($1,"Tableau"); }
															else{
								                                  if(doubleDeclaration($1)==0){
							                                     insererTYPE($1,sauvType);
							                                     insererNature($1,"Tableau");}
														    		else
															printf("err semantique: double declaration  de %s a la ligne %d\n",$1,nb_ligne);
															}
															}}
;
MODIFICATEUR: mc_public
             |mc_private
			 |mc_protected
			 |
			 ;
LISTE_BIB: BIB LISTE_BIB
          |
;		  
BIB: mc_import NOM_BIB pvg
;
NOM_BIB:bib_io {io = 1 ; }
         |bib_lang {lang = 1 ; }
;
%%
main()
{yyparse();
 afficher();
 }
yywrap() {}
yyerror(char*msg)
{ t=1;
printf("erreur syntaxique a la ligne %d\n",nb_ligne);
}
