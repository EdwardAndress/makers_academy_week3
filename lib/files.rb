#this allows all files to be 'required' in irb or pry with one command

require_relative './person'
require_relative './bike'
require_relative './docking_station'
require_relative './bike_container'
require_relative './van'
require_relative './garage'

def available_objects #top level method which shows the user what objects can be instatiated as part of this domain
	[Person, Bike, Van, DockingStation, Garage]
end

def objects_and_methods
	available_objects.each do |object|
		puts '=' * 20
		print object.new.class ; puts ' methods'
		puts '-' * 20
		object.instance_methods(false).each {|method| puts method}
		puts'=' * 20
	end
	puts "Methods shared by all objects that can contain bikes (Vans, DockingStations and Garages)"
	puts '-' * 20
	BikeContainer.instance_methods(false).each do |method|
		puts method
	end
	puts '=' * 20
end