#!/bin/bash
forma_uso(){
        echo -e "Uso: $0 -d <dirDatos> [-h]\n
                        -d: Directorio de los datos que quiere procesar.\n
                        -h: muestra este mensaje y termina."
        exit 1
}

if [ $# = 0 ]; then
        forma_uso

fi

while getopts "d:h" opcion;
  do
        case "$opcion" in
                d)
                        dataIn=$OPTARG
                        ;;
                h)
                        forma_uso
                        ;;
                *)
                        echo  "Muestra la forma de uso [-h]"
                        ;;
        esac
  done

if [ ! -e $dataIn ]; then
        echo "Directorio $2 no existe"
        exit
fi

#TRABAJO A REALIZAR
#1) Determinar Cantidad máxima, mínima y promedio para tiempo de simulacion total y memoria utilizad$

timeMemSim(){
executionSummaryFiles=(`find $searchDir -name '*.txt' -print | sort | grep execution | grep -v '._'`)

resultados="metrics.txt"
t1="SimTime.txt"
t2="MemUsed.txt"

rm -f $resultados
rm -f $t1
rm -f $t2

for i in ${executionSummaryFiles[*]};
do
        printf "> %s\n" $i
        timeSimT=$(cat $i | tail -n +2 | awk -F ':' 'BEGIN{sumt1=0}{sumt1=$6+$7+$8} END{print sumt1}')
        echo $timeSimT >> $t1
        memU=$(cat $i | tail -n +2 | cut -d ':' -f 10)
        echo $memU >> $t2

done

t1PMM=$(cat $t1 | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\
                       if($1>max){max=$1};\
                       total+=$1; count+=1;\
                       } \
                       END { print total":"total/count":"min":"max}')

t2PMM=$(cat $t2  | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\
                        if($1>max){max=$1};\
                        total+=$1; count+=1;\
                        } \
                        END { print total":"total/count":"min":"max}')


printf "tsimTotal:promedio:min:max\n" >> resultados
printf "memUsed:promedio:min:max\n" >> resultados
echo $t1PMM >> $resultados
echo $t2PMM >> $resultados

rm -f t1
rm -f t2
rm -f resultados

}

#2)



#3)Determinar el promedio de uso de teléfonos móviles, además del mínimo y el máximo para los instantes de tiempo especificados en los archivos usePhone-NNN.txt


PhonePromMinMax(){

usePhoneFiles=(`find $dataIn -name '*.txt' -print | sort | grep usePhone | grep -v '._'`)
resultados3="usePhone-stats.txt"
t3="fracaso.txt"

for i in ${usePhoneFiles[*]};
        do
                tiempos=(`cat $i | tail -n+3 | cut -d ':' -f 3`)
                for i in ${tiempos[*]};
                do
                        printf "%d:" $i >> $t3
                done
                printf "\n" >> $t3
        done

        totalFields=$(head -1 $t3 | sed 's/.$//' | tr ':' '\n'| wc -l)
        printf "#timestamp:promedio:min:max\n" >> $resultados3
        for i in $(seq 1 $totalFields); do
                out=$(cat $t3 | cut -d ':' -f $i |\
                                awk 'BEGIN{ min=2**63-1; max=0}\
                                {if($1<min){min=$1};if($1>max){max=$1};total+=$1; count+=1;}\
                                END {print total/count":"max":"min}')
                printf "$i:$out\n" >> $resultados3
        done

rm -f $t3
}


  timeMemSim
  PhonePromMinMax
