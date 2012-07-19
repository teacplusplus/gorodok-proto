require 'spec_helper'

describe "Parker in Booking confirmation process" do
  it "sends confirmation for a given book code" do
    p = Parking.first
    tel = p.telephones.split[0]
    (b = Booking.build(:start_at => DateTime.today_at(11,00), :parking => p,
        :end_at =>  DateTime.today_at(12,00), :telephone => '79153252317')).save;
    post confirm_bookings_path, :mes => b.code, :phone => tel
    SmsGate.sent.last[:telephone].should == tel
    SmsGate.sent.last[:message].should =~ /success/
  end
end
