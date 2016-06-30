# Autor: Erick Silva
# Carnet: 11-10969

# requerimientos para los modulos y las mutaciones.
require_relative 'mod_bfs'
require_relative 'mod_fold'
require_relative 'nodos'


#Definicion del arbol Rosa.
class ArbolRosa

	# su valor y sus hijos como atributo solo lectura.
	attr_accessor :valor
	attr_reader :hijos

	include BFS
	include FOLD

	# Metodo de inicializacion.
	def initialize(v, *h)
		@valor = v
		@hijos = h
	end

	# Metodo de mutar que solo llama al mutador en el valor.
	def mutar(mutador)
		@valor = @valor.mutar(mutador)
	end

	# Implementacion de each necesaria para BFS y FOLD.
	def each
		@hijos.each do |nodo|
			yield nodo
		end
	end
end


# Definicion de arbol binario.

class ArbolBinario

	# su valor y sus hijos como atributo solo lectura.
	attr_accessor :valor
	attr_reader :hijoIzquierdo
	attr_reader :hijoDerecho


	include BFS
	include FOLD

	# Metodo de inicializacion.
	def initialize(v, i = nil, d = nil)
		@valor = v
		@hijoIzquierdo = i
		@hijoDerecho = d
	end

	# Metodo de mutar que solo llama al mutador en el valor.
	def mutar(mutador)
		@valor = @valor.mutar(mutador)
	end

	# Implementacion de each necesaria para BFS y FOLD.
	#  Solo retorna nodos no nulos.
	def each
		unless @hijoIzquierdo.nil?
			yield @hijoIzquierdo
		end
		unless @hijoDerecho.nil?
			yield @hijoDerecho
		end
	end

end