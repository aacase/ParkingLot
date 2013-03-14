require_relative '../src/ParkingLot'

require 'test/unit'

class ParkingLotTest < Test::Unit::TestCase
	ID = '10001'
    Capacity = 10

	def setup
		@sut = ParkingLot.new Capacity
		@car = Car.new ID
	end

	def test_given_empty_lot_should_return_total_slot_number_as_available_slots
		assert_equal(Capacity, @sut.available_total)
	end

	def test_given_parking_one_car_succeed_should_return_a_card_with_id_same_as_car
		@car = Car.new ID

		card = @sut.park! @car

		assert_equal(ID, card.id)
	end

	def test_given_parking_to_parking_lot_has_no_available_slot_should_raise_exception
		sut = ParkingLot.new 1

		sut.park! Car.new('Dont Care')

		assert_raise(ParkingLotException) do
			sut.park! @car
		end
	end

	def test_given_parking_lot_full_should_full_be_true
		sut = ParkingLot.new 0

		assert(sut.full?)
	end
	
	def test_take_a_car_with_a_valid_card_should_return_the_car
		card = @sut.park! @car

		actual = @sut.take! card

		assert_equal(ID, @car.id)
	end

	def test_take_a_car_with_same_card_twice_should_second_take_raise_exception
		card = @sut.park! @car
		@sut.take! card

		assert_raise(ParkingLotException) do
			@sut.take! card
		end
	end
end

