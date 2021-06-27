# README
## users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | -----------                   |
| Nickname           | string   | null: false                   |
| mail               | string   | null: false                   |
| password 　　　　　　| string   | null: false                   |
| last_name          | string   | null: false                   |
| first_name         | string   | null: false                   |
| last_name_kana     | string   | null: false                   |
| first_name_kana    | string   | null: false                   |
| birthday           | reference| null: false, foreign_key: true|

### Association

- has_many  : items
- has_many  : orders

## items テーブル

| Column              | Type                | Options                       |
| ------              | ------              | -----------                   |
| title               | string              | null: false                   |
| text                | text                | null: false                   |
| category            | references          | null: false  foreign_key: true|
| product_condition   | references          | null: false  foreign_key: true|
| shipping_cost       | references          | null: false  foreign_key: true|
| shipping_area       | references          | null: false  foreign_key: true|
| scheduled_delivery  | references          | null: false, foreign_key: true|
| price               | integer             | null: false                   |
| user                |references           | null: false, foreign_key: true| 
### Association

- belongs_to :user
- has_one : order


##　addresses テーブル

| Column       | Type             | Options                                         |
| -------      | ----------       | ------------------------------                  |
| post_code    | string           | null: false                                     |
| shipping_area| references       | null: false, foreign_key: true                  |
| city_name    | string           | null: false                                     |
| address      | string           | null: false                                     |
| building_name| string           | null: false                                     |
| phone_number | integer          | null: false                                     |
### Association

- has_one    :order

## order テーブル

| Column       | Type             | Options                                         |
| -------      | ----------       | ------------------------------                  |
| users        | references       | null: false, foreign_key: true                  |
| items        | references       | null: false, foreign_key: true                  |

- belongs_to :address
- belongs_to :item
- belongs_to :user
