class Meow < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :meows

  belongs_to :post,
    inverse_of: :meows

  validates :user, presence: true
  validates :post, presence: true
  validates :post_id, uniqueness: { scope: :user_id }
end
