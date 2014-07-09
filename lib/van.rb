require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options={})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def collect_all_bikes_from(bike_container)
		until bike_container.empty? or full?
			dock(bike_container.bikes.first)
			bike_container.release(bike_container.bikes.first)
		end
	end

	def collect_broken_bikes_from(bike_container)
		until bike_container.broken_bikes.empty? or full?
			dock(bike_container.broken_bikes.first)
			bike_container.release(bike_container.broken_bikes.first)
		end
	end

	def release_all_bikes_to(bike_container)
		until empty? or bike_container.full?
			bike_container.dock(bikes.first)
			release(bikes.first)
		end
	end

end


