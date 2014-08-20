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
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
  end

users = User.all

#create Topics
15.times do
Topic.create(
  name: Faker::Lorem.sentence,
  description: Faker::Lorem.paragraph
  )
  end
topics = Topic.all





# Create Posts
puts "Creating Posts"
seed_posts = IO.readlines("/Users/tom/projects/ruby/bloc/newbienews/newbienews/tmp/misc/post_seed.txt")


seed_posts.each do |post|

  Post.create(
user:   users.sample,
topic: topics.sample,
title:  post,
body:   Faker::Lorem.paragraph
    )
  end

posts = Post.all
puts "Posts completed"




puts "Creating Special Users"
admin = User.new(
name:   'Admin User',
email:  'admin@example.com',
password: 'helloworld',
role:     'admin'
  )

admin.skip_confirmation!
admin.save

moderator = User.new(
name:   'moderator User',
email:  'moderator@example.com',
password: 'helloworld',
role:     'moderator'
  )

moderator.skip_confirmation!
moderator.save

member = User.new(
name:   'Member User',
email:  'member@example.com',
password: 'helloworld',
role:     'member'
  )

member.skip_confirmation!
member.save

100.times do
Comment.create(
post: posts.sample,
user: users.sample,
body: Faker::Lorem.paragraph
  )
end
puts "Seeding Complete"
puts "#{User.count} users created "
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"





