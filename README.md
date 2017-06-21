# README

# DB設計
## 『User』

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



## 『Prototype』

| column    | type        | option         |
|:--------- |:------------|:---------------|
| title     | string      | Not null       |
| concept   | text        |                |
| catch_copy| string      | Not null       |
| user_id   | reference   | foreign key    |

1. belongs_to :user
2. has_many :cupturedImages
3. has_many :likes
4. has_many :comments


##『CapturedImage』

| column       | type        | option         |
|:------------ |:------------|:---------------|
| image        | string      | Not null       |
| prototype_id | reference   | foreign key    |
| user_id      | reference   | foreign key    |

1. belongs_to :prototype


##『Like』

| column        | type        | option         |
|:------------- |:------------|:---------------|
| prototype_id  | int         | foreign key    |
| group_id      | int         | foreign key    |

1. belongs_to :user
2. belongs_to :group


## 『Comment』

| column        | type        | option         |
|:---------     |:------------|:---------------|
| comment       | text        | Not null       |
| prototype_id  | reference   | foreign key    |
| user_id       | reference   | foreign key    |

1. belongs_to :user
2. belongs_to :prototype
