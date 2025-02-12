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

categories = category_names.map do |name|
  Category.create!(name: name)
end

users = (1..13).map do |i|
  User.create!(
    name:"user_#{i}",
    email: "user_#{i}@test.com",
    password: "password"
  )
end

posts_and_comments_attributes = [
  {
    title: "アロマスプレー作り参加",
    body: "手軽にアロマを楽しめるものを自分の好きな香りで作ってみたくてアロマスプレー作りに参加しました！\n作り方はシンプルだったのでお家でも作れそう♪\nでもレアなアロマを使いたいときはワークショップの方がエッセンシャルオイルを買わなくても使えるからよさそうかな＊",
    comments: [
      "アロマスプレーは調べたら作り方簡単だったからわざわざワークショップに参加するのはなって悩んでたけど、高い精油を必要分だけ使えるのはありがたいかも！！",
    ]  
  },
  {
    title: "ハーブの資格取りたい",
    body: "お花とかを自分で育てるのが好きなので、せっかくだからそういう関連の資格を取りたいと考えていてここを見つけました。\nどういう資格が役立ちやすいとかおすすめとか、あればコメントで教えてもらえると嬉しいです。\nよろしくお願いします。",
    comments: [
      "ハーブの検定とかは興味あります？"
    ]
  },
  {
    title: "パン作ってみた",
    body: "以前あったパン作りのワークショップに参加したんだけど、基本的なパンの作り方が分かるから家でも簡単に作れたよ！\nワークショップではハーブを入れたけど、入れなくても美味しい(^ ^)\nハーブはそんなにでもパン作りに興味あるって人にもおすすめだよ～",
    comments: [
      "ハーブのパン、美味しそう！\nハーブってお料理にも使われてるよね～！"
    ]
  },
  {
    title: "検定とは？",
    body: "アロマに興味があって調べていたら検定というのがあると知ったのですが、自分で勉強するだけでなく検定1級を持っているとなにかメリットがありますか？\n今のところアロマ関係を仕事にする予定は特にないです。\nどなたかコメントいただけると嬉しいです。",
    comments: [
      "インプットした知識の確認になりますね。\nあと、検定1級に合格すると履歴書に書くことができますよ。",
      "最近1級に合格した者です。\n検定1級合格には期限がないので、せっかく勉強するなら取っておいて損はないと思います。\n将来的に何かしようと思われたときに、アドバイザーの資格取得からでよくなりますよ。"
    ]
  },
  {
    title: "アロマテラピー検定対策勉強会参加",
    body: "アロマテラピー検定対策勉強会に参加して1級に合格しました。\n正直、内容自体は独学でもいけるかな、と思ったのですが…\n私の場合は実習がついていたので受けてみることにしました。\n実習で作りながら学べること、先生が優しくて面白い方でご自身のエピソードを交えて説明してくれることなど、独学より理解が深まったと思います。\n受けて良かったと思いましたよ！\n\n参考までに。",
    comments: [
      "参考になりました"
    ]
  },
  {
    title: "勉強がんばってるよ",
    body: "ハーバルセラピストの資格取得の勉強をしてるけど結構しっかり知識がいるから難しい…\n同じように勉強してるみんな、一緒に頑張ろうね～！",
    comments: [
      "ファイトです！"
    ]
  },
  {
    title: "資格取得してよかったこと",
    body: "先生のところでアロマテラピーアドバイザーの資格を取得して、今はアロマ関係の店舗で働いています！\nアドバイザーを名乗れるのでお客様に安心して相談いただけていると思います。\n喜んでもらえると自分も嬉しくなってさらに知識を身につけようと向上心が生まれるので好循環ですね♪",
    comments: [
      "お仕事にも活かせているんですね"
    ]
  },
  {
    title: "インテリアに！",
    body: "ワークショップでハーバリウム作ったら…\nすごくかわいいのができた～!!\n\nたくさん選んだり、良いものを選んだりするとそれなりのお値段にはなるんだけど…\n瓶もお花も選べるから、自分の好みと部屋の雰囲気に合わせて作れたよ～\n妥協して販売してるの買うより全然いい～～!\n\n資格の勉強の息抜きにもなってちょうどよかったよ*^ ^*",
    comments: [
      "ワークショップの紹介の写真もかわいいよね！私も作ってみようかな～"
    ]
  },
  {
    title: "何か始めたい",
    body: "何か始めたくて色々調べてます～\nまずはワークショップかなって思うんですけど、、、\nおすすめあれば教えてくださ～い!",
    comments: [
      "アロマスプレーは簡単に作れて、初めてでもおすすめですよ！"
    ]
  }
]

