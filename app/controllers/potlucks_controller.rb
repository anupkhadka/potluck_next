class PotlucksController < ApplicationController
  before_action :set_potluck, only: [:show]

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
