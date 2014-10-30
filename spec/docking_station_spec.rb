require './spec/bike_container_spec'
require './lib/docking_station'


describe DockingStation do

	it_behaves_like 'a bike container'

	context 'when being used by a person' do

		it 'can release a working bike for hire' do
			station = DockingStation.new(bikes: [Bike.new, Bike.new])
			expect(station.bikes.count).to eq 2
			station.release_bike_for_hire #direct interaction with the station so as not to require a person methods
			expect(station.bikes.count).to eq 1
		end

		it 'will give an appropriate message if there are no bikes available' do
			station = DockingStation.new #a station with no bikes
			expect(station.release_bike_for_hire).to eq 'There are currently no available bikes'
		end

	end

	context 'has a location' do

		it 'using GPS coordinates' do
			station = DockingStation.new(location: [-81.110766, 84.375003])
			expect(station.location).to eq [-81.110766, 84.375003]
		end

	end

end

