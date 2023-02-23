## class Post
class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many :like

  def update_posts_counter(user)
    Post.create(user: user, title: 'Hello', text: 'This is my fourth  post')
    updatedUser = User.where('id = ?', params[user.id])
    updatedUser.postCountr += 1
    updatedUser.save
  end

  def recent_comments
    Comments.where('post_id = ?', params[id]).order(created_at: :desc).limit(5)
  end
end