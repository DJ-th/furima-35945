class Order < ApplicationRecord
  has_one :address
  belongs_to :item
  belongs_to :user 

  #with_options presence: true do
   #validates :user
   #validates :item
end
