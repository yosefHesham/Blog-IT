## class User
class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comment
end
