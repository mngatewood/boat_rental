class Rental

  attr_reader :renter, :boat

  def initialize(renter, boat)
    @renter = renter
    @boat = boat
  end

end