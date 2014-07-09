require 'van'
require 'docking_station' 
require 'bike'

describe Van do
	
	let(:station) {DockingStation.new(:capacity => 123)}
	let(:van) {Van.new(:capacity => 15)}
	let(:busy_station) {DockingStation.new}

	it 'should allow setting capacity on initialising' do
		expect(van.capacity).to eq 15
	end

	it 'should release all bikes to a container' do
		3.times{ van.dock(Bike.new) }
		van.release_all_bikes_to(station)
		expect(van.bike_count).to eq 0
		expect(station.bike_count).to eq 3
	end

	it 'should collect all bikes from a container' do
		busy_station.dock(Bike.new)
		busy_station.dock(Bike.new.break!)
		van.collect_all_bikes_from(busy_station)
		expect(van.bike_count).to eq 2
		expect(busy_station.bike_count).to eq 0
	end

	it 'should allow the option to collect only broken bikes ' do
		busy_station.dock(Bike.new)
		busy_station.dock(Bike.new.break!)
		van.collect_broken_bikes_from(busy_station)
		expect(van.bike_count).to eq 1
		expect(busy_station.bike_count).to eq 1
		expect(busy_station.available_bikes.count).to eq 1
	end

	it 'should only release bikes until the receiving container is full' do
		(busy_station.capacity + 1).times { van.dock(Bike.new) }
		van.release_all_bikes_to(busy_station)
		expect(van.bike_count).to eq 1
		expect(busy_station).to be_full
	end

end