class Topic < ApplicationRecord
  #topic is associated with Posts and post delete depends on topic
  has_many :posts, dependent: :destroy
end
