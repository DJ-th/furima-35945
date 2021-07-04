class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :scheduled_delivery

  
  
  with_options presence: true do
    validates :title 
    validates :info
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_condition_id 
      validates :shipping_cost_id 
      validates :shipping_area_id 
      validates :scheduled_delivery_id
    end
      with_options format: { with: /\A[0-9]+\z/ } do
        validates :price, numericality: { greater_than: 299, less_than: 10000000 } 
      end
    end
 end
