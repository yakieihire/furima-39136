# テーブル設計

## users テーブル

| Column             | Type   | Options                 | 
| ------------------ | ------ | ----------------------- | 
| nickname           | string | null:false              | 
| email              | string | null:false,unique: true | 
| encrypted_password | string | null:false              | 
| first_name         | string | null:false              | 
| last_name          | string | null:false              | 
| first_name_kana    | string | null:false              | 
| last_name_kana     | string | null:false              | 
| birthday           | date   | null:false              | 

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column            | Type       | Options                       | 
| ----------------- | ---------- | ----------------------------- | 
| item_name         | string     | null:false                    | 
| description       | text       | null:false                    | 
| category_id       | integer    | null:false                    | 
| situation_id      | integer    | null:false                    | 
| shipping_payer_id | integer    | null:false                    | 
| prefecture_id     | integer    | null:false                    | 
| shipping_day_id   | integer    | null:false                    | 
| price             | integer    | null:false                    | 
| user              | references | null:false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :purchase_records

##  purchase_record テーブル

| Column | Type       | Options                       | 
| ------ | ---------- | ----------------------------- | 
| user   | references | null:false, foreign_key: true | 
| item   | references | null:false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

##  shipping_address テーブル

| Column           | Type       | Options                      | 
| ---------------- | ---------- | ---------------------------- | 
| post_code        | string     | null:false                   | 
| prefecture_id    | integer    | null:false                   | 
| municipality     | string     | null:false                   | 
| address          | string     | null:false                   | 
| building_name    | string     |                              | 
| telephone_number | string     | null:false                   | 
| purchase_record  | references | null:false,foreign_key: true | 

### Association
- belongs_to :purchase_record
