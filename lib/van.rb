require_relative 'bike_container'

class Van

		include BikeContainer

		def initialize(options={})
			self.capacity = options.fetch(:capacity, capacity)
		end

		def collect_bikes_from(bike_container)
			while bike_container.broken_bikes.each do |broken_bike|
				self.dock(broken_bike)
				bike_container.release(broken_bike)
			end
		end

		def release_bikes_to(bike_container)
			while !empty?
				release(bikes[0])	
				bike_container.dock(bikes[0])
			end
		end

end


