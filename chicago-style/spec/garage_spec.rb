require 'garage'
require 'van'
require 'bike_container'
require 'bike'

VAN_CAPACITY = 15
LARGE_CAPACITY = 100

describe Garage do
	
	let(:garage) 	{ Garage.new(:capacity => LARGE_CAPACITY) }
	let(:van) 		{ Van.new(:capacity => VAN_CAPACITY)			}

	it 'should allow setting capacity on initialising' do
		expect(garage.capacity).to eq LARGE_CAPACITY
	end

	it 'fixes the bikes' do
		VAN_CAPACITY.times{van.dock(Bike.new.break!)}
		van.release_all_bikes_to(garage)
		expect(garage.broken_bikes).to eq []
	end

end