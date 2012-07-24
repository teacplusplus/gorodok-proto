class ParkingsController < ApplicationController
  # GET /parkings
  # GET /parkings.xml



  def index
    save_params
    @parkings = Parking.search(@search, @page, @day_start, @day_end)
    @json = @parkings.to_gmaps4rails
    respond_with(@parkings) do |format|
      format.js
      format.html
    end
  end

  # GET /parkings/1
  # GET /parkings/1.xml
  def show
    save_params
    @parking = Parking.find(params[:id])
    @parkings = Parking.search_near_parking_limit_3(@parking.address, params[:page])
    @json = @parkings.to_gmaps4rails
    respond_with(@parking)
  end

  # GET /parkings/new
  # GET /parkings/new.xml
  def new
    @parking = Parking.new
    respond_with(@parking)
  end

  # GET /parkings/1/edit
  def edit
    @parking = Parking.find(params[:id])
  end

  # POST /parkings
  # POST /parkings.xml
  def create
    @parking = Parking.new(params[:parking])
    @parking.save
    respond_with(@parking)
  end

  # PUT /parkings/1
  # PUT /parkings/1.xml
  def update
    @parking = Parking.find(params[:id])
    @parking.update_attributes(params[:parking])
    respond_with(@parking)
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.xml
  def destroy
    @parking = Parking.find(params[:id])
    @parking.destroy
    respond_with(@parking)
  end

  private
  def save_params
    @search = params["search"]
    @page = params["page"]
    @day_start = params["day_start_"]
    @day_end = params["day_end_"]
    @day_first = params["day_first"]
    @day_last = params["day_last"]
  end
end
