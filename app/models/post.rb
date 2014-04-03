class Post < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :posts

  validates :user, presence: true
  validates :image, presence: true
  validates :description, length: { maximum: 140 }
end
