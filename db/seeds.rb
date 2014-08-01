require faker
puts "Seeding data"

5.times{
  Post.create(
title: Faker::Company.catch_phrase,
body: Faker::Lorem.paragraph
  )
}

Post.all.each do |post|
  3.times{post.comments.create(body: Faker::Lorem.sentences)}
end

puts "Seeding complete"
