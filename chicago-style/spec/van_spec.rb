require 'van'
require 'docking_station' 
require 'bike'

VAN_CAPACITY = 15

describe Van do
	
	let(:van) 					{ Van.new(:capacity => VAN_CAPACITY)	}
	let(:busy_station) 	{ DockingStation.new									}

	it 'should allow setting capacity on initialising' do
		expect(van.capacity).to eq VAN_CAPACITY
	end

	it 'should release all bikes to a container' do
		busy_station.capacity.times{ van.dock(Bike.new) }
		van.release_all_bikes_to(busy_station)
		expect(van.bike_count).to eq 0
		expect(busy_station.bike_count).to eq busy_station.capacity
	end

	it 'should collect all bikes from a container' do
		busy_station.dock(Bike.new)
		busy_station.dock(Bike.new.break!)
		n = busy_station.bike_count
		van.collect_all_bikes_from(busy_station)
		expect(van.bike_count).to eq n
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

	it 'should only collect bikes until the van is full' do
		big_docking_station = DockingStation.new(capacity: 30)
		big_docking_station.capacity.times{ big_docking_station.dock(Bike.new) }
		van.collect_all_bikes_from(big_docking_station)
		expect(van.bike_count).to eq van.capacity
		expect(big_docking_station.bike_count).to eq big_docking_station.capacity - van.capacity
	end

end