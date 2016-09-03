require 'faker'

user = User.create!(
  email: 'fredlazo@yahoo.com', # replace this with your personal email
  username: 'fredlazo',
  password: 'password'
)

10.times do
  User.create!(

  username: Faker::Pokemon.name,
  email:    Faker::Internet.email,
  password: "password"
  )
end
users = User.all

15.times do
  Topic.create!(
    user: users.sample,
    name:         Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
  )
end
topics = Topic.all


50.times do
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )

post.update_attribute(:created_at, rand(10.minutes..1.year).ago)

rand(1..5).times {post.votes.create(value: [-1,1].sample, user: users.sample)}
end

posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

10.times do
# #1
  Advertisement.create!(
# #2
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph,
    price:  Faker::Commerce.price
  )
end
advertisements = Advertisement.all





puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Vote.count} votes created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
