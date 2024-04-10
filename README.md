# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null:false               |
| email                 | string | null: false,unique: true |
| password              | string | null: false              |
| password_confirmation | string | null: false              |
| first_name_kanji      | string | null: false              |
| last_name_kanji       | string | null: false              |
| first_name_kana       | string | null: false              |
| last_name_kana        | sting  |null: false               |
| birthday              | date   | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ------------------------------|
| name       | string     | null: false                   |
| image      | string     | null: false                   |
| price      | integer    | null: false                   |
| user       | references | null: false foreign_key: true |
| tax        | boolean    | null false                    |
| text       |            |                               |
| genre      | integer    | null false                    |
| quality    | integer    | null false                    |
| payment    | integer    | null false                    |
| prefecture | integer    | null false                    |
| days       | integer    | null false                    |

### Association

- has_many :comments
- belongs_to :users
- has_one :orders

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      |  text      |                                |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |


### Association

- belongs_to :orders