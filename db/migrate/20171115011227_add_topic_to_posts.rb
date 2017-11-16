class AddTopicToPosts < ActiveRecord::Migration[5.1]
  #creates association between posts and topic
  def change
    #generator creates a migration that adds a topic_id column to posts table
    add_column :posts, :topic_id, :integer
    # generator created an index on topic_id
    add_index :posts, :topic_id
  end
end
