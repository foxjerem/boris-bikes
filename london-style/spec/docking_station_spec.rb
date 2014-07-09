require 'docking_station'

BIG_CAPACITY = 20

describe DockingStation do
	
	let(:station) {DockingStation.new}
	let(:bike) {double :bike}

	context 'Capacity:' do

		it 'should have a capacity' do
			expect(station.capacity.class).to be Fixnum
		end

		it 'should set a default capacity' do
			expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
	 	end	

	 	it 'should set a capacity on initialisation' do
	 		big_station = DockingStation.new(capacity: BIG_CAPACITY)
	 		expect(big_station.capacity).to eq BIG_CAPACITY
	 	end

	 	it 'should know when it is full' do
	 		DockingStation::DEFAULT_CAPACITY.times { station.dock(bike) }
	 		expect(station).to be_full	
	 	end

 	end

 	context 'Interacting with bikes:' do

 		it 'should accept a bike' do
 			station.dock(bike)
 			expect(station.bike_count).to be 1
 		end

 		it 'should release a bike' do
 			station.dock(bike)
 			station.release(bike)
 			expect(station).to be_empty
 		end

 	end

end
