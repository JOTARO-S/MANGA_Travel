# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActionMailer::Base.perform_deliveries = false

Admin.create!(
   name: "運営",
   email: "admin@admin",
   password: "testes"
)

User.create!(
   [
   {id: 2, name: "旅行好き", email: "test@test.com", password: "testes", explanation: "47都道府県制覇！沖縄には毎年行ってます！", is_deleted: false },
   {id: 3, name: "漫画好き", email: "manga@test.com", password: "testes", explanation: "漫画を読むことが好きです！旅行にはあまり行った事が無いので参考にしたい！", is_deleted: false },
   {id: 4, name: "ジョニー", email: "jonny@test.com", password: "testes", explanation: "好きな漫画の聖地巡礼します^^", is_deleted: false },

   ]   
)

Tag.create!(
   [
   {id: 1, tag_name: "宇宙"},{id: 2, tag_name: "科学"},{id: 3, tag_name: "自然"},{id: 4, tag_name: "神社"},
   ]
)

Category.create!(
   [
   {name: "北海道"},{name: "青森県"},{name: "岩手県"},{name: "宮城県"},{name: "秋田県"},{name: "山形県"},{name: "福島県"},{name: "茨城県"},
   {name: "栃木県"},{name: "群馬県"},{name: "埼玉県"},{name: "千葉県"},{name: "東京都"},{name: "神奈川県"},{name: "新潟県"},{name: "富山県"},
   {name: "石川県"},{name: "福井県"},{name: "山梨県"},{name: "長野県"},{name: "岐阜県"},{name: "静岡県"},{name: "愛知県"},{name: "三重県"},
   {name: "滋賀県"},{name: "京都府"},{name: "大阪府"},{name: "兵庫県"},{name: "奈良県"},{name: "和歌山県"},{name: "鳥取県"},{name: "島根県"},
   {name: "岡山県"},{name: "広島県"},{name: "山口県"},{name: "徳島県"},{name: "香川県"},{name: "愛媛県"},{name: "高知県"},{name: "福岡県"},
   {name: "佐賀県"},{name: "長崎県"},{name: "熊本県"},{name: "大分県"},{name: "宮崎県"},{name: "鹿児島県"},{name: "沖縄県"},{name: "その他"}
   ]
)

Post.create!(
   [
   {id: 1, user_id: 3, category_id: 8, name: "宇宙兄弟", place: "茨城県つくば市千現2-1-1 宇宙航空研究開発機構（つくば宇宙センター）",
   explanation: "茨城県つくば市にあります。JAXAと言ったほうが伝わりやすいかもしれません。一般公開している場所は予約なしでも入れますが、予約することで普段入ることが出来ない構内にも入れるのでとてもオススメです！", is_active: false, draft_status: false },
    {id: 2, user_id: 3, category_id: 13, name: "言の葉の庭", place: "東京都新宿区内藤町11 新宿御苑",
   explanation: "作中登場した箇所が敷地内に点在しています。夏頃に行きましたが、青葉が生い茂っていて新宿の中でとても自然を感じることが出来ました！", is_active: false, draft_status: false },
   {id: 3, user_id: 4, category_id: 9, name: "ひぐらしのなく頃に", place: "岐阜県大野郡白川村荻町559 白川八幡神社",
   explanation: "作中に登場するキャラクターの古手梨花が当主である古手神社のモデルと言われている場所です。祭具殿もありますが少しと離れているので注意です！", is_active: false, draft_status: false },
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
   {id: 1, post_id: 1, tag_id: 1},{id: 2, post_id: 1, tag_id: 2},{id: 3, post_id: 2, tag_id: 3},{id: 4, post_id: 3, tag_id: 3},
   {id: 5, post_id: 3, tag_id: 4},
   ]
)

Comment.create!(
   [
   {id: 1, user_id: 2, post_id: 1, comment_content: "私も行ったことあります！人工衛星が展示されていてとても大きく驚愕しました！"},
   {id: 2, user_id: 3, post_id: 1, comment_content: "コメントありがとうございます！圧巻ですよね！"},
   {id: 3, user_id: 3, post_id: 3, comment_content: "ひぐらしのなく頃は私も好きなので行ってみたいです^^"},
   
   ]
)

Bookmark.create!(
   [
   {id: 1, user_id: 2, post_id: 1},{id: 2, user_id: 2, post_id: 2},{id: 3, user_id: 3, post_id: 3},{id: 4, user_id: 3, post_id: 1},
   {id: 5, user_id: 3, post_id: 2},
   ]
)

Message.create!(
   [
   {id: 1, user_id: 2, chat_id: 1, message_content: "是非お願いします！"},{id: 2, user_id: 3, chat_id: 1, message_content: "昔、北海道に住んでいたので道内であれば色々知ってます！"},
   {id: 3, user_id: 3, chat_id: 1, message_content: "私も北海道に行ったことがないので知りたいです！"},{id: 4, user_id: 3, chat_id: 1, message_content: "サッポロビール園はビールを飲みつつジンギスカンを食べられるので最高です！"},
   {id: 5, user_id: 3, chat_id: 2, message_content: "私のオススメはゴールデンカムイです！バトル、ギャグなど色々な要素があります！"},{id: 6, user_id: 4, chat_id: 2, message_content: "私もギャグ漫画は良く読みます！銀魂とかどうでしょうか！？"}
   ]   
)