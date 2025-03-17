[![Image from Gyazo](https://i.gyazo.com/6bdec0957b6836623771b1acbff5562f.png)](https://gyazo.com/6bdec0957b6836623771b1acbff5562f)

### サービス概要
ノンフライヤーで作った料理だけを掲載するアプリです。<br>
これって何度で何分やるんだろう... もっと美味しく作るにはどうしたらいい？ どんなものが作れるの？ そんなお悩みを解決します。<br>
既存のレシピ保存もお任せください。

### サービスのurl
https://nonfryer-recipes.com/

### このサービスへの思い・作りたい理由
購入したノンフライヤーの公式レシピやネットで見つけたレシピ通りでは上手にできず、研究を重ねて美味しく作れるようになった料理がいくつかある。使い方にコツがいるので、ノンフライヤーを使いこなせない人々に知ってほしいと思った。<br>
また、下準備までは他のレシピを参照し、揚げ時間と温度だけメモに残すのが手間に感じてきた。<br>
そこで、ノンフライヤーを使用する際のコツや設定(温度,時間)をまとめたアプリを制作しようと思った。

### ユーザー層について
メインユーザーは料理をする社会人。<br>
その中でも、ノンフライヤーが気になっている人・現役で使っている人・買ったけれど閉まっている人に使ってほしい。<br>
通常のレシピでは揚げる温度や時間が表記されていないので、調理法を考えて研究するのが手間だと思う。その手間が無ければ、ノンフライヤーを使う人や機会が増えて、有益なレシピが増える。また、既に色々なレシピを見つけている人は、それを簡単に保存できる媒体があると便利に管理ができる。<br>
一人暮らしの学生や高年期の人々も料理はすると思うが、キッチンのスペースを取ってわざわざ揚げ物をしようという人が少なそうなため、20~50代の男女をターゲットとする。

### サービスの利用イメージ
ノンフライヤーを用いたレシピの検索・閲覧・投稿をすることによって、レシピを簡単に管理し、手軽で美味しい料理が作れるようになる。

### ユーザーの獲得について
ほとんどがスマートフォンを使用している世代だと思うので、アプリに掲載しているレシピをInstagramなどのSNSでも発信し、アプリ使用への導線を作る。<br>
会員登録をしなくても誰でもレシピを閲覧できるようにして、アプリ使用へのハードルを下げる。<br>
「ノンフライヤー　唐揚げ」などのGoogle検索にヒットするようにする。<br>

### サービスの差別化ポイント・推しポイント
様々なレシピサイトやSNSでノンフライヤーのレシピを見つけることはできるが、特化したアプリは存在しないため検索の手間が省ける。<br>
ノンフライヤーでの調理を掲載しているレシピの中で、温度・時間が表記されていないことがあるため、温度・時間の入力を必須項目とする。<br>
また、ノンフライヤーを使用しないレシピを無くすために、レシピ投稿ページには「ノンフライヤーを使用したレシピのみ登録してください」という注意書きを添え、ノンフライヤーの商品名も入力必須項目とする。<br>
既存のレシピを参考にする場合、webサイト・Instagram・YouTubeのURLの埋め込みでレシピを表示することによって、材料や調理手順入力の手間が省ける。

### 機能
[MVPリリース時]<br>
・トップページ(他人が投稿したレシピの表示、検索窓)<br>
・マルチ検索(タイトル、タグから複数語入力して検索できる。自分の投稿、いいねページ、他人の投稿ページで検索窓を分ける)<br>
・コンテンツ(レシピ)投稿、URL埋め込み、画像登録(見本画像、調理工程)<br>
・一覧表示(トップページ、検索結果)<br>
・タグ付け<br>
・詳細<br>
・会員登録, ログイン(レシピ投稿・いいね時に必要、閲覧や検索には不要)<br>
・マイページ<br>
・デザインはスマートフォンに対応したもので適用<br>
・レシピは自分や家族から10個投稿された状態にする<br>
・2つ以上の異なるアカウントからレシピの投稿がある状態にする<br>
・レスポンシブデザイン(PCでの表示)に対応<br>

[本リリース]<br>
・いいね<br>
・マイページにいいねした投稿の表示<br>
・画像加工機能(レシピ画像登録時に自動でサイズ調整)<br>
・検索欄にオートコンプリート機能実装(検索欄に入力された単語に合致するタグ、タイトルを検索し、レシピのタイトルを表示)<br>
・お問い合わせフォーム<br>
・パスワードリセット機能<br>
・利用規約・プライバシーポリシーの表示<br>
・Googleログイン機能<br>
・オートログイン機能(ログイン状態を1ヶ月保持する)<br>
・OGP設定
・独自ドメインの取得

### 機能イメージ
<table class="table-auto">
  <thead>
    <tr>
      <th>トップページ</th>
      <th>サイドバー</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://gyazo.com/3d9cd9589013f26a294d99d97a9089ce"><img src="https://i.gyazo.com/3d9cd9589013f26a294d99d97a9089ce.jpg" alt="Image from Gyazo" width="1440"/></a><br>
      登録・ログイン無しでも、公開済みレシピの閲覧ができます。</td>
      <td><a href="https://gyazo.com/fb1f493e05de0c5e00e355cfd54473f1"><img src="https://i.gyazo.com/fb1f493e05de0c5e00e355cfd54473f1.jpg" alt="Image from Gyazo" width="1440"/></a><br>
      サイドバーから、各種機能にアクセスできます。</td>
    </tr>
  </tbody>

  <thead>
    <tr>
      <th>検索画面</th>
      <th>ログインページ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://gyazo.com/bdb9465e7f3fe73d0191fc40d783c929"><img src="https://i.gyazo.com/bdb9465e7f3fe73d0191fc40d783c929.jpg" alt="Image from Gyazo" width="1440"/></a></a><br>
      オートコンプリート機能搭載、複数(and)検索可能。</td>
      <td><a href="https://gyazo.com/58ba0902e856d8a9a5ecd424fd4dc607"><img src="https://i.gyazo.com/58ba0902e856d8a9a5ecd424fd4dc607.png" alt="Image from Gyazo" width="1440"/></a><br>
      Googleログインが可能です。</td>
    </tr>
  </tbody>

  <thead>
    <tr>
      <th>新規登録ページ</th>
      <th>プロフィールページ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://gyazo.com/b61425529787f613a26b446bc800a8b3"><img src="https://i.gyazo.com/b61425529787f613a26b446bc800a8b3.png" alt="Image from Gyazo" width="1440"/></a><br>
      </td>
      <td><a href="https://gyazo.com/e3a7f15670e13a952e3ba0f7d57cc47a"><img src="https://i.gyazo.com/e3a7f15670e13a952e3ba0f7d57cc47a.png" alt="Image from Gyazo" width="1440"/></a><br>
      名前・メールアドレス・パスワードの変更が可能です。</td>
    </tr>
  </tbody>

  <thead>
    <tr>
      <th>レシピ詳細ページ</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://gyazo.com/4018717fc1a47248e5f5379cefff770e"><img src="https://i.gyazo.com/4018717fc1a47248e5f5379cefff770e.jpg" alt="Image from Gyazo" width="1440"/></a><br>
      ログイン後は、レシピタイトル横のタグクリックでレシピの保存ができます。</td>
      <td><a href="https://gyazo.com/4bfb05495d7fa37c8189ece41fb3351e"><img src="https://i.gyazo.com/4bfb05495d7fa37c8189ece41fb3351e.jpg" alt="Image from Gyazo" width="1440"/></a><br>
      YouTube, Webサイト, Instagramのurlを保存・閲覧できます。</td>
    </tr>
  </tbody>

  <thead>
    <tr>
      <th>レシピ作成・編集ページ</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://gyazo.com/f6b675358c9987fa5b16a960a45f0298"><img src="https://i.gyazo.com/f6b675358c9987fa5b16a960a45f0298.jpg" alt="Image from Gyazo" width="1440"/></a><br>
      画像選択時にプレビューが表示されます。</td>
      <td><a href="https://gyazo.com/66a60d7cce7698814e295db8f39284af"><img src="https://i.gyazo.com/66a60d7cce7698814e295db8f39284af.png" alt="Image from Gyazo" width="1440"/></a><br>
      各入力欄は、動的に追加・削除ができます。</td>
    </tr>
  </tbody>

  <thead>
    <tr>
      <th>お問い合わせフォーム</th>
      <th>管理画面</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://gyazo.com/a1a30bdffcdaf89873a86559f7aeb018"><img src="https://i.gyazo.com/a1a30bdffcdaf89873a86559f7aeb018.png" alt="Image from Gyazo" width="1440"/></a></td>
      <td><a href="https://gyazo.com/60cb2b99f769fb52608dbcab2f1e0e7b"><img src="https://i.gyazo.com/60cb2b99f769fb52608dbcab2f1e0e7b.png" alt="Image from Gyazo" width="1440"/></a><br>
      id = 1のuserのみ、/adminにアクセスできます。</td>
    </tr>
  </tbody>
</table>

### 使用技術
<table class="table-auto">
  <thead>
    <tr>
      <th>Category</th>
      <th>Technology Stack</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Frontend</td>
      <td>tailwindcss 3.4.17<br>
          Hotwired/stimulus 3.2.2<br>
          Hotwired/turbo-rails 8.0.12</td>
    </tr>
    <tr>
      <td>Backend</td>
      <td>Ruby on Rails7.2<br>
          Puma 5.0</td>
    </tr>
    <tr>
      <td>Infrastructure</td>
      <td>Render<br>
          AWS S3 (本番環境)</td>
    </tr>
    <tr>
      <td>Database</td>
      <td>PostgreSQL 14.17</td>
    </tr>
    <tr>
      <td>Environment setup</td>
      <td>Docker</td>
    </tr>
    <tr>
      <td>CI/CD</td>
      <td>GitHub Actions</td>
    </tr>
    <tr>
      <td>Design</td>
      <td>Figma</td>
    </tr>
  </tbody>
</table>
