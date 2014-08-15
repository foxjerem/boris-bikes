require 'bike'

describe Bike do

	let(:bike) { Bike.new }

	it 'should not be broken initially' do
		expect(bike.broken?).to eq false 
	end

	it 'can be broken' do
		bike.break!
		expect(bike.broken?).to be true
	end

	it 'can be fixed' do
		bike.break!.fix!
		expect(bike.broken?).to be false
	end

end