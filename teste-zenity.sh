#!/bin/bash
nome=$(zenity --title="Nome?" --text "Qual é o seu nome?" --entry)
zenity --info --title="Boas-vindas" --text=" $nome" --width="100" height="50"
sobrenome=$(zenity --title="Sobrenome" --text "$primeiro Qual é o seu sobrenome?" --entry)
zenity --info --title="Bóson Treinamentos" --text="Bons estudos, $nome $sobrenome"
