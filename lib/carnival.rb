class Carnival
  attr_reader :event_days, :rides

  def initialize(carnival_details)
    @event_days = carnival_details[:event_days]
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end
end
