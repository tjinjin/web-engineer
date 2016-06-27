require 'rubygems'
require 'redis'

redis = Redis.new

# user_id 4 のランキングを取る
# 一番が0になるので+1する
p redis.zrevrank('ranking', 4) + 1
