require_relative './bike_container'

class DockingStation #Is the point from which people can hire bikes

include BikeContainer


	def release_bike_for_hire
		if self.working_bikes.any?
			bikes.delete(first_available_bike)
		else
			return 'There are currently no available bikes'
		end
	end

	def first_available_bike
		working_bikes.shift
	end

end