module BikeContainer #Describes the shared functionality of all objects in this domain which can contain bikes

DEFAULT_CAPACITY = 10

	def initialize (capacity: DEFAULT_CAPACITY, bikes: [])
		@capacity = capacity
		@bikes = bikes
	end

	def bikes
		@bikes ||= []
	end

	def next_bike
		bikes.shift
	end

	def capacity
		@capacity
	end

	def capacity=(value)
		@capacity = value
	end

	def space
		capacity - bikes_count
	end

	def bikes_count
		bikes.count
	end

	def dock(bike)
		raise "Sorry, there is no room for that bike" if full?
		bikes << bike
	end

	def full?
		bikes.count == self.capacity
	end

	def non_customer_release(bikes_to_release)
		bikes_to_release.each {|bike| bikes.delete(bike)}
	end

	def working_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes - working_bikes
	end

end