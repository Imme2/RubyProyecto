
# Edicion de las clases Fixnum, String y Array.

# Para cada una de las clases se llama al metodo correspondiente.
#  y asi saber que objeto se va a mutar.

class Fixnum

	def mutar(mutador)
		return mutador.mutarFixnum(self)
	end

end


class String

	def mutar(mutador)
		return mutador.mutarString(self)
	end

end

class Array

	def mutar(mutador)
		return mutador.mutarArray(self)
	end

end

# Clase mutador padre de todos los otros mutadores.

class Mutador


end

# Clase mutador Singular.

class Singular < Mutador

	# Definicion del metodo mutarFixnum para el mutador Singular
	# Se devuelve la multiplicacion del ultimo digito
	#  con la suma del resto de los digitos.
	def self.mutarFixnum(num)
		num = num.round


		ultDig = num % 10

		if num == ultDig
			return num
		end

		suma = 0

		num /= 10

		while num != 0
			aux = num % 10
			num /= 10
			suma += aux
		end

		return suma*ultDig
	end

	# Definicion del metodo mutarString para el mutador Singular
	# Se devuelve el string con las letras que estan en
	#  la palabra "singular" cambiadas a mayuscula
	def self.mutarString(str)

		aux = "singular"

		for i in (0...str.size)
			if aux[str[i]]
				str[i] = str[i].upcase
			end
		end

		return str

	end


	# Definicion del metodo mutarArray para el mutador Singular
	# Se devuelve un string con todos los elementos del array
	#  concatenados con espacios entre ellos.
	def self.mutarArray(arr)

		return arr.flatten.join(' ')

	end

end

# Clase mutador Uniforme.

class Uniforme < Mutador

	# Definicion del metodo mutarFixnum para el mutador Uniforme
	# Se devuelve el promedio de todos los digitos.
	def self.mutarFixnum(num)
		num = num.round

		suma = 0

		cont = 0

		while num != 0
			aux = num%10
			num /= 10
			suma += aux
			cont += 1
		end

		if cont == 0 then
			return 0
		else
			return (suma/cont).round
		end
	end

	# Definicion del metodo mutarString para el mutador Uniforme
	# Se devuelve el string con los caracteres en posicion par en mayusculas
	#  y los caracteres en posicion impar en minusculas.
	def self.mutarString(str)

		for i in (0...str.size)
			if i.even?
				str[i] = str[i].upcase
			else
				str[i] = str[i].downcase
			end
		end

		return str
	end



	# Definicion del metodo mutarArray para el mutador Uniforme
	# Se mutan de manera uniforme todos los elementos del array.
	def self.mutarArray(arr)

		for i in (0...arr.size)
			arr[i] = arr[i].mutar(Uniforme)
		end

		return arr

	end
end


# Clase mutador Oscuro.

class Oscuro < Mutador

	# Definicion del metodo mutarFixnum para el mutador Oscuro
	# Se devuelve un nuevo numero sin los digitos en posicion impar.
	def self.mutarFixnum(num)
		num = num.round

		stringNum = num.to_s

		newNum = 0

		for i in (0...stringNum.size)
			if i.even? then
				newNum *= 10
				newNum += stringNum[i].to_i
			end
		end

		return newNum
	end

	# Definicion del metodo mutarString para el mutador Oscuro
	# Se devuelve un string compuesto de los caracteres en posicion impar
	#  seguidos de los caracteres en posicion par.
	def self.mutarString(str)

		izq = ''
		der = ''


		for i in (0...str.size)
			if i.even? then
				der += str[i]
			else
				izq += str[i]
			end
		end

		newStr = izq + der

		return newStr
	end


	# Definicion del metodo mutarArray para el mutador Oscuro
	# Se escogen al azar 50% (en caso de impar, se redondea hacia abajo)
	#  de los elementos del array y se mutan de manera Oscura.
	def self.mutarArray(arr)

		indices = (0...arr.size).to_a

		escogidos =	indices.sample(arr.size / 2)

		for i in escogidos
			print i
			arr[i] = arr[i].mutar(Oscuro)
		end
		puts ''
		return arr

	end

end