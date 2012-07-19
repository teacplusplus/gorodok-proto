load "#{Rails.root}/lib/sms_gate.rb"
class Booking < ActiveRecord::Base
  belongs_to :parking
  validates_presence_of :telephone, :start_at, :end_at, :code, :status
  def self.build args
    b = Booking.new args
    begin b.code = "gd: #{(0...3).map{97.+(rand(25)).chr}.join}" end while
      Booking.exists? :code => b.code 
    b.price = b.parking.calculate_price(b.start_at, b.end_at)
    b.status = 'new'
    rails "Invalid booking created: #{b.error.inspect}" unless b.valid?
    b
  end
end
