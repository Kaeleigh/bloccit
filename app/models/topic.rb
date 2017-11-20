class Topic < ApplicationRecord
  #topic is associated with Posts and post delete depends on topic
  has_many :posts, dependent: :destroy

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
  
end
