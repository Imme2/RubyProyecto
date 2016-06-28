# Autor: Erick Silva
# Carnet: 11-10969

class ArbolBinario
	attr_accessor :valor
	attr_reader :hijoDerecho
	attr_reader :hijoIzquierdo

	def initialize(v = nil, d = nil, i = nil)
		@valor = v
		@hijoDerecho = d
		@hijoIzquierdo = i
	end

	def each
		yield [@hijoIzquierdo,@hijoDerecho]
	end

end