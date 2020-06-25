# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# sample-market
## usersテーブル
|column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|user_password|string|null: false|
|user_image|string||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
|introduction|text||



### Association
- has_many :products
- has_one :card
- has_one :destination

## itemsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|status|string|null: false|
|judgment|string|null: false|
|size|string|null: false|
|cost|integer|null: false|
|days|string|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :images
- belongs_to :category
- belongs_to :brand

## cardテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_id|integer|null: false|

### Association
- belongs_to :user

## destinationテーブル
|column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building_name|string||
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## imagesテーブル
|column|Type|Options|
|------|----|-------|
|url|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoryテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items

## brandテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items




後々、消す


大史頼んだ

