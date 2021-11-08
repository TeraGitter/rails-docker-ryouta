#! /bin/sh

# 本番環境の場合のみ実行したいファイル
if [ "${RAILS_ENV}" = "production" ]
then
    # assets:precompile ... rails css、javascriptファイルを一度にコンパイルする
    bundle exec rails assets:precompile
fi

# portが未指定の場合、3000を使う。
# -b 0.0.0.0　... IPアドレスの制限なし
bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0
