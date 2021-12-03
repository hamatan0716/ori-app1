class WantsController < ApplicationController
  def create
    Want.create(user_id: current_user.id, item_id: params[:id])
    redirect_to item_path(params[:id])
  end
  def destroy
    Want.find_by(user_id: current_user.id, item_id: params[:id]).destroy
    redirect_to item_path(params[:id])
  end
end
