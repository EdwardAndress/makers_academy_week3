require './spec/bike_container_spec'
require './lib/docking_station'


describe DockingStation do

	it_behaves_like 'a bike container'

	context 'when being used by a person' do
		it 'can release a working bike for hire' do
			station = DockingStation.new(bikes: [Bike.new, Bike.new])
			expect(station.bikes.count).to eq 2
			station.release_bike_for_hire
			expect(station.bikes.count).to eq 1
		end
	end	

end

