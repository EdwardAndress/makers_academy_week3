require 'bike_container'

	def fill(container)
		10.times {container.dock(bike)}
	end

shared_examples 'a bike container' do

	let(:container)	{described_class.new   }
	let(:bike)	{double :bike }

	it "should know it's capacity" do 
		expect(container.capacity).to eq 10
	end

	it 'can be initialized with a customized capacity' do
		customized_container = described_class.new(capacity: 50, bikes: [:bike1, :bike2])
		expect(customized_container.capacity).to eq 50
		expect(customized_container.bikes).to eq [:bike1, :bike2]
	end

	it 'should enable you to modify capacity if you wanna' do
		new_capacity =20
		container.capacity=(new_capacity)
		expect(container.capacity).to eq 20
	end

	it 'container must not contain anything when first created' do
		expect(container.bikes).to eq []
	end

	it 'should accept a bike' do
		expect(container.bikes_count).to eq 0
		container.dock(bike)
		expect(container.bikes_count).to eq 1
	end

	it 'should release a bike' do
		container.dock(bike)
		container.release([bike])
		expect(container.bikes_count).to eq 0
	end

	it "should know when it's full" do
		expect(container).not_to be_full
		fill(container)
		expect(container).to be_full
	end

	it 'should not accept more bikes when full' do
		fill(container)
		expect(lambda{container.dock(bike)}).to raise_error(RuntimeError)
	end

	it 'should have a list of working bikes' do
		bike1 = Bike.new
		bike2 = Bike.new
		bike3 = Bike.new
		bike3.break
		container.dock(bike1)
		container.dock(bike2)
		container.dock(bike3)
		expect(container.working_bikes).to eq [bike1, bike2]
	end

	it 'should have a list of broken bikes' do
		bike1 = Bike.new
		bike2 = Bike.new
		bike3 = Bike.new
		bike3.break
		container.dock(bike1)
		container.dock(bike2)
		container.dock(bike3)
		expect(container.broken_bikes).to eq [bike3]
	end

	it 'must be able to selectively release broken bikes to the van for repair' do
		bike1 = Bike.new
		bike2 = Bike.new
		bike3 = Bike.new
		bike3.break
		container.dock(bike1)
		container.dock(bike2)
		container.dock(bike3)
		expect(container.release(container.broken_bikes)).to eq [bike3]
	end
end