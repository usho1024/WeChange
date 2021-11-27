# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 開発用初期データ
for i in 1..15 do
  [
    [ User.create!(name: "#{i}太郎", introduction: "#{i}番目のユーザー", email: "#{i}@#{i}", password: "123456") ],
    [ Tweet.create!(user_id: 1, body: "#{i}番目のつぶやき") ],
    [ Reply.create!(tweet_id: 1, user_id: 1, body: "#{i}番目の返信") ],
    [ Topic.create!(user_id: 1, title: "#{i}番目のトピック", body: i) ],
    [ Comment.create!(topic_id: 1, user_id: 1, body: "#{i}番目のコメント") ],
    [ StudyTime.create!(user_id: i, time: i*1.2) ]
  ]
end