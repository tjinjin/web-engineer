require 'rubygems'
require 'redis'

redis = Redis.new

(1..10).each do |user_id|
  redis.zadd('ranking', rand(100), user_id)
end
