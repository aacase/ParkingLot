require_relative '../src/ParkingLot'

require 'test/unit'

class Valet
	def assign_parking_lot(lot)
		@parking_lot = lot
	end

	def park!(car)
		@parking_lot.park!(car)
	end
end

class ValetTest < Test::Unit::TestCase

	LotCapacity = 10
	ID = '1000001'

	def setup
		@parking_lot = ParkingLot.new LotCapacity
		@valet = Valet.new
		@valet.assign_parking_lot @parking_lot
		@car = Car.new ID
	end

	def test_given_valet_when_park_a_car_then_corrent_card_returns
		card = @valet.park! @car
		assert_equal(ID, card.id)
	end

end

