# Mini-Compilateur
langage appelé «ISIL»
Le but de ce projet est de réaliser un mini-compilateur en effectuant les différentes phases de la compilation à savoir l'analyse lexicale en utilisant l'outil FLEX et l'analyse syntaxique sémantique en utilisant l'outil BISON.
### I.	Description du Langage ISIL
    1 La structure générale 
        Importer des bibliothèques

        Modificateur  class $NomDeClasse
        {  ## ceci est un commentaire
             Sur plusieurs lignes##

                       Partie déclarations

        main()
        {
        Partie instructions
        }

        }
      L’importation des bibliothèques en langage ISIL se fait selon la syntaxe suivante : 
                     Import    NomBibiliothèque ;
       Les deux bibliothèques autorisées dans ISIL sont : ISIL.lang et ISIL.io

      Nom	Usage
      ISIL.io	Pour les instructions IN et OUT
      ISIL.lang	Pour les affectations et les expression arithmétiques
      
### II.2 Déclaration d’une classe
      Le langage peut contenir plusieurs classes, qu’on doit définir par le prototype : 
                 Modificateur class $NomDeClasse 
      Tel que 
      -	Un modificateur peut exister ou non. S’il existe il prend une de ces  valeurs:      public, private ou protected.

      -	Le nom de la classe est un identificateur. 

      -	Un identificateur, est une suite de caractères, qui commence par lettre, et qui peut contenir ensuite, des lettres, des chiffres et des ‘_’. A condition qu’il n’y aura pas de deux ’_’ successifs. La taille d’un identificateur ne doit pas dépasser 25 caractères.

      II.2 La partie déclarations 

      Nous pouvons déclarer dans ce langage des variables (simples ou tableaux) et des constantes.
          Déclaration de variables 

      -	Variable simple :    Type  $NomVariable ;
      -	Tableau        :Type @NomVariable [taille];

      NomVariable est un identificateur  
      taille est un chiffre strictement positif



