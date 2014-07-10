require 'bike_container'
require 'spec_helpers'

shared_examples 'a bike container' do

	let(:holder) {described_class.new}
	let(:bike) {double :bike, fix!: nil, is_a?: true}
	let(:working_bike) {double :working_bike, broken?: false, fix!: nil, is_a?: true}
	let(:broken_bike) {double :broken_bike, broken?: true, fix!: nil, is_a?: true}

	def add_two_bikes
		 	holder.dock(working_bike)
 			holder.dock(broken_bike)
	end
	
	context 'Capacity:' do

		it 'should be empty to start with' do
			expect(holder).to be_empty
		end

	 	it 'should know when it is full' do
		 		holder.fill_with(bike)
		 		expect(holder).to be_full	
		end

		it 'should not accept a bike if it is full' do
 			holder.fill_with(bike)
 			expect { holder.dock(bike) }.to raise_error(RuntimeError)
 		end
 	
 	end

 	context 'Interacting with bikes:' do

 		it 'should accept a bike' do
 			holder.dock(bike)
 			expect(holder).not_to be_empty
 		end

 		it 'should release a bike' do
 			holder.dock(bike)
 			holder.release(bike)
 			expect(holder).to be_empty
 		end

 		it 'should throw and error if trying to release from empty holder' do
 			expect { holder.release(bike) }.to raise_error(RuntimeError)
 		end

 		it 'should throw an error if trying to release an absent bike' do
 			holder.dock(working_bike)
 			expect { holder.release(bike) }.to raise_error(RuntimeError) 
 		end

 		it 'should throw an error if dock argument is not a bike' do
 			allow(self).to receive(:fix!)
 		 	expect { holder.dock("^&^(*") }.to raise_error
 		end

 		it 'should provide a list of available bikes' do
 			add_two_bikes
 			expect(holder.available_bikes).to eq [working_bike]
 		end

 		it 'should provide a list of broken bikes' do
 			add_two_bikes
 			expect(holder.broken_bikes).to eq [broken_bike]
 		end

 		it 'should be able to release all bikes' do
 			add_two_bikes
 			holder.release_all_bikes
 			expect(holder).to be_empty
 		end

 		it 'should be able to release all broken bikes' do
 			add_two_bikes
 			holder.release_broken_bikes
 			expect(holder.bikes).to eq [working_bike]
 		end

 	end

end