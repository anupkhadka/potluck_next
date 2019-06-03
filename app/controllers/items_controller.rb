class ItemsController < ApplicationController

  before_action :set_item, only: [:show]

  def new
    @potluck = Potluck.find_by(id: params[:potluck_id])
    @item = @potluck.items.build
  end

  def create
    potluck = Potluck.find_by(id: params[:potluck_id])
    item = potluck.items.build(item_params)
    item.user = current_user
    item.save
    redirect_to potluck
  end

  def show
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :potluck_id)
  end

end
