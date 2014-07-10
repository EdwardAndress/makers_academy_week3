require_relative './bike_container'

class Van

include BikeContainer

def collect_broken_bikes_from(station)
	station.release(broken_bikes)
end

end