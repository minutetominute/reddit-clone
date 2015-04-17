class Post < ActiveRecord::Base
  validates :title, :author_id, :post_subs, presence: true

  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author, class_name: "User"

  has_many :comments
end
