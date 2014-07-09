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
		raise "Container is full" if full?
		raise "Argument is not a bike" unless bike.is_a?(Bike)
	end

	def release(bike)
		release_error_handler(bike)
		bikes.delete(bike)
	end

	def release_error_handler(bike)
		raise "Container is empty" if empty?
		raise "Argument is not a bike" unless bike.is_a?(Bike)
		raise "Bike is not in the container" unless bikes.include?(bike)
	end

	def full?
		bike_count >= capacity
	end

	def empty?
		bikes.empty?
	end

	def available_bikes
		bikes.reject(&:broken?)
	end

	def broken_bikes
		bikes.select(&:broken?) 
	end

end