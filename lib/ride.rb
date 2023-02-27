class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
 
  def initialize(ride_info)
    @name = ride_info[:name]
    @min_height = ride_info[:min_height]
    @admission_fee = ride_info[:admission_fee]
    @excitement = ride_info[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def match_preference(visitor)
    visitor.preferences.include?(@excitement)
  end

  def meets_min_height(visitor)
    visitor.tall_enough?(@min_height)
  end

  def charge_visitor_fee(visitor)
    visitor.spending_money -= @admission_fee
    @total_revenue += @admission_fee
  end

  def board_rider(visitor)
    if match_preference(visitor) && meets_min_height(visitor)
      charge_visitor_fee(visitor)
      @rider_log[visitor] += 1
    end
  end
end
