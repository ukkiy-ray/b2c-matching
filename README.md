# README


* Ruby version
2.6.5


# アプリケーション名 / タイトル
- b2c-matching / be ambitious


# アプリケーション概要
- 企業とユーザー双方の登録及びログイン機能（ユーザーはgoogleもしくはfacebookでの登録及びログイン可能）
- ユーザーでログインした場合は企業の情報を閲覧可能
- 企業アカウントでログインした場合はユーザー情報を閲覧可能
- マイページにて自身のアカウント情報の編集機能
- フォロー機能・マッチング機能
- トップページの一覧ページにてフォローをしているか、されているか、マッチングが発生しているかのステータス表示機能
- マッチング発生時相手の詳細ページにてメッセージを送るためのルーム作成機能
- マッチングした相手とのメール形式でのメッセージ送信機能


# URL
heroku、amazon EC2共にbasic認証を設けています。最初に以下のユーザー名とパスワードを入力してからお進みください。

* ID: utsuki
* Pass: 0213

また、SNS認証機能に関しまして、googleは両方対応可、**facebookはherokuのみ**の対応とさせていただいております。
amazon EC2上のアプリケーションにもfacebook認証ボタンがありますが、SSL証明書を取得しておらず通信が暗号化されていないため利用できません。
スムーズな動作確認のためにherokuを推奨とさせていただいております。

