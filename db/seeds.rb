# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 1..10 do
  Customer.create!(
    [
      {
        first_name: "難波",
        last_name: "専太",
        first_name_kana: "ナンバ",
        last_name_kana: "センタ",
        email: "0@0",
        password: "000000",
      },
      {
        first_name: "六本木",
        last_name: "一",
        first_name_kana: "ロッポンギ",
        last_name_kana: "ハジメ",
        email: "1@1",
        postal_code: "1066223",
        address: "東京都港区六本木3-2-1 住友不動産六本木グランドタワー 23F",
        telephone_number: "09177772222",
        is_active: false,
        password: "111111",
      }
    ]
    )