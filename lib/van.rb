require_relative 'bike_container'

class Van

		include BikeContainer

		def initialize(options={})
			self.capacity = options.fetch(:capacity, capacity)
		end

		#Add option to collect broken bikes, non-broken bikes or all bikes?
		#Need to fix this method to not return nil as per the other...
		#Add capacity loop (stop if van full)
		# def collect_bikes_from(bike_container)
		# 	bike_container.broken_bikes.each do |broken_bike|
		# 		dock(broken_bike)
		# 		bike_container.release(broken_bike)
		# 	end
		# end


		def collect_bikes_from(bike_container)
			until bike_container.empty? or full?
				dock(bike_container.bikes.first)
				bike_container.release(bike_container.bikes.first)
			end
		end

		#Add capacity to loop (stop if container full)
		def release_bikes_to(bike_container)
			until empty? or bike_container.full?
				bike_container.dock(bikes.first)
				release(bikes.first)
			end
		end

end


