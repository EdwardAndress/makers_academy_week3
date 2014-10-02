require 'person'

describe 'person' do

	let(:bike)		{double :Bike, :class => 'Bike', :break => nil						}
	let(:station)	{double :DockingStation, :working_bikes => [bike], :release => bike }
	let(:eddie) 	{Person.new						}

	context 'when first instatiated' do 

		it 'should not have a bike' do
			expect(eddie.bike).to eq nil
		end

		it 'should have the ability to posses a bike for when one is rented later on' do
			#in this test the person is just given a bike without the need for a 'hire' method, using the attribute writer
			eddie.bike= bike
			expect(eddie.bike.class).to eq 'Bike'
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

	end

end