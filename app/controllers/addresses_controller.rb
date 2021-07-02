class AddressesController < ApplicationController
  def index
  end
  def new
    @address_order = AddressOrder.new
  end
  def create
    @address_order = AddressOrder.new(address_params)
    if @address_order.valid?
      @address_order.save
      redirect_to root_path
    else
      render :new
  end
  private

  def address_params
    params.require(:address_order).permit(:post_cost, :shipping_area_id, :city_name, :address, :building_name, :phone_number, :order)
  end
end
