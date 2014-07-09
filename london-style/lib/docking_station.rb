class DockingStation

	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def capacity
		@capacity
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def empty?
		@bikes.empty?
	end

	def full?
		bike_count >= capacity
	end

end