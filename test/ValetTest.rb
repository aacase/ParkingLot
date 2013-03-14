require_relative '../src/ParkingLot'

require 'test/unit'

class Valet
	def initialize
		@parking_lots = []
	end

	def assign_parking_lot(lot)
		@parking_lots.push(lot)
	end

	def park!(car)
		@parking_lots.select{ |lot| !lot.full? }.first.park!(car)
	end
end

class FakeParkingLot < ParkingLot
	def initialize 
		@cars = []
		@full = false
	end

	def park!(car)
		@cars.push(car)
		return Card.new(car.id)
	end

	def full?
		@full
	end
	
	attr_accessor :full
	attr_reader :cars
end

class ValetTest < Test::Unit::TestCase

	LotCapacity = 10
	ID = '1000001'

	def setup
		@parking_lot = FakeParkingLot.new
		@parking_lot_2 = FakeParkingLot.new
		@valet = Valet.new
		@valet.assign_parking_lot @parking_lot
		@valet.assign_parking_lot @parking_lot_2
		@car = Car.new ID
	end

	def test_given_valet_when_park_a_car_then_corrent_card_returns
		card = @valet.park! @car
		assert_equal(ID, card.id)
	end

	def test_given_valet_with_parking_lot_when_assign_lot_then_has_two_parking_lots
		@valet.park! @car
		assert_equal(1, @parking_lot.cars.size)
	end
	
	def test_given_valet_with_first_lot_full_when_park_then_parks_in_second_lot
		@parking_lot.full = true
		@valet.park! @car
		assert_equal(1, @parking_lot_2.cars.size)
	end
end

