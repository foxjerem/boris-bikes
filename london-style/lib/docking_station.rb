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
		dock_error_handler(bike)
		@bikes << bike
	end

	def dock_error_handler(bike)
		raise "error: station is full" if full?
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

	def available_bikes
		@bikes.reject(&:broken?)
	end

	def broken_bikes
		@bikes.select(&:broken?)
	end

end