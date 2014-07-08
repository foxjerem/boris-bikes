require 'bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	def fill_holder
		holder.capacity.times { holder.dock(Bike.new) }
	end

	it 'should accept a new bike' do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	it 'should know when it is full' do
		expect(holder).not_to be_full
		fill_holder	
		expect(holder).to be_full
	end

	it 'should know when it is empty' do
		expect(holder).to be_empty
		fill_holder	
		expect(holder).not_to be_empty
	end

	it 'should not accept a bike if full' do
		fill_holder
		expect{ holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it 'should provide a list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it 'should provide a list of broken bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	context 'release' do

		it 'should release a bike' do
			holder.dock(bike)
			holder.release(bike)
			expect(holder.bike_count).to eq 0
		end

		it 'should raise an error if the argument passed is not a bike' do
			holder.dock(bike)
			expect{holder.release("grabncbjh")}.to raise_error(RuntimeError)
		end

		it 'should raise error if bike is not in the holder' do
			bike2 = Bike.new
			holder.dock(bike2)
			expect{holder.release(bike)}.to raise_error(RuntimeError)
		end

		it 'should raise error if the holder is empty' do
			expect{holder.release(bike)}.to raise_error(RuntimeError)
		end

	end

end