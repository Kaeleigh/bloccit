class Post < ApplicationRecord
  # post nested under Topics
  belongs_to :topic
  belongs_to :user
  # comments dependent on a post's existence, makes sure all comments are deleted when post is deleted.
  has_many :comments, dependent: :destroy

  default_scope {order('created_at DESC') }
  scope:ordered_by_title, -> { order('title DESC') }
  scope:ordered_by_reverse_created_at, -> { order('created_at ASC') }
  # validates title is at least 5 and body is at least 20
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
