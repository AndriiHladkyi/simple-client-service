class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :current_user?, only: [:show, :edit, :update, :destroy]
  before_action :set_delivery_types, :set_organizations, only: [:edit, :new, :update]

  def index
    @clients = Client.user_clients(current_user.id)

    respond_to do |format|
      format.html
      format.json { render json: { address: @clients }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { address: @client }, status: :ok }
    end
  end

  def new
    @client = Client.new

    respond_to do |format|
      format.html
      format.json { render json: { address: @client }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: { address: @client }, status: :ok }
    end
  end

  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_delivery_types
    @delivery_types ||= DeliveryType.all
  end

  def set_organizations
    @organizations ||= Organization.all
  end

  def set_client
    @client ||= Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:organization_id, :delivery_type_id, :first_name, :last_name, :email, 
                                    phone_numbers_attributes: [:_destroy, :id, :num, :main],
                                    addresses_attributes: [:_destroy, :id, :zip, :street, :building, :apartment, :comment, :main, :city_id])
  end

  def current_user?
    redirect_to root_path, status: 401 unless (@client.user_id == current_user.id)
  end
end
