class Van

	include BikeContainer

	public

	def initialize(options = {})
		van.capacity = options.fetch(:capacity, capacity)
	end

	def collect_all_bikes_from(container)
		all_bikes = container.release_all_bikes
		all_bikes.each do |bike|
			dock(bike)
		end
	end

	def collect_broken_bikes_from(container)
		bad_bikes = container.release_broken_bikes
		bad_bikes.each do |bike|
			dock(bike)
		end
	end

	def release_all_bikes_to(container)
		until van.empty? or container.full?
			container.dock(bikes.first)
			van.release(bikes.first)
		end
	end

	private

	def van
		self
	end

end
