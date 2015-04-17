class Sub < ActiveRecord::Base
  belongs_to :moderator, class_name: "User"
  has_many :posts

  def name
    title
  end
end
