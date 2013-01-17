require_relative '../src/ParkingLot'

require 'minitest/autorun'

class ParkingLotTest < MiniTest::Unit::TestCase
	def setup
		@sut = ParkingLot.new 10
	end

	def test_given_empty_lot_should_return_total_slot_number_as_empty_slots
		assert_equal(10, @sut.availible_total)
	end
end
