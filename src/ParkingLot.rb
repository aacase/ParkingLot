require_relative 'card'
require_relative 'car'
require_relative 'ParkingLotException'

class ParkingLot
	def initialize total_slots
		@total_slots = total_slots
		@available_total = total_slots
	end

	attr_reader :available_total

	def full?
		return available_total == 0
	end

	def park! car
		raise ParkingLotException.new("No available parking lot available") if self.full?
		@available_total -= 1
		return Card.new(car.id)
	end

	def take card
		return Car.new(card.id)
	end
end

