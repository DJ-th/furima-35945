class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_mino, only: [:edit, :update, :destroy]
  def index
    @items = Item.order(created_at: "DESC")
  end
  def new
   @item = Item.new
  end
  def show
  end
  def edit

  end
  def update
    if @item.update(item_params)
        redirect_to item_path(@item.id)
        else
        render :edit
     end
  end
  def destroy
      @item.destroy
      redirect_to root_path
  end
  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
    else
      render :new
  end
end
private
def item_params
  params.require(:item).permit(:title, :info, :category_id, :product_condition_id, :shipping_cost_id, :shipping_area_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
end
def set_item
  @item = Item.find(params[:id])
end

def set_mino
  redirect_to root_path if  current_user.id != @item.user_id || @item.order != nil
end
end
