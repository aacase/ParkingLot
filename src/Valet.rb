require_relative 'ParkingLot'

class Valet
	def initialize
		@parking_lots = []
	end

	def assign_parking_lot(lot)
		@parking_lots.push(lot)
	end

	def park!(car)
		target_lot = @parking_lots.select{ |lot| !lot.full? }.first
		raise ParkingLotException.new("All parking lots are full") if target_lot.nil?
		target_lot.park!(car)
	end

	def take!(card)
		target_lot = @parking_lots.select{ |lot| lot.include? card.id }.first
		raise ParkingLotException.new("No car with this ID parked in any lot") if target_lot.nil?
		target_lot.take! card
	end

	def has_empty_space?
		@parking_lots.select{ |lot| !lot.full? }.first != nil
	end
end


