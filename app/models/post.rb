class Post < ApplicationRecord
  # comments are dependent on a post's existence, makes sure all comments are deleted when post is deleted
  has_many :comments, dependent: :destroy
end
