class PhilosophersController < ApplicationController
  before_action :set_philosopher, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show]

  # GET /philosophers or /philosophers.json
  def index
    @philosophers = Philosopher.all
  end

  # GET /philosophers/1 or /philosophers/1.json
  def show
  end

  # GET /philosophers/new
  def new
    #@philosopher = Philosopher.new
     @philosopher = current_user.philosophers.build
  end

  # GET /philosophers/1/edit
  def edit
  end

  # POST /philosophers or /philosophers.json
  def create
    #@philosopher = Philosopher.new(philosopher_params)
    @philosopher = current_user.philosophers.build(philosopher_params)

    respond_to do |format|
      if @philosopher.save
        format.html { redirect_to philosopher_url(@philosopher), notice: "Philosopher was successfully created." }
        format.json { render :show, status: :created, location: @philosopher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @philosopher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /philosophers/1 or /philosophers/1.json
  def update
    respond_to do |format|
      if @philosopher.update(philosopher_params)
        format.html { redirect_to philosopher_url(@philosopher), notice: "Philosopher was successfully updated." }
        format.json { render :show, status: :ok, location: @philosopher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @philosopher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /philosophers/1 or /philosophers/1.json
  def destroy
    @philosopher.destroy

    respond_to do |format|
      format.html { redirect_to philosophers_url, notice: "Philosopher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @philosopher = current_user.philosophers.find_by(id: params[:id])
    redirect_to philosophers_path, notice:"Not Authorized to Edit this Philosopher" if @philosopher.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_philosopher
      @philosopher = Philosopher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def philosopher_params
      params.require(:philosopher).permit(:first_name, :last_name, :school, :nation, :best_work, :user_id)
    end
end
