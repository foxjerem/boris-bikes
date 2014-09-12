Week 3 @ Makers Academy: Introduction to OO Programming
=======================================================

A simplified version of the software used to manage boris bikes in London. Implemented two different versions. The first using Chicago-style testing (dealing with instantiated objects throughout). The second uses London-style testing (dealing doubles/mocks throughout). I found the latter more challenging to implement initially, but led to cleaner code and have been using the London style wherever possible since

Ruby Version:
-------------
Ruby 2.1.2

Classes:
--------
 - Bike: either in broken or fixed state
 - Docking Station: holds bikes up to its maximum capacity
 - Van: moves bikes between stations and garages
 - Garage: repairs broken bikes

Running the application:
------------------------
$ ruby lib/run.rb from ./london-style

Running the test suite:
-----------------------
- Chicago style: $ rspec from ./chicago-style
- London style: $ rspec from ./london-style