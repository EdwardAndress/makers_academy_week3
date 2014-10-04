require_relative './bike_container'

class Garage #used to fix broken bikes

	include BikeContainer

	def remove_broken_bikes_from(van)
		self.bikes << (van.non_customer_release(van.broken_bikes))
	end

	def fix_broken_bikes
		self.broken_bikes.each {|broken_bike| broken_bike.fix}
	end

end