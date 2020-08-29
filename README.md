# Nagano cake
***
⻑野県にある⼩さな洋菓⼦店「ながのCAKE」の商品を通販するためのECサイト。
元々近隣住⺠が顧客だったが、昨年始めたInstagramから⼈気となり、全国から注⽂が来る
ようになった。
InstagramのDMやメールで通販の注⽂を受けていたが、情報管理が煩雑になってきたた
め、管理機能を含んだ通販サイトを開設しようと思い⾄った。

# 通販について
***
● 通販では注⽂に応じて製作する受注⽣産型としている。  
● 現在通販での注⽂量は⼗分に対応可能な量のため、1⽇の受注量に制限は設けない。  
● 送料は1配送につき全国⼀律800円。  
● 友⼈や家族へのプレゼントなど、注⽂者の住所以外にも商品を発送できる。  
● ⽀払⽅法はクレジットカード、銀⾏振込から選択できる。

# 機能一覧
***
## 顧客側機能  
***
● 顧客は会員登録、ログイン・ログアウト、退会ができます  
● 会員のログインはメールアドレスとパスワードで⾏えます  
● 会員がログインしている場合、ヘッダーにユーザー名が表示されます
● サイトの閲覧はログインなしで⾏えます  
● 商品をカートに⼊れ、1度に複数種類、複数商品の購⼊ができ、カート
内の商品は個数変更・削除ができます  
● 会員はマイページからユーザ情報の閲覧・編集、注⽂履歴の閲覧、配送先の閲覧・
編集ができます  
● 注⽂履歴⼀覧には下記の情報が表⽰されます  
&emsp; &emsp; ○ 注⽂⽇  
&emsp; &emsp; ○ 配送先    
&emsp; &emsp; ○ ⽀払⾦額（商品合計＋送料）  
&emsp; &emsp; ○ 注⽂ステータス  
● 注⽂履歴詳細には下記の情報が表⽰されます  
&emsp; &emsp; ○ 注⽂⽇  
&emsp; &emsp; ○ 配送先  
&emsp; &emsp; ○ ⽀払⽅法  
&emsp; &emsp; ○ 注⽂ステータス  
&emsp; &emsp; ○ 商品の注⽂内容詳細（商品名、単価、個数、⼩計）  
&emsp; &emsp; ○ 請求情報（商品合計、送料、⽀払⾦額）  
● 会員登録時、下記の情報をユーザ情報として⼊⼒します  
&emsp; &emsp; ○ 名前（姓・名）  
&emsp; &emsp; ○ 名前（カナ姓・カナ名）  
&emsp; &emsp; ○ 郵便番号  
&emsp; &emsp; ○ 住所  
&emsp; &emsp; ○ 電話番号  
&emsp; &emsp; ○ メールアドレス   
&emsp; &emsp; ○ パスワード  


## 管理者側機能
***
● 管理者⽤メールアドレスとパスワードでログインできます  
● 商品の新規追加、編集、販売停⽌（売切表⽰）が⾏えます  
● 商品情報は下記のものを持ちます    
&emsp; &emsp; ○ 商品名  
&emsp; &emsp; ○ 商品説明⽂  
&emsp; &emsp; ○ ジャンル  
&emsp; &emsp; ○ 税抜価格  
&emsp; &emsp; ○ 商品画像  
&emsp; &emsp; ○ 販売ステータス  
● 会員登録されているユーザ情報の閲覧、編集、退会処理が⾏えます  
● ユーザの注⽂履歴が⼀覧・詳細表⽰できます  
● 注⽂履歴には注⽂ごとに下記の情報が表⽰されます  
&emsp; &emsp; ○ 購⼊者  
&emsp; &emsp; ○ 購⼊⽇  
&emsp; &emsp; ○ 購⼊内容  
&emsp; &emsp; ○ 請求額合計  
&emsp; &emsp; ○ 配送先  
&emsp; &emsp; ○ 注⽂ステータス  
&emsp; &emsp; ○ 各注⽂商品の製作ステータス  
● 注⽂ステータス、製作ステータスの更新ができます   
● 商品ジャンルには「有効」「無効」を設定でき、無効に設定したジャンル  
は、ジャンル⼀覧に表⽰されません。また、無効になっているジャンルに紐付く  
商品は表⽰されません  

# 使用方法
## インストール方法
***
$ git clone git@github.com:webcamp-pro-tryn/nagano-cake.git  
$ cd nagano-cake  
$ bundle install  
$ rails db:migrate  
$ rails db:seed  
$ rails s -b 0.0.0.0  

## ゲストログイン
***
【管理者用アカウント：ログイン】  
&emsp; メールアドレス：test@test   
&emsp; パスワード：testtest

【顧客用アカウント：ログイン】  
&emsp; メールアドレス：test@test  
&emsp; パスワード：testtest

# 使用言語
・HTML&CSS  
・Ruby  
・JavaScript  
・フレームワーク  
・Ruby on Rails (5.2.4)  

# Gem
・ devise  
・ refile", require: "refile/rails", github: 'manfe/refile  
・ refile-mini_magick  
・ bootstrap-sass  
・ jquery-rails  
・ enum_help  
・ rails-i18n  
・ ransack  
・ kaminari  
・ font-awesome-sass  
・ rubocop-airbnb  

# 作成者
### チーム名[tryn]
&emsp; ・待山 直 （ https://github.com/fishmilk0313 ）  
&emsp; ・椿 優香 （ https://github.com/icdeuty ）  
&emsp; ・舘野 僚太（ https://github.com/Ryota-1 ）  
&emsp; ・遠藤 拓海 （ https://github.com/t-endo-hub ）
