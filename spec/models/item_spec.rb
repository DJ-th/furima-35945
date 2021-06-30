require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
    it '全部が実行するとき' do
      expect(@item).to be_valid
    end
  end

  context '商品出品ができない時' do
    it 'imageが空では出品できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'titleが空では出品できない' do
    @item.title = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
  end
  it 'infoが空では出品できない' do
    @item.info = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Info can't be blank")
  end
  it 'category_idが空では出品できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
   it 'product_condition_idが空では出品できない' do
    @item.product_condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Product condition can't be blank")
  end
  it 'shipping_cost_idが空では出品できない' do
    @item.shipping_cost_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
  end
  it 'shipping_area_idが空では出品できない' do
    @item.shipping_area_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping area can't be blank")
  end
  it 'scheduled_delivery_idが空では出品できない' do
    @item.scheduled_delivery_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
  end
  it 'idが全部1の時は出品できない' do
    @item.category_id = '1'
    @item.product_condition_id = '1'
    @item.shipping_cost_id = '1'
    @item.shipping_area_id = '1'
    @item.scheduled_delivery_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1", "Product condition must be other than 1", "Shipping cost must be other than 1", "Shipping area must be other than 1", "Scheduled delivery must be other than 1")
  end
  it 'priceが空では出品できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it 'priceが半角文字では出品できない'do
  @item.price = "１０００"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it 'priceが300円よりも少なかったら出品できない'do
  @item.price = "50"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be greater than 300")
  end
  it 'priceが9999999円よりも多かったら出品できない'do
  @item.price = "100000000"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than 9999999")
  end
end
end
end