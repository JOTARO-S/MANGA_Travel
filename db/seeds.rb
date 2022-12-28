# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: "運営",
   email: "admin@admin",
   password: "testes"
)

Tag.create!(
   [
   {id: 1, tag_name: "歴史"},{id: 2, tag_name: "小樽"},{id: 3, tag_name: "海"},{id: 4, tag_name: "宇宙"},
   {id: 5, tag_name: "科学"},{id: 6, tag_name: "研究施設"},{id: 7, tag_name: "自然"},{id: 8, tag_name: "都内"},
   {id: 9, tag_name: "神社"},{id: 10, tag_name: "スポーツ"},
   ]
)

Category.create!(
   [
   {id: 1, name: "北海道"},{name: "青森県"},{name: "岩手県"},{name: "宮城県"},{name: "秋田県"},{name: "山形県"},{name: "福島県"},{name: "茨城県"},
   {id: 9, name: "栃木県"},{name: "群馬県"},{name: "埼玉県"},{name: "千葉県"},{name: "東京都"},{name: "神奈川県"},{name: "新潟県"},{name: "富山県"},
   {id: 17, name: "石川県"},{name: "福井県"},{name: "山梨県"},{name: "長野県"},{name: "岐阜県"},{name: "静岡県"},{name: "愛知県"},{name: "三重県"},
   {id: 25, name: "滋賀県"},{name: "京都府"},{name: "大阪府"},{name: "兵庫県"},{name: "奈良県"},{name: "和歌山県"},{name: "鳥取県"},{name: "島根県"},
   {id: 33, name: "岡山県"},{name: "広島県"},{name: "山口県"},{name: "徳島県"},{name: "香川県"},{name: "愛媛県"},{name: "高知県"},{name: "福岡県"},
   {id: 41, name: "佐賀県"},{name: "長崎県"},{name: "熊本県"},{name: "大分県"},{name: "宮崎県"},{name: "鹿児島県"},{name: "沖縄県"},{name: "その他"}
   ]
)


users = 
   [
   {id: 2, name: "旅行好き", email: "test@test.com", password: "testes", explanation: "47都道府県制覇！沖縄には毎年行ってます！", is_deleted: false },
   {id: 3, name: "漫画好き", email: "manga@test.com", password: "testes", explanation: "漫画を読むことが好きです！旅行にはあまり行った事が無いので参考にしたい！", is_deleted: false },
   {id: 4, name: "ジョニー", email: "jonny@test.com", password: "testes", explanation: "好きな漫画の聖地巡礼します^^", is_deleted: false },
   {id: 5, name: "旅行太郎", email: "taro@test.com", password: "testes", explanation: "47都道府県全て制覇したい！", is_deleted: false },
   {id: 6, name: "漫画花子", email: "hanako@test.com", password: "testes", explanation: "漫画を読むことが好きです！旅行にはあまり行った事が無いので参考にしたい！", is_deleted: false },
   {id: 7, name: "ケイミー", email: "keimy@test.com", password: "testes", explanation: "イタリアに住んでます！", is_deleted: false },
   {id: 8, name: "スライム", email: "slime@test.com", password: "testes", explanation: "よろしくお願いします！", is_deleted: false },
   {id: 9, name: "ポケ", email: "poke@test.com", password: "testes", explanation: "よろしくお願いします！", is_deleted: true },
   {id: 10, name: "ゲーマー", email: "gamer@test.com", password: "testes", explanation: "ゲームが好きです！", is_deleted: false },
   {id: 11, name: "ヘッドホン", email: "head@test.com", password: "testes", explanation: "海外旅行に良く行ってます！", is_deleted: false },
   {id: 12, name: "モニター", email: "moniter@test.com", password: "testes", explanation: "旅行にはあまり行った事が無いので参考にしたい！", is_deleted: false },
   {id: 13, name: "アニメ好き", email: "anime@test.com", password: "testes", explanation: "アニメが好きです！", is_deleted: false },
   ]
   
users.each do |record|
 User.create!(record) unless User.find_by(email: record[:email])
end


