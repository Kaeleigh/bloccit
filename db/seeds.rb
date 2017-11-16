require 'random_data'

# Create Topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

 # Create Posts
 50.times do
 # # creates new Post with ! that raises errors if there's a problem
   Post.create!(
 # # creates random strings for title and body, RandomData class is not defined yet
     topic: topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 # # loop runs 100 times
100.times do
  Comment.create!(
# # called sample on array returned by Post.all
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end


puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
