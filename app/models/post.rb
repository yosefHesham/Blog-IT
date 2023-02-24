## class Post
class Post < ApplicationRecord
  belongs_to :auther, class_name: 'User', foreign_key: 'user_id'
  has_many :comment
  has_many :like
  after_save :update_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
