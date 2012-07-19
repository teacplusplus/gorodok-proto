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
    @booking = Booking.new
    respond_with(@booking)
  end

  # POST /bookings
  # POST /bookings.xml
  def create
    @booking = Booking.build(params[:booking])
    SmsGate.send %{Code "#{@booking.code}"
Time: #{@booking.start_at.to_local} - #{@booking.end_at.to_local}}, @booking.telephone
    @booking.save
    respond_with(@booking)
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
end
