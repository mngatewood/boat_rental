require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < Minitest::Test

  def test_it_exists
    boat = Boat.new(:kayak, 20)
    assert_instance_of Boat, boat
  end

  def test_it_has_a_type
    boat = Boat.new(:kayak, 20)
    assert_equal :kayak, boat.type
  end

  def test_it_has_a_price_per_hour
    boat = Boat.new(:kayak, 20)
    assert_equal 20, boat.price_per_hour
  end
  
  def test_it_starts_with_zero_hours_rented
    boat = Boat.new(:kayak, 20)
    assert_equal 0, boat.hours_rented
  end

  def test_it_can_add_hours_to_hours_rented
    boat = Boat.new(:kayak, 20)
    assert_equal 1, boat.add_hour
    assert_equal 2, boat.add_hour
    assert_equal 3, boat.add_hour
    assert_equal 3, boat.hours_rented
  end

end