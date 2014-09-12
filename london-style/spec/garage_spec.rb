require 'garage'

describe Garage do

	let(:garage) 	{ Garage.new(capacity: BikeContainer::DEFAULT_CAPACITY) }
	let(:bike) 		{ double :bike, fix!: :bike, is_a?: true								}

	it_should_behave_like 'a bike container'

	it 'should allow setting capacity on initialization' do
		expect(garage.capacity).to eq BikeContainer::DEFAULT_CAPACITY
	end

	it 'should fix bikes when they are docked' do
		expect(bike).to receive(:fix!)
		garage.dock(bike)
	end

end