## heroku URL
- [heroku](https://b2c-matching.herokuapp.com/)
- **推奨環境** : Google Chrome

### ユーザーログイン（テスト用アカウント）
* Email:yamada@gmail.com
* Password: yamada00

### 法人様ログイン（テスト用アカウント）
* Email: a@gmail.com
* Password: a0a0a0


## amazon EC2 URL
- [amazonEC2](http://ec2-54-168-221-242.ap-northeast-1.compute.amazonaws.com/)

### ユーザーログイン（テスト用アカウント）
* Email: test@gmail.com
* Password: t0e0s0t0

### 法人様ログイン（テスト用アカウント）
* Email: a@gmail.com
* Password: a0a0a0


# 利用方法

[![Image from Gyazo](https://i.gyazo.com/fced74bfd8af1bfaf70844a61aa6dc4a.jpg)](https://gyazo.com/fced74bfd8af1bfaf70844a61aa6dc4a)

1. 最初にヘッダーの右のメニューから新規登録をします。テストアカウントを利用する場合は上記のアカウントでログインをしてください。

2. 新規登録の際には必要事項全てを記入してから登録してください。（画像の投稿含む）

3. ログインするとユーザーもしくは企業の一覧が表示されます。任意のユーザーもしくは企業の画像、名前をクリックし詳細画面へ遷移します。

[![Image from Gyazo](https://i.gyazo.com/ea7736124a8ccf229cd5820c335552a9.jpg)](https://gyazo.com/ea7736124a8ccf229cd5820c335552a9)

[![Image from Gyazo](https://i.gyazo.com/5f469ba4d47ff66da988d306dd3ffeaf.jpg)](https://gyazo.com/5f469ba4d47ff66da988d306dd3ffeaf)

4. 詳細画面を下にドラッグしていくと、フォローボタンもしくはフォロー解除ボタンが表示されます。（マッチングしている場合はチャットへ遷移するボタンも表示されます。） 

5. 「フォローする」ボタンをクリックするとフォローができます。

6. 「フォローを外す」ボタンをクリックするとフォローが外れます。

[![Image from Gyazo](https://i.gyazo.com/6dc8071fe1fc6e5f6ffd6092c1a80086.gif)](https://gyazo.com/6dc8071fe1fc6e5f6ffd6092c1a80086)

7. ページ左上のタイトル「Be ambitious」をクリックすると一覧ページにリダイレクトし、相手のフォロー状態を確認できます。

[![Image from Gyazo](https://i.gyazo.com/5610369667cbd8c98369b91a3fb324fa.jpg)](https://gyazo.com/5610369667cbd8c98369b91a3fb324fa)

8. 相手と「相互フォロー」になった場合、マッチングが発生し、メッセージのやりとりを行えるようになります。

9. マッチングした状態で相手の詳細ページにて下にドラッグしていくとチャット画面へ遷移するボタン（水色）が表示され、クリックするとメッセージ一覧ページへ遷移します。
（双方のメッセージが存在しない場合は表示されているフォームからメッセージを送信することができます。また、1度目のメッセージを送信した後は相手からの返信が来るまで自分からメッセージを送ることができません。）

10. 相手からの返信があった場合、そのメッセージはメッセージ一覧画面の最上部に表示されます。

11. 最新のメッセージ（一番上のメッセージ）をクリックするとメッセージ詳細画面に遷移し、フォームから返信することができます。

[![Image from Gyazo](https://i.gyazo.com/55e188f3bc4fda00f11f2efd4eea50f3.gif)](https://gyazo.com/55e188f3bc4fda00f11f2efd4eea50f3)

12. マイページの情報を編集したいときは、ヘッダー部分の「こんにちは、〇〇さん」の部分をクリックし、マイページに遷移後、下にドラッグし「編集する」ボタンから編集画面に遷移し編集することができます。

[![Image from Gyazo](https://i.gyazo.com/e7d343b0604c0aeccc70449a3c93936e.gif)](https://gyazo.com/e7d343b0604c0aeccc70449a3c93936e)

### 機能確認後は、必ずヘッダー部分の「ログアウト」ボタンからログアウト処理を行っていただくようお願いいたします。

### 本アプリケーションに使用しているサンプル画像について
- ユーザー、法人のプロフィール画像に登録しているサンプル画像及び背景画像は、全て [高画質なフリー画像素材：pixabay](https://pixabay.com/ja/) の画像を使用しています。


#  目指した課題解決
私は、将来クリエイティブな趣味を仕事にしたいと考える若い世代の方々と、これからのエンターテイメント業界を盛り上げるべく有望な人材を求める企業とを、低コストで素早く、且つ双方が納得のいく形でのマッチングを実現し、未来の明るいエンターテイメント業界の振興に貢献するために本アプリケーションを開発いたしました。


# 要件定義

## deviseでの複数モデル登録機能について
### 目的
- 企業とユーザーの登録フォームを実装するため

### 詳細
- deviseでユーザーと企業の会員登録をそれぞれ別のモデルで分けて実装する

### Use Case
- ユーザーはユーザ登録を、企業は法人登録ページから会員登録をさせる。
- ユーザー登録時にはSNS認証で登録できるようにする
- どちらも登録時にプロフィール画像やプロフィール内容を登録しなければならない。

### 見積もり時間
- 3時間

## フォロー機能について
### 目的
- ユーザーは企業を、企業はユーザーをフォローできる

### 詳細
- 相手の詳細ページに行くと、情報を見たあとにフォローボタンがありそこからフォローができる。

### Use Case
- 相手が登録され、一覧に表示されていることが前提
- 一覧から相手の詳細ページに移動後、下のフォローボタンをクリックすると、フォローでき、フォローを外すボタンをクリックするとフォローを外すことができる

### 見積もり時間
- 5時間

## マッチング機能について
### 目的
- ユーザーと企業が相互フォローになるとマッチングを発生させる

### 詳細
- 相手をフォローし、フォローバックを受け相互フォローになるとマッチングを発生させる

### Use Case
- 相手が登録され、一覧に表示されていることが前提
- 「フォローされている」と表示されている相手を詳細ページからフォローするとマッチングが発生する。
- マッチング発生後は、メッセージのやり取りを行うための部屋を作成することができる。

### 見積もり時間
- 3時間

## ユーザー情報編集機能について
### 目的
- 自分のプロフィールを編集する

### 詳細
- ユーザー、企業ともに自分の新規登録時に行ったプロフィールや画像、名前等を編集できるようにする。

### Use Case
- 会員登録が完了し、ログインしていることが前提
- ヘッダーから自分のマイページに移動し、編集するボタンをクリックすると自分の情報を全て編集できる。
- セキュリティ保護のためパスワードも変更可能にする。

### 見積もり時間
- 2時間

## フォローステータス確認機能について
### 目的
- フォロー状態が確認できるようにする

### 詳細
- フォローしている、フォローされている、マッチングしているというそれぞれの状態を一覧に表示させる

### Use Case
- 相手が登録され、一覧に表示されていることが前提
- 一覧ページにて、自分がフォローしている、フォローされている、マッチングしているというそれぞれのステータスを一眼でわかるように実装

### 見積もり時間
- 1時間

## メッセージ送受信機能について
### 目的
- マッチングが発生するとメッセージのやり取りが行えるようにする

### 詳細
- マッチングが発生したらメッセージ確認ページに遷移し、メッセージのやり取りを行えるようにする。

### Use Case
- 相手の誰かとマッチングしていることが前提
- マッチングすると、相手の詳細ページからチャットへ遷移するボタンが表示され、クリックするとメッセージ画面に遷移する
- メッセージが存在しない場合は、表示されているフォームからメッセージを送信し、返信があった場合は一覧表示されているメッセージの最新のメッセージをクリックして返信する。

### 見積もり時間
- 5時間

## SNS認証機能について
### 目的
- ユーザーアカウント登録方法の選択肢を増やす

### 詳細
- SNSアカウント（Googleアカウント、Facebookアカウント）を利用したログイン方法を選択肢として追加する

### Use Case
- ユーザーアカウントの登録方法を「手打ち入力」「Googleアカウントを利用」「Facebookアカウントを利用」の3つから選べるようにする

### 見積もり時間
- 5時間


# 実装予定の機能
- 現状ではマッチング後のメッセージのやり取りが円滑に行えないため、チャット形式で一つの画面で完結し、尚且つ自分のメッセージも確認できるよう変更する予定です。


# DB設計について
- 以下のテーブル設計とER図をもとに実装しました。

[![Image from Gyazo](https://i.gyazo.com/7d8fc741cc82729bbe50eaccdadd1e17.png)](https://gyazo.com/7d8fc741cc82729bbe50eaccdadd1e17)


## users テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| nickname     | string   | null: false |
| phone_number | string   | null: false |
| email        | string   | null: false |
| password     | string   | null: false |
| detail       | text     | null: false |

### Association

- has_many :user_relations, foreign_key: "user_id", dependent: :destroy
- has_many :companies, through: :user_relations, dependent: :destroy
- has_many :company_relations, foreign_key: "user_id"
- has_many :companies, through: :company_relations
- has_many :rooms, dependent: :destroy, foreign_key: "user_id"
- has_many :messages, dependent: :destroy, foreign_key: "user_id"
- has_many :sns_credentials


## companies テーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| company_name         | string   | null: false |
| phone_number         | string   | null: false |
| office_url           | string   | null: false |
| staff_lastname_kana  | string   | null: false |
| staff_firstname_kana | string   | null: false |
| email                | string   | null: false |
| password             | string   | null: false |
| detail               | text     | null: false |

### Association

- has_many :user_relations, foreign_key: "company_id"
- has_many :users, through: :user_relations

- has_many :company_relations, foreign_key: "company_id", dependent: :destroy
- has_many :users, through: :company_relations, dependent: :destroy

- has_many :rooms, dependent: :destroy, foreign_key: "company_id"
- has_many :company_messages, dependent: :destroy, foreign_key: "company_id"


## user_relations テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| company  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :company


## company_relations テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| company  | references | foreign_key: true |
| user     | references | foreign_key: true |

### Association

- belongs_to :company
- belongs_to :user


## rooms テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| company  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :company
- has_many :messages, dependent: :destroy
- has_many :company_messages, dependent: :destroy


## messages テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| content  | text       |                   |
| user     | references | foreign_key: true |
| room     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


## company_messages テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| message  | text       |                   |
| company  | references | foreign_key: true |
| room     | references | foreign_key: true |

### Association

- belongs_to :company
- belongs_to :room


## sns_credentials テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| provider | string     |                   |
| uid      | string     |                   |
| user     | references | foreign_key: true |

### Association

- belongs_to :user, optional: true