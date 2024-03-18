import time
import streamlit as st
import random


st.title('Jeu de mime')

mots_pour_mime = ["Roco Sifredi", "hiver", "Felix Houphouet" , "Markov" , "mangrove", "erection", "pyramide"]

def mot_au_hasard(mots):
    return random.choice(mots)


col1 = st.columns(1)

with col1[0]:
    
    # Creer un rectangle pour afficher le mot
    rect = st.empty()
    # Creer un rectangle pour afficher le timer
    timer = st.empty()
    
    # Creer un bouton pour generer un nouveau mot au hasard et lancer le timer
    btn = st.button('Nouveau mot')
    if btn:
        mot = mot_au_hasard(mots_pour_mime)
        rect.markdown(f'<h1 style="text-align: center;color: red;width: 75%;margin: 100px auto;padding: 100px;border: 2px solid red;box-sizing: border-box;">{mot}</h1>', unsafe_allow_html=True)
        # Lancer le timer
        for i in range(15, 0, -1):
            timer.markdown(f'<h1 style="text-align: center; color: red;">{i}</h1>', unsafe_allow_html=True)
            # Ecouler une seconde
            time.sleep(1)
        timer.markdown(f'<h1 style="text-align: center; color: red;">0</h1>', unsafe_allow_html=True)
        st.balloons()
    
    
    st.write('[The Python Guide .com](https://thepythonguide.com)')
    hide_streamlit_style = """
                <style>
                #MainMenu {visibility: hidden;}
                footer {visibility: hidden;}
                </style>
                """
    st.markdown(hide_streamlit_style, unsafe_allow_html=True) 



# Executer un projet Streamlit
# streamlit run jeu_de_mime.py
# ou
# streamlit run jeu_de_mime.py --server.port 8502
