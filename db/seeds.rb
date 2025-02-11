# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seedの実行を開始しました"

admin = Admin.create!(email: "admin@test.com", password: "password")

category_names = %w(
  検定対応ーアロマ
  検定対応ーハーブ
  ワークショップーアロマ
  ワークショップーハーブ
  お役立ちーアロマ
  お役立ちーハーブ
)

category_names.each do |name|
  Category.find_or_create_by!(name: name)
  category_ids << category.id
end

category_1 = Category.find(category_ids[0])
category_2 = Category.find(category_ids[1])
category_3 = Category.find(category_ids[2])
category_4 = Category.find(category_ids[3])
category_5 = Category.find(category_ids[4])
category_6 = Category.find(category_ids[5])

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
  post.user_id = user_1.id
end

post_2 = Post.find_or_create_by!(title: "ハーブの資格取りたい") do |post|
  post.title = "ハーブの資格取りたい"
  post.body = "お花とかを自分で育てるのが好きなので、せっかくだからそういう関連の資格を取りたいと考えていてここを見つけました。\nどういう資格が役立ちやすいとかおすすめとか、あればコメントで教えてもらえると嬉しいです。\nよろしくお願いします。"
  post.user_id = user_4.id
end

post_3 = Post.find_or_create_by!(title: "パン作ってみた") do |post|
  post.title = "パン作ってみた"
  post.body = "以前あったパン作りのワークショップに参加したんだけど、基本的なパンの作り方が分かるから家でも簡単に作れたよ！\nワークショップではハーブを入れたけど、入れなくても美味しい(^ ^)\nハーブはそんなにでもパン作りに興味あるって人にもおすすめだよ～"
  post.user_id = user_3.id
end

post_4 = Post.find_or_create_by!(title: "検定とは？") do |post|
  post.title = "検定とは？"
  post.body = "アロマに興味があって調べていたら検定というのがあると知ったのですが、自分で勉強するだけでなく検定1級を持っているとなにかメリットがありますか？\n今のところアロマ関係を仕事にする予定は特にないです。\nどなたかコメントいただけると嬉しいです。"
  post.user_id = user_5.id
end

post_5 = Post.find_or_create_by!(title: "アロマテラピー検定対策勉強会参加") do |post|
  post.title = "アロマテラピー検定対策勉強会参加"
  post.body = "アロマテラピー検定対策勉強会に参加して1級に合格しました。\n正直、内容自体は独学でもいけるかな、と思ったのですが…\n私の場合は実習がついていたので受けてみることにしました。\n実習で作りながら学べること、先生が優しくて面白い方でご自身のエピソードを交えて説明してくれることなど、独学より理解が深まったと思います。\n受けて良かったと思いましたよ！\n\n参考までに。"
  post.user_id = user_4.id
end

post_6 = Post.find_or_create_by!(title: "勉強がんばってるよ") do |post|
  post.title = "勉強がんばってるよ"
  post.body = "ハーバルセラピストの資格取得の勉強をしてるけど結構しっかり知識がいるから難しい…\n同じように勉強してるみんな、一緒に頑張ろうね～！"
  post.user_id = user_8.id
end

post_7 = Post.find_or_create_by!(title: "資格取得してよかったこと") do |post|
  post.title = "資格取得してよかったこと"
  post.body = "先生のところでアロマテラピーアドバイザーの資格を取得して、今はアロマ関係の店舗で働いています！\nアドバイザーを名乗れるのでお客様に安心して相談いただけていると思います。\n喜んでもらえると自分も嬉しくなってさらに知識を身につけようと向上心が生まれるので好循環ですね♪"
  post.user_id = user_10.id
end

post_8 = Post.find_or_create_by!(title: "インテリアに！") do |post|
  post.title = "インテリアに！"
  post.body = "ワークショップでハーバリウム作ったら…\nすごくかわいいのができた～！！\n\nたくさん選んだり、良いものを選んだりするとそれなりのお値段にはなるんだけど…\n瓶もお花も選べるから、自分の好みと部屋の雰囲気に合わせて作れたよ～\n妥協して販売してるの買うより全然いい～～！\n\n資格の勉強の息抜きにもなってちょうどよかったよ*^ ^*"
  post.user_id = user_8.id
end

post_9 = Post.find_or_create_by!(title: "何か始めたい") do |post|
  post.title = "何か始めたい"
  post.body = "何か始めたくて色々調べてます～\nまずはワークショップかなって思うんですけど、、、\nおすすめあれば教えてくださ～い！"
  post.user_id = user_13.id
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
  post_id: post_3.id
)

group_1 = Group.find_or_create_by!(name: "アロマ好き") do |group|
  group.name = "アロマ好き"
  group.body = "アロマに関することが好きな方集まれ～！\nお互いの投稿、コメントなどから情報交換できたら嬉しいな♪"
  group.owner_id = user_1.id
  group.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/group_1.jpg"), filename:"group_1.jpg")
end

group_2 = Group.find_or_create_by!(name: "資格取得") do |group|
  group.name = "資格取得"
  group.body = "資格取得の講座を受けた、受講中、または受けようと検討中など、資格取得に関心のある方。\n投稿や、コメントを残して情報を共有しませんか？"
  group.owner_id = user_6.id
  group.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/group_2.jpg"), filename:"group_2.jpg")
end

group_3 = Group.find_or_create_by!(name: "アロマで健康") do |group|
  group.name = "アロマで健康"
  group.body = "アロマを使って元気に過ごしたい！"
  group.owner_id = user_1.id
  group.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/group_3.jpg"), filename:"group_3.jpg")
end

UserGroupCombination.find_or_create_by!(user_id: @user_2.id, group_id: group_1.id, status: :is_participating)

Program.create!(
  admin_id: admin.id,
  category_id: category_4.id,
  title: "ブレンドハーブティー作り",
  body: "",
  start_time: Time.zone.local(2025, 3, 22, 14, 00, 0),
  publish_status: :published,
  price: 3960,
  time_required: 40,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/program_1.jpg"), filename:"program_1.jpg")
)


puts "seedの実行を完了しました"