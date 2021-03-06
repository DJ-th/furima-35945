class OrderAddress
  include ActiveModel::Model
  attr_accessor :token,:post_code, :shipping_area_id, :city_name, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
   with_options format: { with: /\A\d{3}[-]\d{4}\z/} do
  validates :post_code
    end
  validates :token
  with_options numericality: { other_than: 1 } do
  validates :shipping_area_id
  end
  validates :city_name
  validates :address
  with_options format: { with: /\A\d{10,11}\z/} do
  validates :phone_number
  end
  validates :user_id
  validates :item_id
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, city_name: city_name, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
