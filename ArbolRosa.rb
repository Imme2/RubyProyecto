# Autor: Erick Silva
# Carnet: 11-10969


class ArbolRosa
	attr_accessor :valor
	attr_reader :hijos

	def initialize(v = nil, *h)
		@valor = v
		@hijos = h
	end

	def each
		return @hijos.clone()
	end
end
