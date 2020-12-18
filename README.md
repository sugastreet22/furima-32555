## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| identify | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | null   | null: false |
| product  | string | null: false |
| explain  | text   | null: false |
| category | string | null: false |
| delivery | string | null: false |
| price    | string | null: false |
| user_id  | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases



## purchases テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| information   | string | null: false |
| deadline  | string | null: false |
| security   | string | null: false |
| item_id  | references | foreign_key: true |
| user_id  | references | foreign_key: true |

### Association

- belong_to :users
- belong_to :items
- has_one :addresses


## addresses テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal   | string | null: false |
| prefecture  | string | null: false |
| city  | string | null: false |
| block  | string | null: false |
| building  | string | null: false |
| number  | string | null: false |

### Association

- belong_to :purchases



