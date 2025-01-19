# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "password")

category_names = %w(
  検定対応ーアロマ
  検定対応ーハーブ
  ワークショップーアロマ
  ワークショップーハーブ
)

category_names.each do |name|
  Category.create!(name: name)
end

(1..10).each do |i|
  User.create!(
    name:"user_#{i}",
    email: "user_#{i}@test.com",
    password: "password"
  )
end