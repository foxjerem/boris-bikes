require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:holder) {ContainerHolder.new}
	let(:bike) {double :bike}
	let(:working_bike) {double :working_bike, broken?: false}
	let(:broken_bike) {double :broken_bike, broken?: true}

	def fill_holder
		BikeContainer::DEFAULT_CAPACITY.times { holder.dock(bike) }
	end

	context 'Capacity:' do

	 	it 'should know when it is full' do
		 		fill_holder
		 		expect(holder).to be_full	
		end

 	end

 	context 'Interacting with bikes:' do

 		it 'should accept a bike' do
 			holder.dock(bike)
 			expect(holder.bike_count).to be 1
 		end

 		it 'should release a bike' do
 			holder.dock(bike)
 			holder.release(bike)
 			expect(holder).to be_empty
 		end

 		it 'should not accept a bike if it is full' do
 			fill_holder
 			expect { holder.dock(bike) }.to raise_error(RuntimeError)
 		end

 		it 'should provide a list of available bikes' do
 			holder.dock(working_bike)
 			holder.dock(broken_bike)
 			expect(holder.available_bikes).to eq [working_bike]
 		end

 		it 'should provide a list of broken bikes' do
 			holder.dock(working_bike)
 			holder.dock(broken_bike)
 			expect(holder.broken_bikes).to eq [broken_bike]
 		end

 	end

end