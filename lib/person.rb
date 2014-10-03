class Person #Is able to hire and break bikes within the 'Boris Bikes' domain

	def initialize
		@bike = nil
	end

	def bike
		@bike
	end

	def bike=(hired_bike)
		@bike = hired_bike
	end

	def hire_bike_from(station)
		self.bike= (station.release_bike_for_hire)
	end

	def return_bike_to(station, bike = self.bike)
		station.dock(bike)
		self.bike=nil
	end

	def crash
		self.bike.break
	end
	
end