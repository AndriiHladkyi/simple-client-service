class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all

    respond_to do |format|
      format.html
      format.json { render json: { address: @cities }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { address: @city }, status: :ok }
    end
  end

  def new
    @city = City.new

    respond_to do |format|
      format.html
      format.json { render json: { address: @city }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: { address: @city }, status: :ok }
    end
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_city
    @city ||= City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:state_id, :name)
  end
end
