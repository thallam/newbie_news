module Factories
  def sample_topic()
    Topic.create!(
      name: "Test Topic",
      description: "Test Topic Description with more length"
      )
  end

  def sample_user
    user = User.new(
      name:       "Timmy Test",
      email:      "timmytest@example.com",
      password:   "helloworld"
      )
    user.skip_confirmation!
    user.save!
    user
  end

  def sample_post
    Post.create!(title: 'post title', body: 'post body which is more than twenty characters',
      topic: sample_topic, user: sample_user)
  end

  def post_without_user(options={})
    post_options = {title: 'Post title', body: 'Post bodies must be pretty long'}
      .merge(options)

    post = Post.new(post_options)
    allow(post).to receive(:create_vote)
    post.save
    post


  end
end
