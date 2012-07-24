class BookingsController < ApplicationController
  # POST /confirm
  def confirm
    throw "TEST MESSAGE: #{params.inspect}" if params[:mes] == 'test' 
    puts params.inspect
    return false unless params[:mes] =~ /^gd: / #avoid wasting money

    phone = params[:phone]
    if b = Booking.find(:first, :joins => :parking, :readonly => false,
        :conditions => ["code = ? and telephones like ?", params[:mes], "%#{phone}%"])
      b.status = 'confirmed'
      b.save
      SmsGate.send 'Booking successfully confirmed', phone
      flash[:notice] = 'Booking successfully confirmed'
    else 
      SmsGate.send 'Could not find booking', phone
      flash[:error] = 'Could not find booking'
    end
    redirect_to bookings_path
  end

  # GET /bookings
  # GET /bookings.xml
  def index
    @bookings = Booking.all
    respond_with(@bookings)
  end

  # GET /bookings/1
  # GET /bookings/1.xml
  def show
    @booking = Booking.find(params[:id])
    respond_with(@booking)
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    save_params
    @booking = Booking.new
    @parking = Parking.find(params[:parking_id])
    @booking.parking=@parking;
    respond_with(@booking) do |format|
        format.js
    end
  end

  # POST /bookings
  # POST /bookings.xml
  def create
    save_params
    @booking = Booking.build(params[:booking])
    @booking.save
    redirect_to :back
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # PUT /bookings/1
  # PUT /bookings/1.xml
  def update
    @booking = Booking.find(params[:id])
    @booking.update_attributes(params[:booking])
    respond_with(@booking)
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.xml
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_with(@booking)
  end

  private
  def save_params
    @search = params["search"]
    @page = params["page"]
    @day_start = params["day_start_"]
    @day_end = params["day_end"]
    @day_first = params["day_first"]
    @day_last = params["day_last"]
  end
end
