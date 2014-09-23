require 'rails_helper'

describe "Visiting profiles" do
  before do
    @user = sample_user
    @post = post_without_user(user: @user)
    @comment = Comment.create(user: @user, body: "A Comment")
    allow(@comment).to receive(:sent_favorite_emails)
    @comment.save
  end

  describe "not signed in" do
    it "shows profile" do
      visit user_path(@user)
      puts user_path(@user)
      expect(current_path).to eq(user_path(@user))


      expect(page).to  have_content(@user.name)
      expect(page).to  have_content(@comment.body)
      expect(page).to  have_content(@post.title)
    end

  end

end
