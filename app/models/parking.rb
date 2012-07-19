class Parking < ActiveRecord::Base
  geocoded_by :address
  def calculate_price from, to
    return nil if from.hour < day_start || to.hour >= day_end
    return price_per_hour * DateTime.total_hours(from, to); 
  end
end
