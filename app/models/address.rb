class Address < ApplicationRecord
  belongs_to   :order

#with_options presence: true do
  #validates :post_cost
  #validates :hipping_area_id
  #validates :city_name
  #validates :address
  #validates :phone_number
#end
end

