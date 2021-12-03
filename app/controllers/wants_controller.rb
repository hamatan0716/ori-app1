class WantsController < ApplicationController
  def create
    Want.create(user_id: current_user.id, post_id: params[:id])
    redirect_to item_path(params[:id])
  end
end
