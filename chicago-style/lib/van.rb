require_relative 'bike_container'

class Van

	include BikeContainer

	public
		
	def initialize(options={})
		van.capacity = options.fetch(:capacity, capacity)
	end

	def collect_all_bikes_from(container)
		until container.empty? or van.full?
			van.dock(container.bikes.first)
			container.release(container.bikes.first)
		end
	end

	def collect_broken_bikes_from(container)
		until container.broken_bikes.empty? or van.full?
			van.dock(container.broken_bikes.first)
			container.release(container.broken_bikes.first)
		end
	end

	def release_all_bikes_to(container)
		until container.full? or van.empty? 
			container.dock(bikes.first)
			van.release(bikes.first)
		end
	end	

	private
		
	def van 
		self
	end

end


