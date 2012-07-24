class ParkingsController < ApplicationController
  # GET /parkings
  # GET /parkings.xml



  def index
    @parkings = Parking.search(params[:search], params[:page], params[:day_start], params[:day_end])
    @json = Parking.all.to_gmaps4rails
    save_params
    respond_with(@parkings)
  end

  # GET /parkings/1
  # GET /parkings/1.xml
  def show
    @parking = Parking.find(params[:id])
    @parkings = Parking.search_near_parking_limit_3(@parking.address, params[:page])
    @json = Parking.all.to_gmaps4rails
    save_params
    respond_with(@parking)  do |format|
      unless params[:new_booking].blank?
        format.js
      end
    end
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
    @search = params[:search]
    @page = params[:page]
    @day_start = params[:day_start]
    @day_end = params[:day_end]
    @day_first = params[:day_first]
    @day_last = params[:day_last]
  end
end
