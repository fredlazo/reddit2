require 'faker'

15.times do
  Topic.create!(
    name:         Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
  )
end
topics = Topic.all


50.times do
  Post.create!(
    topic: topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
# #4
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
 puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
