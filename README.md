# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true, index: true|
|email|string|null: false|


### Association
+ has_many :blogtexts
+ has_many :comments 

## blogtextsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association
+ belongs_to :user
+ has_many   :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|user_id|reference|null: false, foreign_key: true|
|blogtext_id|reference|null: false, foreign_key: true|

### Association
+ belongs_to :user
+ belongs_to :blogtext