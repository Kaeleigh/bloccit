class Post < ApplicationRecord
  # post nested under Topics
  belongs_to :topic
  # comments dependent on a post's existence, makes sure all comments are deleted when post is deleted.
  has_many :comments, dependent: :destroy

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
end
