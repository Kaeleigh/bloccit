require 'random_data'

# Create Users
5.times do
  User.create!(
  #two methods to create random names and emails
  name: RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence
  )
end
#returns collection of User objects
users = User.all

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
    # samples of user created
     user: users.sample,
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

# add one user that will be used as tester
user = User.first
user.update_attributes!(
  email: 'hilllucy4@gmail.com',
  password: 'helloworld'
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
