# アプリケーション名
** Enrich(エンリッチ) **

# アプリケーション概要
- ユーザー管理機能
- 記事投稿機能
- コメント機能

# URL
https://ori-app1-enrich.herokuapp.com/

# 利用方法
ユーザー登録することで記事の投稿ができる。

# 目指した課題解決
生活用品や、雑貨、ガジェットなどを好きな人がより詳しい人から情報を得ることができる。
ECサイトでは扱ってないような、未だマイナーなメーカーや、個人で展開している一般的には知られていないが、いい商品と出会うことができる。

# 実装予定の機能
- コメント機能
- 「欲しい」ボタン
- ジャンルからの絞り込み
- 検索機能
- マイページ（ユーザー詳細ページ）

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   |             |

### Association
- has_many :items
- has_many :comments
- has_many :wants

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| genre_id           | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :wants

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | string     | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## wants テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
