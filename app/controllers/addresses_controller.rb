class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all

    respond_to do |format|
      format.html
      format.json { render json: { addresses: @addresses }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { address: @address }, status: :ok }
    end
  end

  def new
    @address = Address.new

    respond_to do |format|
      format.html
      format.json { render json: { addresses: @address }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: { address: @address }, status: :ok }
    end
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def set_address
    @address ||= Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:city_id, :client_id, :zip, :street, :building, :apartment, :comment, :main)
  end
end
