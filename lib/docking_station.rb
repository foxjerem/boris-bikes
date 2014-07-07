class DockingStation

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@bikes = []
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		raise "Station is full" if full?
		@bikes << bike
	end

	def release(bike)
		raise "Argument is not a bike" unless bike.is_a?(Bike)
		raise "Station is empty" if self.empty?
		raise "Bike is not in the station" unless @bikes.include?(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == @capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		@bikes.reject { |bike| bike.broken? }
	end

end