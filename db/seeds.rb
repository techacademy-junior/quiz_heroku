# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "admin@test.com", password: "password")

iquestions = [
              %w(この中で昆虫でないものはどれ？
                 カブトムシ
                 クワガタ
                 クモ
                 トンボ
                 3
                ),
              %w(この中で一番土地が広いのはどこ？
                 北海道
                 沖縄
                 東京
                 岡山
                 1
                ),
              %w(この中で４本足でない動物は？
                 犬
                 馬
                 猫
                 人間
                 4
                )   
            ]
            
questions.each do |q|
  attr = { title: q[0],
      a_1: q[1],
      a_2: q[2],
      a_3: q[3],
      a_4: q[4],
   answer: q[5].to_i }
  Question.create!(attr)
end
