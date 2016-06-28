require 'rubygems'
require 'mongo'

connection = Mongo::Connection.new('localhost', 27017)
db = connection.db('mydb') #mydbデータベースに接続

# まだコレクションが存在しない
p db.collection_names

users = db.collection('users')

(201..300).each do |i|
  users.insert(name: "tjinjin#{i}")
end

# usersがある
p db.collection_names

p users.count # 100

# nameがtjinjinのデータを取る
users.find(name: "tjinjin").each { |row| p row }

# nameの最後が0のデータを取り出す
users.find(name: /0$/).limit(5).each { |row| p row }
