require 'pry'

class Dock

  attr_reader :name, :max_rental_time, :rentals

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rentals = {}
  end

  def rent(boat, renter)
    @rentals[boat] = renter
  end

  def log_hour
    @rentals.each do |rental|
      rental.first.hours_rented += 1
    end
  end

end