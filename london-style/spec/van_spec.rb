require 'van'
require 'spec_helpers'

VAN_CAPACITY = BikeContainer::DEFAULT_CAPACITY

describe Van do
	
	let(:van) 					{ Van.new(capacity: VAN_CAPACITY)													}
	let(:working_bike) 	{ double :working_bike, broken?: false, is_a?: true				}
	let(:broken_bike) 	{ double :broken_bike, broken?: true, is_a?: true					}
	let(:station) 			{ double :station, 
								 								release_all_bikes: [working_bike, broken_bike],
																release_broken_bikes: [broken_bike],
								 								dock: nil,
								 								full?: false
											}

	it_should_behave_like 'a bike container'

	it 'should allow setting capacity on initialisation' do
		expect(van.capacity).to eq VAN_CAPACITY
	end

	it 'should collect all bikes from a container' do
		van.collect_all_bikes_from(station)
		expect(van.bike_count).to eq 2
	end

	it 'should collect all broken bikes from a container' do
		van.collect_broken_bikes_from(station)
		expect(van.bike_count).to eq 1
	end

	it 'should release all bikes to a container' do
		van.fill_with(working_bike)
		van.release_all_bikes_to(station)
		expect(van).to be_empty
	end

	it 'should not collect a bike if it is full' do
		van.fill_with(working_bike)
		van.collect_all_bikes_from(station)
		expect(van.capacity).to eq VAN_CAPACITY
	end

end