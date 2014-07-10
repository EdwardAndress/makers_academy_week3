require './spec/bike_container_spec'
require 'van'

describe Van do

	let(:station) {DockingStation.new}
	let(:van) {Van.new}

	it_behaves_like 'a bike container'

	it 'can collect broken bikes from a station' do
		expect(station).to receive(:release).with(station.broken_bikes)
		van.collect_broken_bikes_from(station)
	end

end