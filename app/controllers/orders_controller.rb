class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :set_address, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
  end
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
  end
end
  private

  def order_params
    params.require(:order_address).permit(:post_code, :shipping_area_id, :city_name, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                
      )
    end
    def set_order
      @item = Item.find(params[:item_id])
    end

def set_address
  if  current_user.id == @item.user_id || @item.order != nil  # "ログインしているユーザーが出品者と一緒"OR”売却済み”
    redirect_to root_path
  end
end
end
