require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  

  describe '購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.3
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end
    context '購入できる時' do
      it '全ての項目が存在すれば購入できる' do
        expect(@order_address).to be_valid
    end
    it '建物名も空でも購入できる'do
    @order_address.building_name = ''
    expect(@order_address).to be_valid
  end
  end
    context '購入できない時' do
    it 'Userが紐付いていないと登録できない' do
      @order_address.user_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'Itemが紐づいていないと登録できない' do
      @order_address.item_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  it 'tokenが空だと購入できない' do
    @order_address.token = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
  it 'post_codeが空だと購入できない' do
    @order_address.post_code = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Post code can't be blank")
  end
  it 'post_codeがハイフンないと購入できない' do
    @order_address.post_code = '1234567'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Post code is invalid")
  end
  it 'post_codeが8桁では購入できない' do
    @order_address.post_code = '12345678'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Post code is invalid")
  end
  it 'shipping_area_idで--を選択すると購入できない' do
    @order_address.shipping_area_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Shipping area must be other than 1")
  end
  it 'city_nameが空では購入できない' do
    @order_address.city_name = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City name can't be blank")
  end
  it 'addressが空では購入できない' do
    @order_address.address = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address can't be blank")
  end
  it 'phone_numberが空では購入できない' do
    @order_address.phone_number = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberが11桁ないと購入できない' do
    @order_address.phone_number = '080123456789'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it '全角数字だと登録できないこと' do
    @order_address.phone_number = '０８０４４４４２２２２'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it '数字のみでないと登録できないこと（英数字混合）' do
    @order_address.phone_number = '０８０４４４４aaaa'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it '数字のみでないと登録できないこと（ハイフンあり）' do
    @order_address.phone_number = '080-4444-3333'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
    end
  end
end
