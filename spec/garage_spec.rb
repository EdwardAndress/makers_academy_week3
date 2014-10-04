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
    end

  end

  context 'when releasing bikes' do

    it 'releases fixed bikes to a van' do
    end
    
  end

end