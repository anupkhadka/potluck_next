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
    potluck.save
    redirect_to potlucks_path
  end

  def show
  end

  def data
  end


  private

  def set_potluck
    @potluck = Potluck.find_by(id: params[:id])
  end

  def potluck_params
    params.require(:potluck).permit(:name, :date)
  end

end
