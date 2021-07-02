class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order(created_at: "DESC")
  end
  def new
   @item = Item.new
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
    #if user_signed_in?
       #if current_user.id == @item.user_id
      #redirect_to root_path
    #else
      #render :edit
    #end
  #end
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to item_path(@item.id)
    else
      render :edit
    end
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
end
