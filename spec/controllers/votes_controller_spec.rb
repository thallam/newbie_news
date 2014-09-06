require 'rails_helper'
include Devise::TestHelpers

describe VotesController do

  describe "#up_vote" do
    it "adds an up-tove to the post" do
      sign_in sample_user

      expect{
        post( :up_vote, post_id: sample_post.id)
      }.to change{sample_post.up_votes }.by 1

    end

  end

end
