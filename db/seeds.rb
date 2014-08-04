require 'faker'

puts "Seeding data"

# 5.times{
#   Post.create(
# title: Faker::Company.catch_phrase.to_s,
# body: Faker::Lorem.paragraph.to_s
#   )
# }

# Post.all.each do |post|
#   3.times{post.comments.create(body: Faker::Lorem.sentences.to_s)}
# end

# puts "Seeding complete"

#Create Users

5.times do
  user = User.new(
    name:   Faker::Name.name,
    email:  Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
  end
users = User.all

# Create Posts

50.times do
  Post.create(
user:   users.sample,
title:  Faker::Company.catch_phrase,
body:   Faker::Lorem.paragraph
    )
  end
  posts = Post.all

100.times do
Comment.create(
post: posts.sample,
body: Faker::Lorem.paragraph
  )
end

tom = User.first
tom.update_attributes(
  name:   'Tom'
  email: 'thllm01@gmail.com',
  password: 'newbienews')
tom.skip_confirmation!
tom.save

puts "Seeding Complete"
puts "#{User.count} users created "
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"





