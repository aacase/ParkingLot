require_relative '../src/ParkingLot'

class FakeParkingLot < ParkingLot
	LotCapacity = 10
	def initialize 
		super LotCapacity
		@full = false
	end

	def full?
		@full
	end
	
	attr_accessor :full
end


