class Bike #Bikes are hired from docking stations, potentially broken, distributed by vans and fixed in garages.

	def initialize
		@broken = false
	end

	def broken? #checks whether the bike has been broken
		@broken
	end

	def break #breaks the bike - will be called when the user (a person) crashes
		@broken = true
	end
	
	def fix #called when a broken bike is fixed in a garage
		@broken = false
	end
end