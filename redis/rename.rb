# １週間前の情報はランキングから削除する
# activitiesに１週間分のデータが入っている。それをrenameしてやる
activities.each do |activity|
  redis.zadd('ranking_top', activity.score, activity.user_id)
end
redis.rename('ranking_top', 'ranking')
