# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Host.create!(
   email: 'test@test',
   password: 'testtest',
)

Customer.create!(
   family_name: '山田',
   first_name: '太郎',
   family_name_kana: 'ヤマダ',
   first_name_kana: 'タロウ',
   postal_code: '1500041',
   address: ' 東京都渋谷区神南１丁目１９−１１ パークウェースクエア2 4階',
   phone_number: '09012341234',
   email: 'test@test',
   password: 'testtest'
)

