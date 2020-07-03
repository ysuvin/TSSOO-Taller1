# Taller 01 - Taller de Sistemas Operativos
- Yian Vera Soto - yian.vera@alumnos.uv.cl


## Diseño de la Solucion
Este Taller trabajara sobre una coleccion de datos sobre mediciones hechas en un simulacro de una ciudad costera.
### Problema 1

  Este problema pide determinar cantidad máxima, mínima y promedio para tiempo de simulacion total y memoria utilizada.
  La funcion llamada ```timeMemSim()``` procesara y  contendra toda la codificacion para realizar el problema 1.
  Se crean 4 variables:
  - ```executionSummaryFiles=(`find $searchDir -name '*.txt' -print | sort | grep execution | grep -v '._'`)```: Esta variable contendra los datos de la simulacion
  - ```t1="SimTime.txt"```: Contendra los datos sobre tiempos de simulacion.
  - ```t2="MemUsed.txt"```: Contendra los datos de memoria utilizada.
  - ```resultados="metrics.txt"```: Contendra los datos ya procesados.
  
Estas variables seran asiganadas a archivos temporales (t1 y t2) la variable resultado es para el archivo final que seran necesarios para realizar el procesamiento de los datos. Con un for recorreremos los archivos con los datos y obtendremos los necesarios y los guardaremos en las variables de los archivos temporales.
Teniendo los datos en los archivos temporales los procesaremos para obtener el promedio, minimo y maximo. Y la funcion finaliza reflejando estos datos en el archivo resultados que corresponde al archivo solicitado ```"metrics.txt"```
### Problema 2
Determinar el tiempo promedio de evacuación, además del mínimo y el máximo para los siguientes grupos de personas.

### Problema 3
Determinar el promedio de uso de teléfonos móviles, además del mínimo y el
máximo para los instantes de tiempo especificados en los archivos usePhone-NNN.txt.
La funcion ```PhonePromMinMax()``` se encargara de procesar los datos sobre el uso de los telefonos durante el simulacro, necesitaremos 3 variables:
- ```usePhoneFiles=(`find $searchDir -name '*.txt' -print | sort | grep usePhone | grep -v '._'`)```: Contendra los datos del simulacro sobre el uso del telefono
- ```t15="fracaso.txt"```: Los datos ya filtrados de
- ```resultados3="usePhone-stats.txt"```: Resultados finales con los datos ya procesados.

Con un for sobre la variable ```usePhoneFiles``` lograremos representar el numero de personas que utilizan telefonos el instante i-esimo durante el simulacro y estos datos los procesaremos con el codigo que utilizamos en los otros problemas para calcular el promedio, minimo y maximo.
