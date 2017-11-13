require 'random_data'

 # Create Posts
 50.times do
 # #1 creates new Post with ! that raises errors if there's a problem
   Post.create!(
 # #2 creates random strings for title and body, RandomData class is not defined yet
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 # #3 loop runs 100 times
100.times do
  Comment.create!(
# #4 called sample on array returned by Post.all
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create Questions
100.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
