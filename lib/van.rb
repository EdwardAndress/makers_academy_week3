require_relative './bike_container'

class Van #used to collect broken bikes from dockingstations, deliver them to the garage and redistribute working bikes

include BikeContainer

	def collect_broken_bikes_from(station)
		station.broken_bikes.each {|bike| self.dock(bike)} #loads each broken bike into the van
		station.non_customer_release(station.broken_bikes) #deletes all the broken bikes from the docking station
	end

end