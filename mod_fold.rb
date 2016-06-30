module FOLD

	# metodo iterador de dfs, itera sobre el arbol en forma de dfs

	def dfs
		
		# Se envia a si mismo

		yield self

		# luego para cada uno de sus nodos, se envian sus dfs

		self.each do |nodo|
			nodo.dfs do |hijo|
				yield hijo
			end
		end

		self

	end



	# metodo de fold, aplica una funcion a todo el arbol y devuelve el resultado con un acumulador.

	def fold(base)

		# Se inicia el acumulador en la base
		acum = base

		# Se recorre en dfs el arbol y se va acumulando cada objeto.
		self.dfs do |nodo|
			acum = yield nodo,acum
		end

		# Se retorna el acumulador
		return acum

	end
end
