class Sub < ActiveRecord::Base
  belongs_to :moderator, class_name: "User"
  has_many :post_subs
  has_many :posts, through: :post_subs, source: :post

  def name
    title
  end
end
