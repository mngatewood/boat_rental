require 'minitest/autorun'
require 'minitest/pride'
require './lib/rental'
require './lib/renter'
require './lib/boat'

class RentalTest < Minitest::Test

  def test_it_exists
    rental = Rental.new("The Rowing Dock", 3)
    assert_instance_of Rental, rental
  end

  def test_it_has_a_renter
    renter = Renter.new("Patrick Star", "4242424242424242")
    boat = Boat.new(:kayak, 20)
    rental = Rental.new(renter, boat)
    assert_equal renter, rental.renter
  end
    
end

