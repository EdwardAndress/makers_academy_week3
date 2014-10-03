#this allows all files to be 'required' in irb or pry with one command

require_relative './person'
require_relative './bike'
require_relative './docking_station'
require_relative './bike_container'
require_relative './van'

def available_objects #top level method which shows the user what objects can be instatiated as part of this domain
	puts 'Person, Bike, Van, DockingStation'
end