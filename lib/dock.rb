require 'pry'

class Dock

  attr_reader :name, :max_rental_time, :rentals, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rentals = {}
    @revenue = 0
  end

  def rent(boat, renter)
    @rentals[boat] = renter
  end

  def log_hour
    @rentals.each do |rental|
      rental.first.hours_rented < 3 && rental.first.hours_rented += 1
    end
  end

  def return(boat)
    return_rental = @rentals.keys.find{|rental|rental == boat}
    return_revenue = return_rental.hours_rented * return_rental.price_per_hour
    @revenue += return_revenue
    @rentals.delete(boat)
  end

end