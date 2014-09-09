require 'rails_helper'

describe Comment do

  describe "after_create" do

    before do
      @post = post_without_user
      @user = sample_user
      @comment = Comment.new(body: 'My comment', post: @post, user_id: 10000)
    end
    it "sends an email to users who have favorited the post" do
      @user.favorites.where(post: @post).create

      allow ( FavoriteMailer )
      .to receive(:new_comment)
      .with(@user, @post, @comment)
      .and_return( double(deliver: true))

      @comment.save

    end

    it "does not send emails to users who haven't" do
      expect(FavoriteMailer).to
      .not_to receive(:new_comment)

      @comment.save
    end
  end

end