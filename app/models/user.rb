class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}


  has_secure_password
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}

  has_many :topics
  has_many :favorites               # ↓あるユーザーがfavoriteした全てのtopics
  has_many :favorite_topics, through: :favorites, source: 'topic' # いいねを介してデータの一覧を作る(faovrite_topics) いいねの一覧を作ってね！コード
                                                                  # favoritesのテーブルを見て(through: :favorites) # topicsから一覧を作る
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'

end
