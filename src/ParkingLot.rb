require_relative 'card'
require_relative 'car'

class ParkingLot
	def initialize total_slots
		@total_slots = total_slots
	end

	def availible_total
		return @total_slots
	end

	def park car
		return Card.new(car.id)
	end
end

