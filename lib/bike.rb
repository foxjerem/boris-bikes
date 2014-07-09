class Bike

	def initialize
		@broken = false
		@docked = false
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
		self
	end

	def fix!
		@broken = false
		self
	end

	#Remove docked functionality? Not really required
	def docked?
		@docked
	end

	def dock!
		@docked = true
		self
	end
	
	def undock!
		@docked = false
		self
	end
end