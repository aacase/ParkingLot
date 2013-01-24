require_relative 'card'
require_relative 'car'
require_relative 'ParkingLotException'

class ParkingLot
	def initialize total_slots
		@total_slots = total_slots
		@available_total = total_slots
	end

	attr_reader :available_total

	def park! car
		if @available_total == 0
			raise ParkingLotException.new("No available parking lot available")
		end
		@available_total -= 1
		return Card.new(car.id)
	end
end

