require 'garage'

describe Garage do

  let(:garage)          {Garage.new}
  let(:van)             {double :van}
  let(:broken_bike)     {double :bike, :broken => true}
  let(:working_bike)    {double :bike, :broken => false}
  let(:fixed_bike)      {double :bike, :broken => false}  

  it_behaves_like 'a bike container'

  context 'when receiving bikes' do 

    it 'accepts broken bikes from a van' do
    end

    it 'fixes broken bikes' do
    end

  end

  context 'when releasing bikes' do

    it 'releases fixed bikes to a van' do
    end
    
  end

end