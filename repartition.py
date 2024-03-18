import pandas as pd
import random

url = 'c:/Users/HP/Desktop/Contacts.xlsx'

def recuperer_noms(url):
    # Ouvrir un fichier excel afin de recuperer les noms qui sont dans une colonne donnée
    
    df = pd.read_excel(url)
    # print(df)
    # Prendre que la deuxieme colonne
    noms = df["NOM"]
    # print(noms)
    # Transformer la colonne en liste
    liste_noms = noms.tolist()
    return liste_noms

def repartition(liste_noms, n):
    # Repartir les noms en n groupes
    # n : nombre de groupes
    # liste_noms : liste des noms
    
    # Nombre de noms
    nombre_noms = len(liste_noms)
    # Nombre de noms par groupe
    nombre_noms_par_groupe = nombre_noms // n
    # Nombre de noms restants
    reste = nombre_noms % n
    # Liste des groupes
    groupes = []

    for i in range(n):
        groupe = []
        for j in range(4):
            if len(groupe) < nombre_noms_par_groupe:
                nom_add = random.choice(liste_noms)
                groupe.append(nom_add)
                liste_noms.remove(nom_add)
        groupes.append(groupe)
    return groupes, liste_noms

if __name__ == '__main__':
    liste_noms = recuperer_noms(url)
    groupes, reste = repartition(liste_noms, 6)
    
    i = 0
    for groupe in groupes:
        i += 1
        print("\n Groupe ", i)
        for nom in groupe:
            print(nom)
    
    print("\n Reste ")
    for nom in reste:
        print(nom)