Post.create!(
   [
   {id: 1, user_id: 2, category_id: 1, name: "ゴールデンカムイ", place: "北海道小樽市祝津3-288 鰊御殿",
   explanation: "作中に登場する鰊御殿です。 御殿からの景観が良く、お土産コーナーには作品のお土産もありました。 中では、歴史を感じさせる囲炉裏や漁や加工に使われた道具が展示されています。 ここに向かう途中には水族館もあるので、そちらも別で楽しめるかと思います！", is_active: false, draft_status: false },
   {id: 2, user_id: 3, category_id: 8, name: "宇宙兄弟", place: "茨城県つくば市千現2-1-1 宇宙航空研究開発機構（つくば宇宙センター）",
   explanation: "茨城県つくば市にあります。JAXAと言ったほうが伝わりやすいかもしれません。一般公開している場所は予約なしでも入れますが、予約することで普段入ることが出来ない構内にも入れるのでとてもオススメです！", is_active: false, draft_status: false },
    {id: 3, user_id: 3, category_id: 13, name: "言の葉の庭", place: "東京都新宿区内藤町11 新宿御苑",
   explanation: "作中登場した箇所が敷地内に点在しています。夏頃に行きましたが、青葉が生い茂っていて新宿の中でとても自然を感じることが出来ました！", is_active: false, draft_status: false },
   {id: 4, user_id: 4, category_id: 9, name: "ひぐらしのなく頃に", place: "岐阜県大野郡白川村荻町559 白川八幡神社",
   explanation: "作中に登場するキャラクターの古手梨花が当主である古手神社のモデルと言われている場所です。祭具殿もありますが少しと離れているので注意です！", is_active: false, draft_status: false },
   {id: 5, user_id: 6, category_id: 40, name: "鬼滅の刃", place: "太宰府市 宝満宮竈門神社",
   explanation: "鬼滅の刃のキャラクターの名前の由来になった神社らしいです！", is_active: false, draft_status: false },
    {id: 6, user_id: 9, category_id: 4, name: "ハイキュー", place: "仙台市 カメイアリーナ仙台",
   explanation: "作中で行われる多くの試合はここらしいです！外観も内観もそっくりなので是非見てください！", is_active: false, draft_status: false },
   {id: 7, user_id: 7, category_id: 13, name: "こちら葛飾区亀有公園前派出所", place: " 東京都葛飾区亀有5-34-1 亀有駅北口交番",
   explanation: "作中登場する派出所のモデルとなった場所です！中の警察官の方に両さんはいますか？と尋ねるとパトロールに出てるよと教えてくれるみたいです！", is_active: false, draft_status: false },
   {id: 8, user_id: 3, category_id: 11, name: "あの日見た花の名前を僕達はまだ知らない。", place: "埼玉県秩父市全域 秩父駅",
   explanation: "秩父ではあの日みた花の名前を僕たちはまだ知らない。通称あの花が市内で聖地とされていて駅など色々なところであの花のキャラクターやグッズなどが置かれています！", is_active: false, draft_status: false },
    {id: 9, user_id: 6, category_id: 48, name: "ジョジョの奇妙な冒険 3部", place: "エジプト カイロ",
   explanation: "作中登場したDIOとの決戦の場所です！街並みがそのままなのでカイロに行った際は思い出して貰いたいです！", is_active: false, draft_status: false },
   {id: 10, user_id: 11, category_id: 13, name: "デュラララ！", place: "東京都豊島区池袋 サンシャイン60前など",
   explanation: "作品自体、池袋が舞台になっているので池袋の道路や公園など様々な場所が作品を彷彿とさせます。作品のラッピングがされている自動販売機などもありました！", is_active: false, draft_status: false },
   ]
)

Chat.create!(
   [
   {id: 1, user_id: 2, title: "オススメの場所が聞きたい！", explanation: "景色が綺麗な場所や楽しかった場所など共有しましょう！"},
   {id: 2, user_id: 3, title: "オススメの漫画・アニメを教えてください！", explanation: "ジャンルは問わず、オススメの漫画やアニメを共有しましょう^^"},
   ]
)

PostTag.create!(
   [
   {id: 1, post_id: 1, tag_id: 1},{id: 2, post_id: 1, tag_id: 2},{id: 3, post_id: 1, tag_id: 3},{id: 4, post_id: 2, tag_id: 4},
   {id: 5, post_id: 2, tag_id: 5},{id: 6, post_id: 2, tag_id: 6},{id: 7, post_id: 3, tag_id: 7},{id: 8, post_id: 3, tag_id: 8},
   {id: 9, post_id: 4, tag_id: 7},{id: 10, post_id: 4, tag_id: 9},{id: 11, post_id: 5, tag_id: 7},{id: 12, post_id: 5, tag_id: 9},
   {id: 13, post_id:7, tag_id: 8},{id: 14, post_id: 10, tag_id: 8},{id: 15, post_id: 6, tag_id: 10},
   ]
)

Comment.create!(
   [
   {id: 1, user_id: 5, post_id: 1, comment_content: "私も行ったことあります！"},
   {id: 2, user_id: 2, post_id: 1, comment_content: "コメントありがとうございます！いいですよね！景色がとても綺麗でした！"},
   {id: 3, user_id: 6, post_id: 1, comment_content: "私も好きなので行ってみたいです…！"},
   {id: 4, user_id: 2, post_id: 2, comment_content: "私も行ったことあります！人工衛星が展示されていてとても大きく驚愕しました！"},
   {id: 5, user_id: 3, post_id: 2, comment_content: "コメントありがとうございます！圧巻ですよね！"},
   {id: 6, user_id: 3, post_id: 4, comment_content: "ひぐらしのなく頃は私も好きなので行ってみたいです^^"},
   
   ]
)

Bookmark.create!(
   [
   {id: 1, user_id: 2, post_id: 1},{id: 2, user_id: 2, post_id: 2},{id: 3, user_id: 3, post_id: 3},{id: 4, user_id: 3, post_id: 1},
   {id: 5, user_id: 3, post_id: 2},{id: 6, user_id: 4, post_id: 5},{id: 7, user_id: 5, post_id: 6},{id: 8, user_id: 6, post_id: 5},
   {id: 9, user_id: 3, post_id: 5},
   ]
)

Message.create!(
   [
   {id: 1, user_id: 2, chat_id: 1, message_content: "是非お願いします！"},{id: 2, user_id: 3, chat_id: 1, message_content: "昔、北海道に住んでいたので道内であれば色々知ってます！"},
   {id: 3, user_id: 3, chat_id: 1, message_content: "私も北海道に行ったことがないので知りたいです！"},{id: 4, user_id: 3, chat_id: 1, message_content: "サッポロビール園はビールを飲みつつジンギスカンを食べられるので最高です！"},
   {id: 5, user_id: 3, chat_id: 2, message_content: "私のオススメはゴールデンカムイです！バトル、ギャグなど色々な要素があります！"},{id: 6, user_id: 4, chat_id: 2, message_content: "私もギャグ漫画は良く読みます！銀魂とかどうでしょうか！？"}
   ]   
)