# README
## users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | -----------                   |
| Nickname           | string   | null: false                   |
| mail               | string   | null: false,  unique: true    |
| encrypted_password | string   | null: false                   |
| last_name          | string   | null: false                   |
| first_name         | string   | null: false                   |
| last_name_kana     | string   | null: false                   |
| first_name_kana    | string   | null: false                   |
| birthday           | data     | null: false                   |

### Association

- has_many  : items
- has_many  : orders

## items テーブル

| Column                 | Type                | Options                       |
| ------                 | ------              | -----------                   |
| title                  | string              | null: false                   |
| info                   | text                | null: false                   |
| category_id            | integer             | null: false                   |
| product_condition_id   | integer             | null: false                   |
| shipping_cost_id       | integer             | null: false                   |
| shipping_area_id       | integer             | null: false                   |
| scheduled_delivery_id  | integer             | null: false                   |
| price                  | integer             | null: false                   |
| user                   | references          | foreign_key: true| 
### Association

- belongs_to :user
- has_one : order


##　addresses テーブル

| Column          | Type             | Options                                         |
| -------         | ----------       | ------------------------------                  |
| post_code       | string           | null: false                                     |
| shipping_area_id| integer          | null: false                                     |
| city_name       | string           | null: false                                     |
| address         | string           | null: false                                     |
| building_name   | string           |                                                 |
| phone_number    | integer          | null: false                                     |
| order           | references       | foreign_key: true                  |
### Association
- belongs_to   :order

## order テーブル

| Column       | Type             | Options                                         |
| -------      | ----------       | ------------------------------                  |
| user         | references       |  foreign_key: true                              |
| items        | references       |  foreign_key: true                              |

- has_one :address
- belongs_to :item
- belongs_to :user 

