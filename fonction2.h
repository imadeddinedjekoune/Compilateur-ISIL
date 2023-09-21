#include <stdio.h>
#include<string.h>
#include<stdlib.h>

typedef struct node1 // Pour TS
{    
    char name[20];// IDF de la variable ou constante
    char type[20];// INTEGER REAL CHAR 
    char nature[10];// CONST ou VAR ou tableau
    int length;// 0 si il s'agit d'une constante ou variable simple sinon la taille du tableau
    char val[256];// La valeur de la variable ou constante
    struct node1* next;
} list1;

list1 * TS = NULL; //Variables et constantes

list1 * l1;
list1 * l2;
char type1[20];

int recherche(char entite[]) {
    if (TS==NULL)return 0;
    l1 = (list1 * ) TS;
    while (l1 != NULL && (strcmp(entite, l1 -> name)))
           l1 = l1 -> next;
    
    return (int) l1;
}

void inserer(char entite[20], char type[20],int length) {
   
        l2 = (list1 * ) malloc(sizeof(list1));
        strcpy(l2 -> name, entite);
        strcpy(l2 -> type, "");
        l2 ->length = length; 
        l2 -> next = TS;
        TS = l2;
        
        
       
}

void afficher() {

    printf("\nTable des symboles IDF\n");
    printf("------------------------------------------------------------------------\n");
    printf("| Nom_Entite    | Type_Entite   | Nature_Entite  |\n");
    printf("------------------------------------------------------------------------\n");
    l1 = TS;
    while (l1 != NULL) {
        printf("|%15s|%15s|%15s|\n", l1 -> name, l1 -> type, l1 -> nature);
        l1 = l1 -> next;
    }
   
   
}

int doubleDeclaration(char entite[]) {
    l1 = (list1 * ) recherche(entite);
    return (int) strcmp(l1 -> type, "");
}

 void insererTYPE(char entite[], char type[])
	{
        l1 = (list1 * ) recherche(entite);
	if(l1!=NULL)
	   strcpy(l1 -> type,type); 
	
	}
void insererNature(char entite[], char nature[])
	{
        l1 = (list1 * ) recherche(entite);
	if(l1!=NULL)
	   strcpy(l1 -> nature,nature); 
	
	}
int rechercheTab(char entite[]){
	l1 = (list1 * ) recherche(entite);
	if(l1!=NULL)return (int) strcmp(l1 -> nature,"Tableau");
	return -1 ;
	
}
int verifierIndex(char entite[] ,int index){
		l1 = (list1 * ) recherche(entite);
	if (index > l1 ->length ||index < 0)return 0 ;
	}
int isConstante(char entite[]){
	l1 = (list1 * ) recherche(entite);
	if (strcmp(l1 -> nature,"CONST")==0&& l1 -> length ==1 ) return 0 ;	
	if (strcmp(l1 -> nature,"CONST")==0) { l1 -> length = 1;
	}
   return -1;	
}	
void insererval(char entite[],char val[]){
	
	l1 = (list1 * ) recherche(entite);
	if(l1!=NULL) strcpy(l1->val,val);	
}
char  *verifierchaine(char entite[]){
	
	int taille =strlen(entite);
    char tab[200];	
	int i;
	int j=0;
	for(i=0;i<taille;i++){
			
									if(entite[i]=='%'){
														 if(entite[i+1]=='d'){
															 tab[j]='E';
															 j++;
														 }else{
															 if(entite[i+1]=='s'){
																 tab[j]='C';
																 j++;
															 }else{ if(entite[i+1]=='f'){
																 tab[j]='R';
																 j++;
															 }
															 }
														 }
			
										        	}
		
							}
	tab[j]='\0'	;					
	//printf("table de type %s\n",tab);	
	return tab ;
		
	}

char * gettype(char entite[]){
	char ch[2];
	l1 = (list1 * ) recherche(entite);
    if(l1!=NULL) 
    
    ch[0]=l1->type[0];
    ch[1]='\0';
	return *ch;
	
}
int taille (char entite[])
{
	return strlen(entite);
}

void fillType(char entite[]){
	
	if(doubleDeclaration(entite)==0)
		                           printf("erreur semantique %s non delcalrarer a la ligne %d\n",entite,nb_ligne);
	else {
		type1[strlen(type1)]=gettype(entite);
	
	}
	
}

void freet(){
	type1[0]='\0';
}

void compaType(char entite[]){
 if(doubleDeclaration(entite)==0)
		                           printf("erreur semantique %s non delcalrarer a la ligne %d\n",entite,nb_ligne);
	else {
			int i ;
			char x[1];
			x[0]=gettype(entite);
			
		   if (x[0]=='R')	 {
		    
		        for(i=0;i<strlen(type1);i++){
		        	if (type1[i]=='C')printf("erreur semantique Non compatibilité de type a la ligne %d\n",nb_ligne);
		        	
		        	
				}}
		    if (x[0]=='E')    
		   {
		   
		    	 for(i=0;i<strlen(type1);i++){
		        	if (type1[i]!='E')printf("erreur semantique Non compatibilité de type a la ligne %d\n",nb_ligne);
		        	
		        	
				}}
		       
		     if (x[0]=='C')    
		    {
			
		        for(i=0;i<strlen(type1);i++){
		        	if (type1[i]!='C')printf("erreur semantique Non compatibilité de type a la ligne %d\n",nb_ligne);
		        	
		    }
			}		
}
	
}










