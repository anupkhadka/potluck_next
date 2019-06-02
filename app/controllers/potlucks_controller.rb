class PotlucksController < ApplicationController
  before_action :set_potluck, only: [:show, :edit, :update, :destroy]

  def index
    @potlucks = Potluck.all
  end

  def new
    @potluck = Potluck.new
  end

  def create
    potluck = Potluck.new(potluck_params)
    potluck.organizer = current_user
    if potluck.valid?
      potluck.save
      redirect_to potlucks_path
    else
      redirect_to new_potluck_path
    end
  end

  def show
  end

  def edit
    if logged_in? && current_user == @potluck.organizer
      render :edit
    else
      redirect_to @potluck
    end
  end

  def update
    @potluck.assign_attributes(potluck_params)
    if @potluck.valid?
      @potluck.save
    end
    redirect_to @potluck
  end

  def destroy
    if logged_in? && current_user == @potluck.organizer
      @potluck.destroy
      redirect_to potlucks_path
    else
      redirect_to potlucks_path
    end
  end

  def data
    render json: Potluck.all
  end


  private

  def set_potluck
    @potluck = Potluck.find_by(id: params[:id])
  end

  def potluck_params
    params.require(:potluck).permit(:name, :date)
  end

end
