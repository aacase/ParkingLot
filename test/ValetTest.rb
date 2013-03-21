require_relative '../src/Valet'

require 'test/unit'

require_relative 'FakeParkingLot'

class ValetTest < Test::Unit::TestCase

	ID = '1000001'

	def setup
		@parking_lot = FakeParkingLot.new
		@parking_lot_2 = FakeParkingLot.new
		@valet = Valet.new
		@valet.assign_parking_lot @parking_lot
		@valet.assign_parking_lot @parking_lot_2
		@car = Car.new ID
	end

	def test_given_valet_when_park_a_car_then_correct_card_returns
		card = @valet.park! @car
		assert_equal(ID, card.id)
	end

	def test_given_valet_with_parking_2_lots_when_park_car_then_car_is_parked_in_first_lot
		@valet.park! @car
		assert(@parking_lot.include? @car.id)
	end
	
	def test_given_valet_with_first_lot_full_when_park_then_parks_in_second_lot
		@parking_lot.full = true
		@valet.park! @car
		assert(@parking_lot_2.include? @car.id)
	end

	def test_given_valet_with_all_lots_full_when_park_then_throw_exception
		@parking_lot.full = true
		@parking_lot_2.full = true
		assert_raise(ParkingLotException) do
			@valet.park! @car
		end
	end

	def test_given_valet_with_a_car_parked_when_return_with_ticket_then_return_car
		card = @valet.park! @car
		actual_car = @valet.take! card
		assert_equal(@car.id, actual_car.id)
	end

	def test_given_invalid_card_when_take_then_throw_exception
		assert_raise(ParkingLotException) do
			@valet.take! Card.new(11111)
		end
	end
end

