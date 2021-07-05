class OrdersController < ApplicationController
  def index
    #@order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id && @item.order 
      @order_address = OrderAddress.new
    else
      redirect_to root_path
    end
  end
  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
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
    params.require(:order_address).permit(:post_code, :shipping_area_id, :city_name, :address, :building_name, :phone_number, :order).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                
      )
    end
end
