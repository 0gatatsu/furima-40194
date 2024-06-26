# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null:false               |
| email                 | string | null: false,unique: true |
| encrypted_password    | string | null: false              |
| first_name_kanji      | string | null: false              |
| last_name_kanji       | string | null: false              |
| first_name_kana       | string | null: false              |
| last_name_kana        | string | null: false              |
| birthday              | date   | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ------------------------------|
| name          | string     | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false foreign_key: true |
| content       | text       | null: false                   |
| genre_id      | integer    | null: false                   |
| quality_id    | integer    | null: false                   |
| payment_id    | integer    | null: false                   |
| prefecture_id | integer    | null: false                   |
| days_id       | integer    | null: false                   |

### Association

- has_many :comments
- belongs_to :user
- has_one :order

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   |  text      | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |


### Association

- belongs_to :order