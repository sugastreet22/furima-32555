## users テーブル

| Column              | Type   | Options     |
| --------            | ------ | ----------- |
| name                | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| lastname            | string | null: false |
| firstname           | string | null: false |
| lastnamekana        | string | null: false |
| firstnamekana       | string | null: false |
| date                | string | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column       | Type       | Options           |
| --------     | ------     | -----------       |
| product      | string     | null: false       |
| explain      | text       | null: false       |
| category_id  | integer    | null: false       |
| condition_id | integer    | null: false       |
| burden_id    | integer    | null: false       |
| area_id      | integer    | null: false       |
| day_id       | integer    | null: false       |
| price        | string     | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases



## purchases テーブル

| Column   | Type       | Options           |
| -------- | ------     | -----------       |
| item     | references | foreign_key: true |
| user     | references | foreign_key: true |

### Association

- belong_to :users
- belong_to :items
- has_one :addresses


## addresses テーブル

| Column        | Type       | Options           |
| --------      | ------     | -----------       |
| postal        | string     | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| block         | string     | null: false       |
| building      | string     |                   |
| number        | string     | null: false       |
| purchase      | references | foreign_key: true |
### Association

- belong_to :purchases



