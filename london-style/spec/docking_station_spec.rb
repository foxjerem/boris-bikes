require 'docking_station'

BIG_CAPACITY = 20

describe DockingStation do
	
	let(:station) {DockingStation.new}

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

 	end

end
