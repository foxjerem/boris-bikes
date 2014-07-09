require 'docking_station'

BIG_CAPACITY = 20

describe DockingStation do
	
	let(:station) {DockingStation.new}
	let(:bike) {double :bike}
	let(:working_bike) {double :working_bike, broken?: false}
	let(:broken_bike) {double :broken_bike, broken?: true}

	def fill_station
		DockingStation::DEFAULT_CAPACITY.times { station.dock(bike) }
	end

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
	 		fill_station
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

 		it 'should not accept a bike if it is full' do
 			fill_station
 			expect { station.dock(bike) }.to raise_error(RuntimeError)
 		end

 		it 'should provide a list of available bikes' do
 			station.dock(working_bike)
 			station.dock(broken_bike)
 			expect(station.available_bikes).to eq [working_bike]
 		end

 		it 'should provide a list of broken bikes' do
 			station.dock(working_bike)
 			station.dock(broken_bike)
 			expect(station.broken_bikes).to eq [broken_bike]
 		end

 	end

end
