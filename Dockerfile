# Base Image
FROM ruby:2.7
# 環境変数
ENV  RAILS_ENV=production

# 必要なライブラリ：node.js、yarn等をインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn
 
 WORKDIR /app
 COPY ./src /app
 # ruby関連のライブラリーをインストール(Gemfileをインストール)
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

# シェルファイルのコピー＆実行権限付与
COPY start.sh /start.sh
RUN chmod 744 /start.sh
# シェルファイルを実行
CMD ["sh", "/start.sh"]

