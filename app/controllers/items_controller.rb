class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def new
    redirect_to_root_if_not_logged_in
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
    redirect_to_root_if_not_logged_in
  end

  def destroy
    potluck = @item.potluck
    if logged_in? && @item.user == current_user
      # Only the user who created the item can delete the item.
      @item.destroy
    end
    redirect_to potluck
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :potluck_id)
  end

end
