require 'garage'
require 'van'
require 'bike_container'
require 'bike'

describe Garage do
	
	let(:garage) {Garage.new(:capacity => 50)}
	let(:van) {Van.new(:capacity => 15)}

	it 'should allow setting capacity on initialising' do
		expect(garage.capacity).to eq 50
	end

	it 'fixes the bikes' do
		10.times{van.dock(Bike.new.break!)}
		van.release_bikes_to(garage)
		expect(garage.broken_bikes).to eq []
	end

end