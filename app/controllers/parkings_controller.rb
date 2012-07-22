class ParkingsController < ApplicationController
  # GET /parkings
  # GET /parkings.xml
  def index
    @parkings = Parking.search(params[:search], params[:page], params[:day_start], params[:day_end])
    @json = Parking.all.to_gmaps4rails
    respond_with(@parkings)
  end

  # GET /parkings/1
  # GET /parkings/1.xml
  def show
    @parking = Parking.find(params[:id])
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
end
