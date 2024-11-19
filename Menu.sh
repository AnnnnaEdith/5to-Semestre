while true
do
echo "1. suma de 2 numeros"
echo "2. X tabla de multiplicar"
echo "3. Factorial x numero"
echo "4. z²=x²+y²"
echo "5. tablas de multiplcar"
echo "6. Numero de control"
echo "7. Par e impar"
echo "8. Edad"
echo "9. Salir"
echo "Selecciona una opcion"
read x
case $x in
1)
./programa1.sh
;;
2)
./programa2.sh
;;
3)
./factorial.sh
;;
4)
./funcion.sh
;;
5)
./whileAni.sh
;;
6)
./control1.sh
;;
7)
./maMe.sh
;;
8)
./ifAnidado.sh
;;
9)
exit
;;
esac
done
