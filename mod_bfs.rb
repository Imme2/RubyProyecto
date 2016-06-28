module bfs

	def bfs

		# Se usa una cola que se inicializa con la raiz
		# e iterar sobre ella
		cola = [self]
		

		# Mientras la cola no este vacia se itera sobre cada
		# nodo que no sea nulo y se encolan sus hijos.
		# Se usa una cola auxiliar para poder encolar mientras
		# se itera sobre la principal.
		while cola != []
			auxCola = []
			cola.each do |nodo|
				unless nodo.nil?
					yield nodo
					nodo.each do |aux|
						auxCola.push(aux)
					end
				end
			end
			cola = auxCola
		end
	end


	# FALTA.
	def recoger(&pred)

		# Se crea un arreglo 
		arr = []

		# Se recorre en bfs el arbol y se agrega al arreglo cada nodo que cumpla
		# con el predicado.
		self.bfs do |nodo|
			if pred.call(nodo)
				arr.push(nodo)
			end
		end

		# Se retorna el arreglo
		return arr

	end
end