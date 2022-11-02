## usersテーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| last_name         | string | null: false               |
| first_name        | string | null: false               |
| last_name_kana    | string | null: false               |
| first_name_kana   | string | null: false               |
| birth_day         | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ | 
| name             | string     | null: false                    |
| item_content     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| price            | integer    | null: false                    |
| cost_id          | integer    | null: false                    |
| sender_area_id   | integer    | null: false                    |
| delivery_time_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## addressesテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ | 
| post_code_id     | string      | null: false                    |
| sender_area_id   | integer     | null: false                    |
| city             | string      | null: false                    |
| address          | string      | null: false                    |
| building_name    | string      |                                |
| phone_number     | string      | null: false                    |
| order            | references  | null: false, foreign_key: true |

### Association

- belongs_to :order

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


