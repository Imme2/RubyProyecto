# Autor: Erick Silva
# Carnet: 11-10969


require_relative 'bfs'

class ArbolRosa
	attr_accessor :valor
	attr_reader :hijos

	include BFS

	def initialize(v = nil, *h)
		@valor = v
		@hijos = h
	end

	def each
		@hijos.each do |nodo|
			yield nodo
		end
	end
end


class ArbolBinario
	attr_accessor :valor
	attr_reader :hijoDerecho
	attr_reader :hijoIzquierdo

	include BFS

	def initialize(v = nil, d = nil, i = nil)
		@valor = v
		@hijoDerecho = d
		@hijoIzquierdo = i
	end

	def each
		yield @hijoIzquierdo
		yield @hijoDerecho
	end

end