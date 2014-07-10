module BikeContainer

DEFAULT_CAPACITY = 10

	def initialize (capacity: DEFAULT_CAPACITY, bikes: [])
		@capacity = capacity
		@bikes = bikes
	end

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity
	end

	def capacity=(value)
		@capacity = value
	end

	def bikes_count
		bikes.count
	end

	def dock(bike)
		raise "This van is full" if full?
		bikes << bike
	end

	def full?
		bikes.count == DEFAULT_CAPACITY
	end

	def release(bikes_to_release)
		bikes_to_release.each {|bike| bikes.delete(bike)}
	end

	def working_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes - working_bikes
	end

end