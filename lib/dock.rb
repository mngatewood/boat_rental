class Dock

  attr_reader :name, :rental_time

  def initialize(name, rental_time)
    @name = name
    @rental_time = rental_time
  end

end