require_relative '../src/ParkingLot'

require 'minitest/autorun'

class ParkingLotTest < MiniTest::Unit::TestCase
	ID = '10001'

	def setup
		@sut = ParkingLot.new 10
	end

	def test_given_empty_lot_should_return_total_slot_number_as_availible_slots
		assert_equal(10, @sut.availible_total)
	end

	def test_given_parking_one_car_succeed_should_return_a_card_with_id_same_as_car
		car = Car.new ID

		card = @sut.park car

		assert_equal(ID, card.id)
	end
end
