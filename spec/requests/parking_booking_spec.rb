require 'spec_helper'

describe "User in Booking process" do
  it "books a parking" do
    visit parking_path(Parking.first)
    click_link "Book"
    fill_in "Start at", :with => (s = DateTime.now.to_local)
    fill_in "End at", :with => (e = (DateTime.now + 2.hours).to_local)
    fill_in "Telephone", :with => "79153252317"
    click_button "Create Booking"
    Booking.last.telephone.should == "79153252317"
    Booking.last.start_at.to_local.should == s
    Booking.last.end_at.to_local.should == e
    Booking.last.price.should == Parking.first.price_per_hour * 2
    Booking.last.status.should == "new"
    SmsGate.sent.last[:telephone].should == "79153252317"
  end
end
