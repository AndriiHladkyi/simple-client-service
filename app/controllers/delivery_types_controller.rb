class DeliveryTypesController < ApplicationController
  before_action :set_delivery_type, only: [:show, :edit, :update, :destroy]

  def index
    @delivery_types = DeliveryType.all

    respond_to do |format|
      format.html
      format.json { render json: { address: @delivery_types }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { address: @delivery_type }, status: :ok }
    end
  end

  def new
    @delivery_type = DeliveryType.new

    respond_to do |format|
      format.html
      format.json { render json: { address: @delivery_type }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: { address: @delivery_type }, status: :ok }
    end
  end

  def create
    @delivery_type = DeliveryType.new(delivery_type_params)

    respond_to do |format|
      if @delivery_type.save
        format.html { redirect_to @delivery_type, notice: 'Delivery type was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_type }
      else
        format.html { render :new }
        format.json { render json: @delivery_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @delivery_type.update(delivery_type_params)
        format.html { redirect_to @delivery_type, notice: 'Delivery type was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_type }
      else
        format.html { render :edit }
        format.json { render json: @delivery_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @delivery_type.destroy_id_from_clients
    @delivery_type.destroy
    respond_to do |format|
      format.html { redirect_to delivery_types_url, notice: 'Delivery type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_delivery_type
    @delivery_type ||= DeliveryType.find(params[:id])
  end

  def delivery_type_params
    params.require(:delivery_type).permit(:name)
  end
end
