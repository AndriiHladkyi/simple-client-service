class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  def index
    @phone_numbers = PhoneNumber.all

    respond_to do |format|
      format.html
      format.json { render json: { address: @phone_numbers }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { address: @phone_number }, status: :ok }
    end
  end

  def new
    @phone_number = PhoneNumber.new

    respond_to do |format|
      format.html
      format.json { render json: { address: @client }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: { address: @phone_number }, status: :ok }
    end
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)

    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to @phone_number, notice: 'Phone number was successfully created.' }
        format.json { render :show, status: :created, location: @phone_number }
      else
        format.html { render :new }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to @phone_number, notice: 'Phone number was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone_number }
      else
        format.html { render :edit }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @phone_number.destroy
    respond_to do |format|
      format.html { redirect_to phone_numbers_url, notice: 'Phone number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_phone_number
    @phone_number ||= PhoneNumber.find(params[:id])
  end

  def phone_number_params
    params.require(:phone_number).permit(:client_id, :num, :main)
  end
end
