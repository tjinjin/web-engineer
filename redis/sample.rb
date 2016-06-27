require 'rubygems'
require 'redis'
require 'json'

redis = Redis.new

redis.set 'foo', [1,2,3].to_json
p JSON.parse(redis.get('foo'))
