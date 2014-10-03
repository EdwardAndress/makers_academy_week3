require_relative './bike_container'

class DockingStation #Is the point from which people can hire bikes

include BikeContainer #defines functionality that is shared between all objects that can contain bikes (van, docking station, garage)


	def release_bike_for_hire
		self.working_bikes.any? ? bikes.delete(first_available_bike) : 'There are currently no available bikes'
	end

	def first_available_bike
		working_bikes.shift
	end

end