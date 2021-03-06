class Topic < ApplicationRecord
  validates :user_id, presence: true             #「誰が」「どの投稿をしたか」 user_id
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader

  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'      # topicにfavoriteした全てのユーザー
  has_many :comments

end
