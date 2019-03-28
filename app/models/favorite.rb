class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  # validates_uniqueness_of :topic_id, scope: :user_id  # 一人一記事一いいね   いいね回数を制限
end
