require 'rubygems'
require 'redis'

redis = Redis.new

# user_id 4 の人のスコアを取る
p redis.zscore('ranking', 4)
