class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  def index
    @states = State.all

    respond_to do |format|
      format.html
      format.json { render json: { address: @states }, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { address: @state }, status: :ok }
    end
  end

  def new
    @state = State.new

    respond_to do |format|
      format.html
      format.json { render json: { address: @state }, status: :ok }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: { address: @state }, status: :ok }
    end
  end

  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to @state, notice: 'State was successfully updated.' }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: 'State was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_state
    @state ||= State.find(params[:id])
  end

  def state_params
    params.require(:state).permit(:country_id, :name)
  end
end
