require 'person'

describe 'person' do

	let(:bike)			{double :Bike, :class => 'Bike', :break => nil													}
	let(:station)		{double :DockingStation, :working_bikes => [bike], :release_bike_for_hire => bike, :dock => nil }
	let(:eddie) 		{Person.new												}
	let(:bad_cyclist) 	{Person.new(cycling_ability: 10)						}

	context 'when first instatiated' do 

		it 'should not have a bike' do
			expect(eddie.bike).to eq nil
		end

		it 'should have the ability to posses a bike for when one is rented later on' do
			#in this test the person is just given a bike without the need for a 'hire' method, using the attribute writer
			eddie.bike= bike
			expect(eddie.bike.class).to eq 'Bike'
		end

		it 'should have a cycling ability attribute which can be used to determine the liklihood of a crash' do
			expect(bad_cyclist.cycling_ability).to eq 10
		end

	end

	context 'when using the bike hire scheme' do

		it 'can hire a bike' do 
			eddie.hire_bike_from(station)
			expect(eddie.bike.class).to eq 'Bike'
		end

		it 'breaks the bike as the result of a crash' do
			eddie.bike= bike
			expect(eddie.bike).to receive(:break)
			eddie.crash
		end

		it 'can return a bike to a DockingStation' do
			eddie.bike= bike
			eddie.return_bike_to(station)
			expect(eddie.bike).to eq nil
		end

	end

end