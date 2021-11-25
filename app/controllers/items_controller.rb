class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(prams_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def prams_item
    params.require(:item).permit(:name, :introduction, :genre_id, :image).merge(user_id: current_user.id)
  end
end
