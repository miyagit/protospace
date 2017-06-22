# README

# DB設計
## 『users』

| column   | type        | option         |
|:---------|:------------|:---------------|
| name     | string      | Not null       |
| title    | text        |                |
| job      | string      |                |
| profile  | text        |                |
| avatar   | string      |                |

1. has_many :prototypes
2. has_many :likes
3. has_many :comments



## 『prototypes』

| column    | type        | option            |
|:--------- |:------------|:----------------- |
| title     | string      | Not null          |
| concept   | text        |                   |
| catch_copy| string      | Not null          |
| user_id   | reference   | foreign key, index|

1. belongs_to :user
2. has_many :images
3. has_many :likes
4. has_many :comments


##『images』

| column       | type        | option               |
|:------------ |:------------|:---------------------|
| image        | string      | Not null, index      |
| prototype_id | reference   | foreign key,index    |
| user_id      | reference   | foreign key          |

1. belongs_to :prototype


##『likes』

| column        | type        | option           |
|:------------- |:------------|:-----------------|
| prototype_id  | int         | foreign key,index|
| group_id      | int         | foreign key,index|

1. belongs_to :user
2. belongs_to :group


## 『comments』

| column        | type        | option           |
|:---------     |:------------|:-----------------|
| comment       | text        | Not null         |
| prototype_id  | reference   | foreign key,index|
| user_id       | reference   | foreign key,index|

1. belongs_to :user
2. belongs_to :prototype
