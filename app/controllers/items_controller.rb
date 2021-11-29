class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    
  end

  private
  def prams_item
    params.require(:item).permit(:name, :introduction, :genre_id, :image).merge(user_id: current_user.id)
  end
end
