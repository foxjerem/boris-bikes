require 'bike'

describe Bike do

	let(:bike) {Bike.new}

	context 'state of repair' do
	
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

	context 'docking' do

		it 'it should not be docked initially' do
			expect(bike.docked?).to be false
		end

		it 'should know if it is docked' do
			bike.dock!		
			expect(bike.docked?).to be true
		end

		it 'should know if it is undocked' do
			bike.dock!.undock!		
			expect(bike.docked?).to be false
		end
		
	end

end