puts "#=> Post and Comment start"

posts_and_comments_attributes.each do |post_and_comments_attributes|
  post_user = users.sample
  comments_users = users.select { |user| user != post_user }
  comments_data = post_and_comments_attributes[:comments]
  post_and_comments_attributes.delete(:comments)
  post_attributes = post_and_comments_attributes
  post = post_user.posts.create!(post_attributes)
  puts ". ---> post created"
  comments_data.each do |comment|
    comments_users.sample.comments.create(
      body: comment,
      post: post
    )
    print "."
  end
  puts " ---> comments created"
end

puts "#=> Post and Comment finished"

groups_attributes = [
  {
    name: "アロマ好き",
    body: "アロマに関することが好きな方集まれ～！\nお互いの投稿、コメントなどから情報交換できたら嬉しいな♪"
  },
  {
    name: "資格取得",
    body: "資格取得の講座を受けた、受講中、または受けようと検討中など、資格取得に関心のある方。\n投稿や、コメントを残して情報を共有しませんか？"
  },
  {
    name: "アロマで健康",
    body: "アロマを使って元気に過ごしたい！"
  }
]

puts "#=> Group and Member start"

groups_attributes.each.with_index(1) do |group_attributes, i|
  owner = users.sample
  join_users = users.select { |user| user != owner }
  group = Group.create!(group_attributes.merge({owner: owner}))
  puts ". ---> group created"
  group.image.attach(io: File.open("#{Rails.root}/db/fixtures/group_#{i}.jpg"), filename:"group_#{i}.jpg")
  join_users.sample(rand(1..join_users.size)).each do |user|
    user.user_group_combinations.create!(group: group, status: :is_participating)
    print "."
  end
  puts " ---> user_group_combinations created"
end
UserGroupCombination.all.sample.update(status: :is_pending)

puts "#=> Group and Member finished"

