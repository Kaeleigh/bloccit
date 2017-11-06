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

puts "#{Post.count}"
Post.find_or_create_by!(title: "A unique title", body: "A unique body")
puts "#{Comment.count}"

  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
