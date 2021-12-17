# アプリケーション名
**Enrich(エンリッチ)**

# アプリケーション概要
生活用品、雑貨、ガジェットなどのミニブログを投稿、共有できるアプリケーション
- ユーザー管理機能(ユーザー登録、ログイン、ログアウト、編集)
- 記事投稿機能
- コメント投稿
- 「欲しい」ボタン

# 本番環境
https://ori-app1-enrich.herokuapp.com/

# 制作背景(意図)
生活用品、ガジェット、雑貨の情報をシェアできるアプリケーションを作成。
個人のブログなどでアイテムを紹介するものなどはあるが、あくまで個人の感想や意見を述べているものが多く、信憑性に少し欠ける気がしていた。
そこでアイテム紹介のミニブログを１つのアプリケーションに投稿できるようにすることで、様々なアイテムの情報を効率的にシェアできるようなアプリを開発したいと考えた。
また、より詳しい人から情報を得ることができるので、ECサイトでは扱ってないようなマイナーなメーカーや、個人で展開している一般的には知られていないアイテムと出会うことができ、生活をより便利に、または楽しくなると考えています。

# DEMO 工夫した点
## TopPage
![19b199ed272d4a65c0e9ad5dd687e411](https://user-images.githubusercontent.com/92015039/146486278-0e97cc37-9fbb-4106-812d-8f749ffa0426.jpeg)
- プログラミングスクールではフロントにあまり触れていなかったので、デザインなどは全体的に苦労しました。目指したものは「シンプルすぎず、ごちゃごちゃしすぎず」です。まだまだ納得できるデザインには到達していないと感じているので、機能面の実装とともに、フロントの実装も拘って手を加えていきたいです。
- レスポンシブに対応できるようにCSSフレームワークも使用しその偉大さを実感しました。

## 新規登録画面
![2c9bf53ca99438d548b21e5327e41af5](https://user-images.githubusercontent.com/92015039/146486480-3eaf1c23-a79a-4e26-859d-71704e159db9.jpeg)
- ユーザー管理機能には「devise」を使用
- プロフィール画像と紹介文は空白でも保存できるようにし、画像については選択した時にプレビューが表示されるような機能の実装を予定しています。
また、画像を空白で登録した場合は、こちらで設定したアイコンが表示されるようにしています。

## 編集画面
<img width="669" alt="01232c9ea46b48d1aa92705581315735" src="https://user-images.githubusercontent.com/92015039/146486665-526a41d0-17b1-4971-8097-5ce0a84bc1a8.png">

- deviseの編集機能はデフォルトで新しいパスワードやカレントパスワードの入力が必須となっていましたが、個人的にこの点はユーザーフレンドリーではないと感じたので、入力しなくても編集できるように設定しました。また、編集後はトップページにリダイレクトするようになっていたので、編集後はマイページにリダイレクトできるようにコーディングし直しました。

## 記事投稿画面
<img width="1199" alt="697788243b33f19ac879918128aff835" src="https://user-images.githubusercontent.com/92015039/146486824-cef153b8-15a9-42f0-9e22-ccfb6307fee2.png">

- ユーザー登録と同様、画像選択時のプレビュー機能を実装予定。
- ジャンル選択には「ActiveHash」を使用。現在、ジャンル選択をしてもそれを活かした機能がないので今後ジャンルで閲覧する記事を絞り込めるようにする予定です。 

## 記事詳細画面
<img width="1398" alt="feb3b31ac631486ecbd93e2cd523b8e8" src="https://user-images.githubusercontent.com/92015039/146487435-97ba005b-a4b5-4d06-9b50-b6b30c6f0de9.png">

- 「欲しいボタン」を実装。１つの記事に対して１度しか押せないようにコーディング、カウントも表示させることで記事に対する評価を一目でわかるようにしました。
- プログラミングスクールのカリキュラムにはない機能の実装でしたが、自分で調べながら理想的としていた非同期通信での機能実装をすることができました。

## コメント投稿
<img width="877" alt="afe12c0f793ee48352439aa659000aea" src="https://user-images.githubusercontent.com/92015039/146487535-8ebc60e0-61d3-4509-82e3-fcdacae3a634.png">

- コメント一覧にはユーザー画像、ユーザー名、投稿日時、コメントが表示されるようにコーディング。投稿日時は日本時間で表示されるように変更しました。
- 今後はActionCableを用いたコメント実装を予定しており、より円滑なコミュニケーションが取れるアプリになるようにしたいと考えてます。



# 使用技術（開発環境）
## バックエンド
Ruby,Ruby on Rails
## フロントエンド
HTML,scss,JavaScript,Ajax,Bootstrap
## データベース
MYSQL
## アプリケーションサーバ（本番環境）
Heroku
## ソース管理
GitHub,GitHubDesktop
## テスト
RSpec
## エディタ
VScode

# 実装予定の機能
- ジャンルからの絞り込み
- 検索機能
- 非同期でのコメント投稿
- エラーメッセージの日本語化
- 画像選択時(ユーザー登録,記事投稿)でのプレビュー機能
- モジュールをもっとおしゃれなデザインに

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
