require 'rubygems'
require 'redis'

redis = Redis.new

redis.set 'bar', [1,2,3]
p redis.get 'bar'
