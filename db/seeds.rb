# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 開発用初期データ
for i in 1..15 do
  User.create!(
    name: "#{i}太郎",
    introduction: "#{i}番目のユーザー",
    email: "#{i}@#{i}",
    password: "123456"
  )
  Tweet.create!(
    user_id: i,
    body: "#{i}番目のユーザーのつぶやき"
  )
  StudyTime.create!(
    user_id: i,
    time: i*1.2
  )
end