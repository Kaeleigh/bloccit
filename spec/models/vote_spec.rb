require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:vote) { Vote.create!(value: 1, post: post, user: user) }

 # #test votes that belong to posts and users
   it { is_expected.to belong_to(:post) }
   it { is_expected.to belong_to(:user) }
 # #test value is present when votes are created
   it { is_expected.to validate_presence_of(:value) }
 # # validate value is -1(down) or 1 (up)
   it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }

   describe "update_post callback" do
     it "triggers update_post on save" do
 # #method to be called on vote after it's saved
       expect(vote).to receive(:update_post).at_least(:once)
       vote.save!
     end

     it "#update_post should call update_rank on post " do
 # # expect vote's post receives call to method
       expect(post).to receive(:update_rank).at_least(:once)
       vote.save!
     end
   end
# closes RSpec
end
