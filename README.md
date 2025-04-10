<a href="https://gyazo.com/a355ef03b27d55743f744cffdbd6f42d"><img src="https://i.gyazo.com/a355ef03b27d55743f744cffdbd6f42d.png" alt="Image from Gyazo"/></a>

## 目次
- [サービス概要](#サービス概要)
- [サービスURL](#サービスurl)
- [サービス開発の背景](#サービス開発の背景)
- [機能紹介](#機能紹介)
- [使用技術](#使用技術)
- [ER図](#er-diagram)
- [画面遷移図](#画面遷移図)
<br>

## 🔖&nbsp;サービス概要
ノンフライヤーで作った料理だけを掲載するアプリです。
これって何度で何分やるんだろう... もっと美味しく作るにはどうしたらいい？ どんなものが作れるの？ そんなお悩みを解決します。
既存のレシピ保存もお任せください！
<br>
<br>

## 🌐&nbsp;サービスurl
https://nonfryer-recipes.com/  

以下のアドレスとパスワードでログインできます。  
Email: test@test  
password: test
<br>
<br>

## 💭&nbsp;サービス開発の背景
ノンフライヤー、ご存知でしょうか？
すごく簡単に説明すると、ごく少量の油を吹き掛けるだけで、揚げ物が手軽にできてしまう調理家電です。

*ノンフライヤーで作られたレシピだけをたくさん見たいのに、特化したサイトが無い！  
下準備までは他のレシピサイトを参照して、揚げ時間と温度は別にメモするのが面倒くさい！  
ノンフライヤーの公式サイトやネットで見つけたレシピでは美味しくできず、研究を重ねて美味しく作れるようになった料理を、皆さんに知ってほしい！*  

そんな思いから、このレシピアプリが生まれました。
沢山のレシピに出会えるワクワクと、レシピ保存の手間を無くした使いやすさ。そんな体験を、ユーザーに届けたいです。
<br>
<br>

## 💡&nbsp;機能紹介
<details><summary>クリックして詳細を見る</summary>

|トップページ|サイドバー|
|--------|-----|
|<a href="https://gyazo.com/3d9cd9589013f26a294d99d97a9089ce"><img src="https://i.gyazo.com/3d9cd9589013f26a294d99d97a9089ce.jpg" alt="Image from Gyazo" width="1440"/></a>登録・ログイン無しでも、公開済みレシピの閲覧ができます。|<a href="https://gyazo.com/fb1f493e05de0c5e00e355cfd54473f1"><img src="https://i.gyazo.com/fb1f493e05de0c5e00e355cfd54473f1.jpg" alt="Image from Gyazo" width="1440"/></a>サイドバーから、各種機能にアクセスできます|

|検索画面|ログインページ|
|-------|-----|
|<a href="https://gyazo.com/bdb9465e7f3fe73d0191fc40d783c929"><img src="https://i.gyazo.com/bdb9465e7f3fe73d0191fc40d783c929.jpg" alt="Image from Gyazo" width="1440"/></a></a>オートコンプリート機能搭載、複数(and)検索可能。|<a href="https://gyazo.com/522043530f1c1d68c4878cadc3d13cce"><img src="https://i.gyazo.com/522043530f1c1d68c4878cadc3d13cce.png" alt="Image from Gyazo" width="763"/></a>Googleログインが可能です。|

|新規登録ページ|プロフィールページ|
|--------|-------|
|<a href="https://gyazo.com/c6e1b219301a147974c07cc921a06eee"><img src="https://i.gyazo.com/c6e1b219301a147974c07cc921a06eee.png" alt="Image from Gyazo" width="698"/></a>|<a href="https://gyazo.com/fc25d3d493fe371223459f26719198e1"><img src="https://i.gyazo.com/fc25d3d493fe371223459f26719198e1.png" alt="Image from Gyazo" width="896"/></a>名前・メールアドレス・パスワードの変更が可能です。メールアドレスとパスワードはメール経由で変更できます。|

|レシピ詳細ページ||
|--------|-------|
|<a href="https://gyazo.com/ac14791887bd3099ec190b056eaab1a3"><img src="https://i.gyazo.com/ac14791887bd3099ec190b056eaab1a3.jpg" alt="Image from Gyazo" width="898"/></a>ログイン後は、レシピタイトル横のタグクリックでレシピの保存ができます。|[![Image from Gyazo](https://i.gyazo.com/1917f424f5e494240612732341e874bb.gif)](https://gyazo.com/1917f424f5e494240612732341e874bb)YouTube, Webサイト, Instagramのurlを保存・閲覧できます。|

|レシピ作成・編集ページ||
|--------|-------|
|[![Image from Gyazo](https://i.gyazo.com/497fd795ed8cb60583079100057e82de.gif)](https://gyazo.com/497fd795ed8cb60583079100057e82de)画像選択時にプレビューが表示されます。|[![Image from Gyazo](https://i.gyazo.com/3dffba5081751f1c23720cab880732cf.gif)](https://gyazo.com/3dffba5081751f1c23720cab880732cf)各入力欄は、動的に追加・削除ができます。|

|お問い合わせフォーム|管理画面|
|--------|-------|
|<a href="https://gyazo.com/07a0e10417ef4d8416fdeb24a2fbf54f"><img src="https://i.gyazo.com/07a0e10417ef4d8416fdeb24a2fbf54f.png" alt="Image from Gyazo" width="944"/></a>|<a href="https://gyazo.com/60cb2b99f769fb52608dbcab2f1e0e7b"><img src="https://i.gyazo.com/60cb2b99f769fb52608dbcab2f1e0e7b.png" alt="Image from Gyazo" width="1440"/></a>id = 1のuserのみ、/adminにアクセスできます。|

</details>
<br>
<br>

## 🔧&nbsp;使用技術
|Category|Technology Stack|
|--------|-------|
|Frontend|tailwindcss 3.4.17<br>Hotwire/turbo-rails 8.0.12|
|Backend|Ruby on Rails7.2<br>Puma 5.0|
|Infrastructure|Render<br>AWS S3 (本番環境)|
|Database|PostgreSQL 14.17|
|Environment setup|Docker|
|CI/CD|GitHub Actions|
|Test|RSpec|
|Design|Figma|
<br>
今回使用した技術スタックは、開発スピードの速さを重視して選びました。<br>

**Frontend**<br>
柔軟性の高いデザインを素早く作成するためにTailwindCSSを採用しています。<br>
また、railsの記述で部分的な更新を実現するためにTurbo-Railsを使用しています。<br>

**Backend**<br>
railsには豊富なgemがあり開発速度を上げられること、そのrailsとの親和性が良いことからpumaを採用しました。<br>

**Database**<br>
デプロイでRenderを選択したこともあり、データベースでは親和性の高いPostgreSQLを使用しました。<br>

**Test**<br>
Rspecでrequest specを中心にテストを実装しており、マージの際にGitHub Actionsで自動化されるように設定しています。  
<br>
<br>

<h2 id="er-diagram">📍ER図</h2>
<a href="https://gyazo.com/cf4f009d2305ea357c2875bc00c31a3a"><img src="https://i.gyazo.com/cf4f009d2305ea357c2875bc00c31a3a.png" alt="Image from Gyazo" width="1276"/></a>
<br>
<br>

## 💫&nbsp;画面遷移図
[Figma](https://www.figma.com/design/c66lXBYjqbEpd0uw35E7g6/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=2-2&p=f&t=OLj8v7DO98dcgs46-0)
<br>
<br>
