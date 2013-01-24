require_relative '../src/ParkingLot'

require 'test/unit'

class ParkingLotTest < Test::Unit::TestCase
	ID = '10001'

	def setup
		@sut = ParkingLot.new 10
	end

	def test_given_empty_lot_should_return_total_slot_number_as_available_slots
		assert_equal(10, @sut.available_total)
	end

	def test_given_parking_one_car_succeed_should_return_a_card_with_id_same_as_car
		car = Car.new ID

		card = @sut.park! car

		assert_equal(ID, card.id)
	end

	def test_given_parking_to_parking_lot_has_no_available_slot_should_raise_exception
		sut = ParkingLot.new 1

		sut.park! Car.new('Dont Care')

		assert_raise(ParkingLotException) do
			sut.park! Car.new(ID)
		end
	end

end
