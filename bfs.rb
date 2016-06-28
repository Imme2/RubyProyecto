module BFS

	def bfs
		arr = []
		
		yield self

		self.each do |nodo|
			arr += [nodo]
		end

		while arr != []
			arr.each do |nodo|
				arr.shift
				unless nodo.nil?
					yield nodo
					nodo.each do |aux|
						arr += [aux]
					end
				end
			end
		end
	end


	# FALTA.
	def require(&pred)
		arr = []


		yield self

		self.each do |nodo|
			arr += [nodo]
		end

		while arr != []
			arr.each do |nodo|
				arr.shift
				unless nodo.nil?
					yield nodo
					nodo.each do |aux|
						arr += [aux]
					end
				end
			end
		end


	end
end