# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| burden_method   | string     | null: false                    |
| shipment_source | string     | null: false                    |
| shipping_days   | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_number  | integer    | null: false                    |
| expiry_month | integer    | null: false                    |
| expiry_year  | integer    | null: false                    |
| card_vc      | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_cord | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| building    | string     |                                |
| phone       | integer    | null: false                    |
| order       | references | null: false, foreign_key: true |

### Association

- belongs_to :order