FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"あああ"}
    first_name            {"いいい"}
    last_name_kana        {"アアア"}
    first_name_kana       {"イイイ"}
    birthday              {"1998-10-20"}
  end
end
