require 'rubygems'
require 'redis'

redis = Redis.new

# ランキング表を取得する
p redis.zrevrange('ranking', 0,9)
