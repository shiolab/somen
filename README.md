Somen
======================
複数のメールアドレスに一斉にメールを送ることができます。  
メール本文にはURLを含むことができ、URLリンクのクリックデータを取得することができます。  
このところ話題の標的型メール訓練に使えます。

環境
----------------
Heroku を使います。  
また、SMTPに Mandrill Add-on を使います。

デプロイ
----------------
1. clone します
```
git clone https://github.com/ozamasa/somen.git
```

2. heroku にログインしプロジェクトを作ります
```
cd somen
heroku login
heroku create somen
```

3. heroku に push します
```
git push heroku master
```

4. db:migrate します
```
heroku run rake db:migrate
```

5. basic認証のためのユーザー名、パスワードを設定します
```
heroku config:set AUTH_USERNAME=hogehoge
heroku config:set AUTH_PASSWORD=fugafuga
```

6. mandrillのユーザー名、APIキーを設定します
```
heroku config:set MANDRILL_USERNAME=xxx@heroku.com
heroku config:set MANDRILL_APIKEY=xxxxxx
```

7. ブラウザで確認できます
```
heroku open
```


ライセンス
----------------
Copyright &copy; 2015 Masaki Ozawa, Shiojiri Open Source Labo.  
This software is released under the MIT License, see LICENSE.
