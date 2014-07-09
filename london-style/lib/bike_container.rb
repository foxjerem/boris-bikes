
module BikeContainer

	DEFAULT_CAPACITY = 10

	attr_writer :capacity
	
	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		dock_error_handler(bike)
		bikes << bike
	end

	def dock_error_handler(bike)
		raise "error: container is full" if full?
	end

	def release(bike)
		bikes.delete(bike)
	end

	def empty?
		bikes.empty?
	end

	def full?
		bike_count >= capacity
	end

	def available_bikes
		bikes.reject(&:broken?)
	end

	def broken_bikes
		bikes.select(&:broken?)
	end

end