programs_attributes = [
  {
    category: Category.find_by(name: "ワークショップーハーブ"),
    title: "ブレンドハーブティー作り",
    body: "オリジナルのブレンドハーブティーを作ります。\nヒアリングシートを用いてブレンドするハーブを決めていきます。\n迷ったときにはお手伝いさせていただきますのでご安心くださいね！\nお持ち帰りは約15杯分です。",
    start_time: Time.zone.local(2025, 3, 22, 14, 00, 0),
    publish_status: :published,
    price: 3960,
    time_required: 40
  },
  {
    category: Category.find_by(name: "ワークショップーハーブ"),
    title: "ハーブパン作り",
    body: "生地にハーブを混ぜたパンを作ります。\n細かくしたハーブを混ぜ込み、ほんのりハーブ風味のパンをふんわりと焼き上げます。\nパン生地から作り方をお伝えするので、お家で作るときにはアレンジも♪\nお持ち帰りは6個です。\n焼成中にハーブティーをお入れします。",
    start_time: Time.zone.local(2025, 5, 3, 11, 00, 0),
    publish_status: :published,
    price: 5500,
    time_required: 120
  },
  {
    category: Category.find_by(name: "ワークショップーアロマ"),
    title: "ピロースプレー作り",
    body: "3種類のブレンドからお好みの香りをお選びいただき、ピロースプレーを作ります。\nおやすみ前にシュッ！\n良い香りに包まれておやすみ時間をワンランク上にしてみませんか？",
    start_time: Time.zone.local(2025, 3, 8, 14, 00, 0),
    publish_status: :published,
    price: 2530,
    time_required: 30
  },
  {
    category: Category.find_by(name: "ワークショップーアロマ"),
    title: "アロマワックスサシェ作り",
    body: "お好みの香りでワックスサシェを作ります。\nドライハーブを飾って仕上げ、インテリアとしてもお楽しみいただけます！",
    start_time: Time.zone.local(2025, 4, 19, 14, 00, 0),
    publish_status: :published,
    price: 3850,
    time_required: 45
  },
  {
    category: Category.find_by(name: "検定対応ーアロマ"),
    title: "アロマテラピーアドバイザー認定講習会",
    body: "日本アロマ環境協会（AEAJ）認定スクール。\n精油の安全な使い方やアロマテラピーに関係する法律などの知識をもち、日常生活でのアロマ活用法を提案できる力を認定する資格を取得するための講習会です。\n※アロマテラピー検定1級に合格している方を対象に行います。\n※テキスト代、クラフト材料代は参加費に含みます。\nテキストをお持ちの方は参加費からテキスト代（￥2200(税込)）を除外させていただきますのでお申し付けください。",
    start_time: Time.zone.local(2025, 5, 20, 10, 00, 0),
    publish_status: :published,
    price: 7700,
    time_required: 180
  },
  {
    category: Category.find_by(name: "検定対応ーハーブ"),
    title: "ハーバルセラピスト認定講座",
    body: "久留米市唯一の日本メディカルハーブ協会（JAMHA）認定教室。\n\n30種類のメディカルハーブと12種類の精油の有用性を学び、季節や体調の変化に応じたライフスタイルを提案できる専門家を目指す資格取得のための講座です。\n全18単位（2時間/1単位）を学ぶことで、実生活で活かせる幅広い知識を身につけることができます。\n\nハーバルセラピストコース　カリキュラム\n全18単位（２時間／１単位）\n1.メディカルハーブの歴史と今後の展望\n2.メディカルハーブの基礎知識 Ⅰ\n3.メディカルハーブの基礎知識 Ⅱ\n4.アロマテラピーの基礎知識\n5.メディカルハーブと精油の安全性\n6.メディカルハーブ製剤 Ⅰ\n7.メディカルハーブ製剤 Ⅱ\n8.代謝を助けるメディカルハーブ\n9.ライフスタイルの改善とQOLの向上\n10.生活習慣病の予防に役立つメディカルハーブ\n11.外敵から身体を守るメディカルハーブ\n12.ストレス対策と心身症の予防に役立つメディカルハーブ\n13.女性のためのメディカルハーブ\n14.若さを保つメディカルハーブ\n15.五感の刺激とメディカルハーブ\n16.キッチンファーマシー（わが家の台所薬局）\n17.ハーバルライフのデザイン\n18.自然治癒力を高めるライフスタイル及び修了式\n\n※開催日や時間は1単位（2時間）を1回としてご希望をお伝えください。\n※所要時間は1回あたりの時間です。",
    start_time: Time.zone.local(2025, 3, 15, 10, 00, 0),
    publish_status: :published,
    price: 140000,
    time_required: 120
  },
  {
    category: Category.find_by(name: "お役立ちーアロマ"),
    title: "アロマテラピー検定対策勉強会",
    body: "アロマテラピー検定1級合格に向けて、実習を含みながら勉強します。\n楽しみながら知識を身につけていきましょう！\n\n全8回（2時間/1回）\n実習3回（以下5種類からお選びいただけます）\n・ルームスプレー\n・ボディートリートメントオイル\n・ブレンドエッセンシャルオイル\n・バスソルト\n・ハンガリアンウォーター\n\n※テキスト代、実習材料代は参加費に含みます。\n※日時は曜日固定ではありませんので都度ご相談ください。\n※所要時間は1回あたりの時間です。",
    start_time: Time.zone.local(2025, 2, 1, 13, 00, 0),
    publish_status: :published,
    price: 25000,
    time_required: 120
  },
  {
    category: Category.find_by(name: "お役立ちーハーブ"),
    title: "メディカルハーブ検定対策勉強会",
    body: "作成中",
    start_time: Time.zone.local(2025, 2, 12, 14, 00, 0),
    publish_status: :draft,
    price: 0,
    time_required: 0
  }
]

puts "#=> Program start"

programs_attributes.each.with_index(1) do |program_attributes, i|
  program = Program.create!(program_attributes.merge({ admin: admin }))
  program.image.attach(io: File.open("#{Rails.root}/db/fixtures/program_#{i}.jpg"), filename:"program_#{1}.jpg")
end

puts "#=> Program finished"

puts "seedの実行を完了しました"