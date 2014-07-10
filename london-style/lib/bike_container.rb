
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
		# raise "error: argument is not a bike" unless bike.is_a?(Bike)
	end

	def release(bike)
		release_error_handler(bike)
		bikes.delete(bike)
	end

	def release_error_handler(bike)
		raise "error: holder is empty" if empty?
		raise "error: bike is not in the container" unless bikes.include?(bike)
		# raise "error: argument is not a bike" unless bike.is_a?(Bike)
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

	def release_all_bikes
		release_bikes(bikes)
		bikes
	end

	def release_broken_bikes
		release_bikes(broken_bikes)
		broken_bikes
	end

	def release_bikes(chosen_bikes)
		chosen_bikes.each do |bike|
			release(bike)
		end
	end

	def fill_with(bike)
		capacity.times {dock(bike)}
	end

end