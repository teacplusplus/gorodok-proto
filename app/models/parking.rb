class Parking < ActiveRecord::Base
  geocoded_by :address
  acts_as_gmappable

  def gmaps4rails_address
    "#{self.street}, #{self.city}, #{self.country}"
  end

  after_validation :geocode, :if => :address_changed?
  def calculate_price from, to
    return nil if from.hour < day_start || to.hour >= day_end
    return price_per_hour * DateTime.total_hours(from, to); 
  end

  def self.search(search, page, day_start, day_end)

    str_con=[];


    str_con<<'day_start >= ?'  unless day_start.blank?

    str_con<<'day_end >= ?' unless day_end.blank?

    con=[]

    con<<str_con.join(' AND ');

    con<<"%#{day_start}"  unless day_start.blank?

    con<<"%#{day_end}" unless day_start.blank?


    if search.blank?
      paginate :per_page => 5, :page => page,
               :conditions => con,
               :order => 'name'
    else

      parking_near_list = near(search, 50, :order => :distance)
      parking_near_list.paginate :per_page => 5, :page => page,
                                 :conditions => con,
                                 :order => 'name'

    end
  end

  def self.search_near_parking_limit_3(search,page)

    parking_near_list = near(search, 50, :order => :distance)
    parking_near_list.paginate :per_page => 3, :page => page,
                                :order => 'name'
  end
end
