class WantsController < ApplicationController
  before_action :item_params
  def create
    Want.create(user_id: current_user.id, item_id: params[:id])
  end
  def destroy
    Want.find_by(user_id: current_user.id, item_id: params[:id]).destroy
  end

  private

  def item_params
    @item = Item.find(params[:id])
  end
end
