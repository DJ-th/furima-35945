FactoryBot.define do
  factory :order_address do
    token              {"tok_abcdefghijk00000000000000000"}
    post_code          {'123-4567'}
    shipping_area_id   {3}
    city_name          {'横浜市'}
    address            {'青山1-1-1'}
    building_name      {'柳ビル203'}
    phone_number       {'08044443333'}
  end
end
