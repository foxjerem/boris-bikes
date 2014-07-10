require './lib/bike'
require './lib/bike_container'
require './lib/docking_station'
require './lib/van'
require './lib/garage'

van = Van.new(capacity: 10)
garage = Garage.new(capacity: 50)
station = DockingStation.new(capacity: 10)
5.times{ station.dock(Bike.new) }
5.times{ station.dock(Bike.new.break!) }
puts "station:"
puts station.bikes.inspect
van.collect_broken_bikes_from(station)
puts "van collects bikes from station\nvan:"
puts van.bikes.inspect
puts "station"
puts station.bikes.inspect
van.release_all_bikes_to(garage)
puts "van delivers bikes to garage\nvan:"
puts van.bikes.inspect
puts "garage:"
puts garage.bikes.inspect
puts "van collects all bikes from garage\nvan:"
van.collect_all_bikes_from(garage)
puts van.bikes.inspect
puts "garage:"
puts garage.bikes.inspect
van.release_all_bikes_to(station)
puts "van releases bikes to station\nvan:"
puts van.bikes.inspect
puts "station:"
puts station.bikes.inspect
puts "garage:"
puts garage.bikes.inspect

