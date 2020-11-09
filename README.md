|                                 | 備考    |
| ------------------------------- | ------- | 
| アプリケーション名              | DCCA(Dog and cat conservation activitiesの略) | 
| アプリケーション概要            | 保護犬、保護猫の飼い主探しが可能 | 
| URL                             | https://dcca.herokuapp.com/ | 
| テスト用アカウント              | mail:test@sample.com, pw:a111111 Basic ID:daiki, pw:2324 | 
| 利用方法                        | ユーザーが保護している犬や猫の写真を投稿し、その投稿に対して別のユーザーからのレスポンスがあればユーザー同士でコミュニケーションを取り、飼手が決まる様にサポートできる | 
| 目指した課題解決                | 殺処分を防ぐ為に犬や猫を保護している人達と保護猫、保護犬を飼いたいという人達を繋げるアプリ | 
| 洗い出した要件           |  
| 優先順位                 | トップページ>保護猫保護犬掲載ページ>保護犬保護猫詳細ページ>保護犬保護猫詳細編集ページ>ユーザー詳細ページ>DMチャットページ | 
| 機能                     | ①ユーザーがアカウントを作成できる機能 ②保護している犬猫を掲載できる機能 ③保護犬保護猫の一覧が確認できる機能 ④保護犬保護猫の詳細が確認できる機能 ⑤保護犬保護猫の詳細を編集できる機能 ⑥ユーザーの詳細が確認できる機能 ⑦コメントができる機能 ⑧いいねができる機能 ⑨DMができる機能 | 
| 目的                     | ①ユーザーがアカウントを作成できる機能 ②保護している犬猫を掲載できる機能 ③保護犬保護猫の一覧が確認できる機能 ④保護犬保護猫の詳細が確認できる機能 ⑤保護犬保護猫の詳細を編集できる機能 ⑥ユーザーの詳細が確認できる機能 ⑦コメントができる機能 ⑧いいねができる機能 ⑨DMができる機能  |
| 詳細                     | ①ユーザーが自身の情報を管理する為 ②ユーザーが保護している犬や猫の情報を掲載できる様にする為 ③ユーザーが掲載した保護犬保護猫を一覧で確認できる様にする為 ④ユーザーが一覧から選択した保護犬や保護猫の詳細な情報を確認できる様にする為 ⑤ユーザーが掲載後も任意のタイミングで詳細情報を変更できる様にする為 ⑥ユーザーの詳細情報を他ユーザーから確認できる様にする為 ⑦ユーザーが気になった掲載に対してコメントできる様にする為 ⑧ユーザーが気になった掲載にいいねボタンを押せる様にする為 ⑨ユーザー同士で直接やり取りできる様にする為 |
| ストーリー(ユースケース) | ユーザーは新規登録でアカウントを作成し、そして次回からは作成したアカウントでログインができる。保護犬保護猫掲載ボタンで掲載予定の保護犬や保護猫の情報を入力し掲載ができる。掲載した情報はトップページで一覧できる。トップページに掲載されている情報をクリックすると詳細ページに遷移し、より詳細な情報を確認できる。掲載したユーザー自身であれば掲載情報の編集が可能。この詳細ページでコメントの入力と送信が可能。そしてコメント一覧を確認できる。更にいいねボタンを押す事もでき、掲載しているユーザーに対してDMもできる。|
| 見積もり(所有時間)       | 1週間 |
| 実装した機能についてのGIFと説明 | ログイン機能:https://gyazo.com/6d8b135439ae9f28223d2e1ea23a3a10, 投稿機能:https://gyazo.com/3efd11e532d85a1c63bd2d2b4a62ae6b, いいね機能:https://gyazo.com666f318b4b4446c5e79cb158dc3b1237, コメント機能:https://gyazo.com/c4506d95dd4aa6354f8777ef2fb7b7b7 | 
| 実装予定の機能                  | 非同期でいいね機能実装,DM機能改良, ユーザー情報編集機能 | 
| データベース設計                | https://gyazo.com/aa3d0e84d7984db102a64dd0cfb70cae    | 
| ローカルでの動作方法            | git clone https://github.com/da-ijb/DCCA.git | 







# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| prefecture_id       | integer | null: false |
| introduction        | text    | null: false |



### Association

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy

## posts テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| kind_id             | integer    | null: false                    |
| gender_id           | integer    | null: false                    |
| description         | text       | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## likes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## entries テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |

### Association

- has_many :entries, dependent: :destroy
- has_many :messages, dependent: :destroy

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room