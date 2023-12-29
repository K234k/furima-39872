## データベース設計

### usersテーブル（ユーザー情報）

| Column            | Type    | Options     |
|-------------------|---------|-------------|
| nickname          | string  | null: false |
| email             | string  | null: false |
| encrypted_password| string  | null: false |
| last_name         | string  | null: false |
| first_name        | string  | null: false |
| last_name_kana    | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday          | date    | null: false |

### Association
 has_many :items
 has_many :orders

### itemsテーブル（商品情報）

| Column                   | Type    | Options     |
|--------------------------|---------|-------------|
| name                     | string  | null: false |
| description              | text    | null: false |
| category_id              | integer | null: false |
| item_status_id           | integer | null: false |
| shipping_cost_id         | integer | null: false |
| prefecture_id            | integer | null: false |
| shipping_date_id         | integer | null: false |
| price                    | integer | null: false |

### Association
 belongs_to :user
 has_one :order
 has_many :comments

### orders

| Column | Type       | Options     |
|--------|------------|-------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 belongs_to :item
 has_one :address

## addresses

| Column         | Type    | Options     |
|----------------|---------|-------------|
| postal_code    | string  | null: false |
| prefecture_id  | integer | null: false |
| city_name      | string  | null: false |
| block_name     | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |
| order          | references | null: false, foreign_key: true |

### Association
 belongs_to :order