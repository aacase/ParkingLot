class ParkingLotException < Exception
	def initialize message
		@message = message
	end

	attr_reader :message
end
