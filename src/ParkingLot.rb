require_relative 'card'
require_relative 'car'
require_relative 'ParkingLotException'

class ParkingLot
	def initialize total_slots
		@total_slots = total_slots
	end

	def availible_total
		return @total_slots
	end

	def park! car
		if availible_total == 0
			raise ParkingLotException.new("No availible parking lot availible")
		end
		return Card.new(car.id)
	end
end

