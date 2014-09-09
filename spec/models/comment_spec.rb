require 'rails_helper'

describe Comment do

  describe "after_create" do

    before do
      @post = post_without_user
      @user = sample_user
      @comment = Comment.new(body: 'My comment', post: @post, user_id: 10000)
    end

    context "with users permission" do

      it "sends an email to users who have favorited the post" do
        @user.favorites.where(post: @post).create

        allow(FavoriteMailer)
        .to receive(:new_comment)
        .with(@user, @post, @comment)
        .and_return( double(deliver: true))

        @comment.save

      end

      it "does not send emails to users who haven't favorited a post" do
        expect(FavoriteMailer)
          .not_to receive(:new_comment)

        @comment.save
      end
    end

    context "without users permission" do
      before { @user.update_attribute(:email_favorites, false)}

      it "doesn't send emails, even to users who have favorited the post" do
        @user.favorites.where(post: @post).create

        expect(FavoriteMailer)
        .not_to receive(:new_comment)


        @comment.save
      end
    end
  end

end
