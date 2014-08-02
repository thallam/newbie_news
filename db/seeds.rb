require 'faker'
puts "Seeding data"

5.times{
  Post.create(
title: Faker::Company.catch_phrase.to_s,
body: Faker::Lorem.paragraph.to_s
  )
}

Post.all.each do |post|
  3.times{post.comments.create(body: Faker::Lorem.sentences.to_s)}
end

puts "Seeding complete"
