require './spec/bike_container_spec'
require 'van'

describe Van do

	let(:bike)						{double :bike, :broken? => false}
	let(:broken_bike)			{double :bike, :broken? => true}
	let(:station) 				{DockingStation.new(bikes: [broken_bike, bike])}
	let(:van) 						{Van.new}

	it_behaves_like 'a bike container'

	it 'can collect broken bikes from a station' do
		expect(station).to receive(:non_customer_release).with(station.broken_bikes)
		van.collect_broken_bikes_from(station)
		expect(van.bikes.count).to eq 1
	end

end