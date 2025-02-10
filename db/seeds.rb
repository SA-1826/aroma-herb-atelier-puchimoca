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
  Category.find_or_create_by!(name: name)
end

(1..13).each do |i|
  instance_variable_set("@user_#{i}", User.find_or_create_by!(
    name:"user_#{i}",
    email: "user_#{i}@test.com",
    password: "password"
  ))
end

post_1 = Post.find_or_create_by!(title: "アロマスプレー作り参加") do |post|
  post.title = "アロマスプレー作り参加"
  post.body = "手軽にアロマを楽しめるものを自分の好きな香りで作ってみたくてアロマスプレー作りに参加しました！\n作り方はシンプルだったのでお家でも作れそう♪\nでもレアなアロマを使いたいときはワークショップの方がエッセンシャルオイルを買わなくても使えるからよさそうかな＊"
  post.user = user_1
end

post_2 = Post.find_or_create_by!(title: "ハーブの資格取りたい") do |post|
  post.title = "ハーブの資格取りたい"
  post.body = "お花とかを自分で育てるのが好きなので、せっかくだからそういう関連の資格を取りたいと考えていてここを見つけました。\nどういう資格が役立ちやすいとかおすすめとか、あればコメントで教えてもらえると嬉しいです。\nよろしくお願いします。"
  post.user = user_4
end

post_3 = Post.find_or_create_by!(title: "パン作ってみた") do |post|
  post.title = "パン作ってみた"
  post.body = "以前あったパン作りのワークショップに参加したんだけど、基本的なパンの作り方が分かるから家でも簡単に作れたよ！\nワークショップではハーブを入れたけど、入れなくても美味しい(^ ^)\nハーブはそんなにでもパン作りに興味ある人にはおすすめだよ～"
  post.user = user_3
end

Comment.find_or_create_by!(
  body: "アロマスプレーは調べたら作り方簡単だったからわざわざワークショップに参加するのはなって悩んでたけど、高い精油を必要分だけ使えるのはありがたいかも！！",
  user_id: @user_2.id,
  post_id: post_1.id
)

Comment.find_or_create_by!(
  body: "ハーブの検定とかは興味あります？",
  user_id: @user_6.id,
  post_id: post_2.id
)

Comment.find_or_create_by!(
  body: "ハーブのパン、美味しそう！\nハーブってお料理にも使われてるよね～！",
  user_id: @user_11.id,
  post_id: post_2.id
)

Comment.find_or_create_by!(
  body: "アロマスプレーは調べたら作り方簡単だったからわざわざワークショップに参加するのはと悩んでたけど、高い精油を必要分だけ使えるのはありがたいかも！！",
  user_id: @user_2.id,
  post_id: post_3.id
)

group_1 = Group.find_or_create_by!(name: "アロマ好き") do |group|
  group.name = "アロマ好き"
  group.body = "アロマに関することが好きな方集まれ～！\nお互いの投稿、コメントなどから情報交換できたら嬉しいな♪"
  group.owner = user_1
end

UserGroupCombination.find_or_create_by!(user_id: @user_2.id, group_id: group_1.id, status: :is_participating)