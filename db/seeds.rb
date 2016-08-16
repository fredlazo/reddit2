require 'faker'

50.times do
# #1
  Post.create!(
# #2
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
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
