require './spec/bike_container_spec'
require 'docking_station'
require 'van'

describe Van do

	let(:bike)				{double :bike, :broken? => false}
	let(:broken_bike)		{double :bike, :broken? => true}
	let(:garage)			{double :garage, :bikes => [bike], :working_bikes => bike, :non_customer_release => bike}
	let(:station) 			{DockingStation.new(bikes: [broken_bike, bike])}
	let(:full_station)		{DockingStation.new(capacity: 0)}
	let(:van) 				{Van.new}


	def all_stations
		ObjectSpace.each_object(DockingStation)
	end

	def full_stations
		all_stations.select {|station| station.full?}
	end

	it_behaves_like 'a bike container'
	
	it 'can collect broken bikes from a station' do
		expect(station).to receive(:non_customer_release).with(station.broken_bikes)
		van.collect_broken_bikes_from(station)
		expect(van.bikes.count).to eq 1
	end

	it 'can collect working bikes from the garage' do
		van.collect_working_bikes_from(garage)
		expect(van.working_bikes.count).to eq 1
	end

	it 'can find DockingStations with space for bikes' do
		expect(van.stations_with_space.count).to eq all_stations.count - full_stations.count
	end

end