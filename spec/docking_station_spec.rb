require 'docking_station'
require 'bike'

describe DockingStation do
	
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}

	def fill_station
		20.times { station.dock(Bike.new) }
	end

	it 'should accept a new bike' do
		expect(station.bike_count).to eq 0
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end

	it 'should know when it is full' do
		expect(station).not_to be_full
		fill_station	
		expect(station).to be_full
	end

	it 'should know when it is empty' do
		expect(station).to be_empty
		fill_station	
		expect(station).not_to be_empty
	end

	it 'should not accept a bike if full' do
		fill_station
		expect{ station.dock(bike)}.to raise_error(RuntimeError)
	end

	it 'should provide a list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end

	context 'release' do

		it 'should release a bike' do
			station.dock(bike)
			station.release(bike)
			expect(station.bike_count).to eq 0
		end

		it 'should raise an error if the argument passed is not a bike' do
			station.dock(bike)
			expect{station.release("grabncbjh")}.to raise_error(RuntimeError)
		end

		it 'should raise error if bike is not in the station' do
			bike2 = Bike.new
			station.dock(bike2)
			expect{station.release(bike)}.to raise_error(RuntimeError)
		end

		it 'should raise error if the station is empty' do
			expect{station.release(bike)}.to raise_error(RuntimeError)
		end

	end

end