require 'garage'

describe Garage do

  let(:garage)          {Garage.new}
  let(:van)             {double :van, :broken_bikes => broken_bike, :non_customer_release => broken_bike}
  let(:broken_bike)     {double :bike, :broken? => true}
  let(:working_bike)    {double :bike, :broken? => false}
  let(:fixed_bike)      {double :bike, :broken? => false}  

  it_behaves_like 'a bike container'

  context 'when receiving bikes' do 

    it 'accepts broken bikes from a van' do
      garage.remove_broken_bikes_from(van)
      expect(garage.broken_bikes.count).to eq 1
    end

    it 'fixes broken bikes' do
      garage.remove_broken_bikes_from(van) #to put the broken_bike in the garage
      expect(broken_bike).to receive(:fix) #we know the broken bike is in the garage and that the fix method works so all we need to test is that the garage method invokes the fix method
      garage.fix_broken_bikes
    end

  end

end