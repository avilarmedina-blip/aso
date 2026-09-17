num=$1

if [ $((num % 2)) == 0 ]
then
	echo El número es par
else
	echo El número es impar
fi
