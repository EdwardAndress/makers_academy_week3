class Person #Is able to hire and break bikes within the 'Boris Bikes' domain

	def bike
		@bike
	end

	def bike=(hired_bike)
		@bike = hired_bike
	end

	def hire_bike_from(station)
		self.bike= (station.release(station.working_bikes.first))
	end

	def crash
		self.bike.break
	end
	
end