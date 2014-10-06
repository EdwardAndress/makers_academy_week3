require_relative './bike_container'

class Van #used to collect broken bikes from dockingstations, deliver them to the garage and redistribute working bikes

include BikeContainer

	def collect_broken_bikes_from(station)
		station.broken_bikes.each {|bike| self.dock(bike)} #loads each broken bike into the van
		station.non_customer_release(station.broken_bikes) #deletes all the broken bikes from the docking station
	end

	def collect_working_bikes_from(garage)
		self.bikes << (garage.non_customer_release(garage.working_bikes))
	end

	def stations_with_space
		ObjectSpace.each_object(DockingStation).to_a.reject {|dockingstation| dockingstation.full?}
	end

	def redistribute_bikes #automates redistribution of bikes to stations with available spaces
		self.stations_with_space.each do |station|
			station.space.times do
				station.dock(self.next_bike)
			end
		end
	end

end