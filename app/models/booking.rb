load "#{Rails.root}/lib/sms_gate.rb"
class Booking < ActiveRecord::Base
  belongs_to :parking
  validates_presence_of :telephone, :start_at, :end_at, :code, :status
  attr_accessor :terms
  validates_acceptance_of :terms, :accept => "1"
  def self.build(arg)
    b = Booking.new(arg)
    b.status = 'new'
    parking = b.parking;
    b.price = parking.calculate_price(b.start_at,b.end_at)
    a_=b.start_at.to_local unless b.start_at.blank?
    b_=b.end_at.to_local unless b.end_at.blank?

    begin b.code = "gd: #{(0...3).map{97.+(rand(25)).chr}.join}" end while Booking.exists? :code => b.code
    #SmsGate.send %{Code "#{b.code}"
    #  Time: #{a_} - #{b_}}, b.telephone
    #rails "Invalid booking created: #{b.error.inspect}" unless b.valid?
    b
  end
end
