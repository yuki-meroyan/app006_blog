# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|
|mail|string|null: false|


### Association
+ has_many :blogtexts 

## blogtextsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|blogtext_id|reference|null: false, foreign_key: true|

### Association
+ belongs_to :user
+ has_many   :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|blogtext_id|reference|null: false, foreign_key: true|

### Association
+ belongs_to :blogtext