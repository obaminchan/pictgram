class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader

  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'      # topicにfavoriteした全てのユーザー
  has_many :comments

 def iine(user)
   favorites.create(user_id: user.id)
  end

  def uniine(user)
    favorites.find_by(user_id: user.id).destroy
  end

end
