require_relative 'card'
require_relative 'car'
require_relative 'ParkingLotException'

class ParkingLot
	def initialize total_slots
		@total_slots = total_slots
		@available_total = total_slots
		@cards = []
	end

	attr_reader :available_total

	def full?
		return available_total == 0
	end

	def park! car
		raise ParkingLotException.new("No available parking lot available") \
			if self.full?

		@available_total -= 1
		card = Card.new(car.id)
		@cards.push(card)

		return card
	end

	def take! card
		raise ParkingLotException.new('Invalid parking card')\
			unless @cards.include?(card)

		@cards.delete(card)
		return Car.new(card.id)
	end
end

