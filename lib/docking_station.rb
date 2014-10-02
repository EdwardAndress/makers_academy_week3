require_relative './bike_container'

class DockingStation #Is the point from which people can hire bikes

include BikeContainer


	def release_bike_for_hire
		if self.working_bikes.any?
			bikes.delete(self.working_bikes.shift)
		end
	end

end