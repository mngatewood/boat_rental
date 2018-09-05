require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'

class DockTest < Minitest::Test

  # def initialize
  #   dock = Dock.new("The Rowing Dock", 3)
  #   kayak_1 = Boat.new(:kayak, 20)
  #   kayak_2 = Boat.new(:kayak, 20)    
  #   canoe = Boat.new(:canoe, 25)    
  #   sup_1 = Boat.new(:standup_paddle_board, 15)    
  #   sup_2 = Boat.new(:standup_paddle_board, 15)    
  #   patrick = Renter.new("Patrick Star", "4242424242424242")
  #   eugene = Renter.new("Eugene Crabs", "1313131313131313")      
  # end

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_it_has_a_name
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
  end
  
  def test_it_has_a_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal 3, dock.max_rental_time
  end

  def test_it_starts_with_zero_rentals
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal ({}), dock.rentals
  end

  def test_it_can_rent_out_a_boat_to_a_renter
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)    
    canoe = Boat.new(:canoe, 25)    
    sup_1 = Boat.new(:standup_paddle_board, 15)    
    sup_2 = Boat.new(:standup_paddle_board, 15)    
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")      
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    assert_equal ({kayak_1 => patrick, kayak_2 => patrick}), dock.rentals
  end

  def test_it_increments_all_rental_times
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)    
    canoe = Boat.new(:canoe, 25)    
    sup_1 = Boat.new(:standup_paddle_board, 15)    
    sup_2 = Boat.new(:standup_paddle_board, 15)    
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")      
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    hours_rented = dock.rentals.keys.map{|boat|boat.hours_rented}
    assert_equal [0, 0], hours_rented

    dock.log_hour
    dock.rent(canoe, patrick)
    hours_rented = dock.rentals.keys.map{|boat|boat.hours_rented}
    assert_equal [1, 1, 0], hours_rented

    dock.log_hour
    hours_rented = dock.rentals.keys.map{|boat|boat.hours_rented}
    assert_equal [2, 2, 1], hours_rented
  end
  
end

