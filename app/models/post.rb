class Post < ActiveRecord::Base
  validates :title, :sub_id, :author_id, presence: true
  has_many :post_subs
  has_many :subs, through: :post_subs, source: :sub
  belongs_to :author, class_name: "User"
end
