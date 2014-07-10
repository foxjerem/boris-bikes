require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def dock(bike)
		bike.fix!	
		super(bike)
	end

end