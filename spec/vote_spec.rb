require 'rails_helper'

describe Vote do
  describe "validations" do


    describe "value validation" do
      it "only allows -1 or 1 as values" do

        v1 = Vote.new(value: 1 )
        v2 = Vote.new(value: -1)
        v3 = Vote.new(value: 2)

        expect(v1.valid?).to  eq(true)
        expect(v2.valid?).to  eq(true)
        expect(v3.valid?).to  eq(false)
      end
    end
  end

  describe "after save" do
    it "calls 'Post#updafte_rank' after save" do
      post = sample_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
end

end
