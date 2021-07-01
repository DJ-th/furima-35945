FactoryBot.define do
  factory :item do
    title                   {Faker::Name.initials}
    info                    {Faker::Lorem.sentence}
    category_id             {3}
    product_condition_id    {3}
    shipping_cost_id        {3}
    shipping_area_id        {3}
    scheduled_delivery_id   {3}
    price                   {2000}  
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end