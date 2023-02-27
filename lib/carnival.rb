class Carnival
  attr_reader :name, :event_days, :rides

  def initialize(carnival_details)
    @name = carnival_details[:name]
    @event_days = carnival_details[:event_days]
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def ride_ride(visitor, ride)
    if @rides.include?(ride)
      ride.board_rider(visitor)
      'Weeee'
    else
      'That ride does not exist here'
    end
  end

  def most_popular_ride
    popular_ride = @rides.max_by do |ride|
      ride.rider_log.values.sum
    end
    popular_ride.name
  end
end
