class Post < ApplicationRecord
  # post nested under Topics
  belongs_to :topic
  belongs_to :user
  # comments dependent on a post's existence, makes sure all comments are deleted when post is deleted.
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  after_create :create_vote

  default_scope {order('rank DESC') }
  # validates title is at least 5 and body is at least 20
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  #implement vote methods
  def up_votes
 # #fetches collection of votes with value 1, count gets total votes
     votes.where(value: 1).count
   end

   def down_votes
 # #fetches votes of value -1, count gets total votes
     votes.where(value: -1).count
   end

   def points
 # #sum method add value of all votes
     votes.sum(:value)
   end

   def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
   end

   private
   def create_vote
     user.votes.create(value: 1, post: self)
   end
# class ends
end
