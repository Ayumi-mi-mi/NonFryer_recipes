# 本番環境用 Dockerfile
FROM ruby:3.3.6

# 環境変数の設定
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV RAILS_ENV production

# 必要なパッケージをインストール
RUN apt-get update -qq \
  && apt-get install -y ca-certificates curl gnupg \
  && mkdir -p /etc/apt/keyrings \
  && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
  && NODE_MAJOR=20 \
  && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
  && wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn vim

# アプリケーションディレクトリ作成
RUN mkdir /nonfryer_recipes
WORKDIR /nonfryer_recipes

# Bundlerのインストール
RUN gem install bundler

# アプリケーションコードをコピー
COPY . /nonfryer_recipes

# Gemのインストール（キャッシュを活用するためにGemfileとGemfile.lockを最初にコピー）
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

# プリコンパイル（アセットの事前コンパイル）
RUN bundle exec rails assets:precompile

# ポート設定
EXPOSE 3000

# 起動コマンド
CMD ["bash", "-c", "bundle exec rails db:migrate && bundle exec puma -C config/puma.rb"]
