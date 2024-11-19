echo "Ingresa el número de periodo en el que estás inscribiéndote
	1. Febrero, 
	2. Examen Mayo"
read p
echo "Ingresa el número correspondiente a la carrera a la cual estarás inscrito
	1. Ing. Industrial
	2. Ing. TIC's
	3. Ing. Sistemas
	4. Ing. Mecatrónica
	5. Ing. Química
	6. Lic. Administración
	7. Ing. Civil
	8. Ing. Logística"
read c
echo "Ingresa tu número de alumno"
read n

if [ $p -lt 1 ] || [ $p -gt 2 ]
then 
    echo "Ingresa un número de periodo válido"
elif [ $c -lt 1 ] || [ $c -gt 8 ]
then
    echo "Ingresa un número de carrera válido"
elif [ $n -lt 1 ] || [ $n -ge 1000 ]
then
    echo "Ingresa un número de alumno válido"
else 
    if [ $n -le 10 ]
    then
        echo "Tu número de control es: $(date +%Y)$p$c"00"$n"
    elif [ $n -lt 100 ]
    then
        echo "Tu número de control es: $(date +%Y)$p$c"0"$n"
    else
        echo "Tu número de control es: $(date +%Y)$p$c$n"
    fi
fi


