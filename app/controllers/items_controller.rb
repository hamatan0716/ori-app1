class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
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
    redirect_to root_path if (current_user.id != @item.user_id)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params_item)
      redirect_to item_path(@item.id)
    else
      render :edit 
    end
  end

  private
  def params_item
    params.require(:item).permit(:name, :introduction, :genre_id, :image).merge(user_id: current_user.id)
  end
end
