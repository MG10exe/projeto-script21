#!/bin/bash

KEY=12345

function ordenarProcessos(){
	for i in $a
	do
		echo "$i" >> task2
    	done
}


while true
do
    	ps -aux | awk '{print $1" "$2" "$3" "$4" "$11}' | sort -n -k3 -r > task
	a=$(cat task)

    	ordenarProcessos
    	cat task2
    	rm task2

    	sleep 10
    	echo -e '\f'
done \
| yad --list \
      --tabnum=1 \
      --cycle-read \
      --plug=$KEY \
      --column=$"USUARIO" \
      --column=$"PID" \
      --column=$"CPU%" \
      --column=$"MEMÓRIA%" \
      --column=$"PROCESSOS"  &
    
yad --notebook \
    --center \
    --title="Gerenciador de Processos" \
    --tab=$"Informações dos Processos" \
    --button="Matar Processo":1 \
    --button="Iniciar Processo" \
    --button="Gráficos" \
    --button="Sair":"0" \
    --key=$KEY \
    --width=900 --height=600

case $? in
	1) KILL=$( yad --title="Matar processo" --center --form --field="PID: " --button="OK:0")
		kill ${KILL:0:-1} ;;
esac
