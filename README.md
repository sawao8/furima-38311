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
- has_one :addresses
- has_many :orders

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| item_image    | string     | null: false                    |
| name          | string     | null: false                    |
| content       | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| price         | string     | null: false                    |
| cost          | string     | null: false                    |
| sender_area   | string     | null: false                    |
| delivery_time | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| post_code     | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to: user

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item