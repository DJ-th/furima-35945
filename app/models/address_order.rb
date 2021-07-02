class AddressOrder
  include ActiveModel::Model
  attr_accessor :post_cost, :shipping_area_id, :city_name, :address, :building_name, :phone_number, :order, :user, :item

  with_options presence: true do
  validates :post_cost
  validates :shipping_area_id
  validates :city_name
  validates :address
  validates :phone_number
  validates :user
  validates :item
  end
  def save
    address.create(post_cost: post_cost, shipping_area_id: shipping_area_id, city_name: city_name, address: address, building_name: building_name, phone_number: phone_number, order: order, user: user, item: item)
    order.create(user: user, item: item)
  end
end
