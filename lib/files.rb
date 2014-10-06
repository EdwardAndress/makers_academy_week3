#this allows all files to be 'required' in irb or pry with one command

require_relative './person'
require_relative './bike'
require_relative './docking_station'
require_relative './bike_container'
require_relative './van'
require_relative './garage'


def domain_summary
	available_objects.each {|object| section_header(object) ; object_methods(object)}
	module_summary(BikeContainer)
end

def available_objects #top level method which shows the user what objects can be instatiated as part of this domain
	[Person, Bike, Van, DockingStation, Garage]
end

def module_summary(mod)
	section_start_and_end
	puts "Methods shared by all objects that can contain bikes (Vans, DockingStations and Garages)"
	header_end
	object_methods(mod)
end

def section_header(object)
	section_start_and_end
	print object.new.class ; puts ' methods'
	header_end
end

def object_methods(object)
	object.instance_methods(false).each {|method| puts method}
	section_start_and_end
end

def header_end
	puts '-' * 20
end

def section_start_and_end
	puts '=' * 20
end