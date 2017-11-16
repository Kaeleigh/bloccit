require 'rails_helper'

RSpec.describe Post, type: :model do
  #  creates random data under each attribute
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
 # #create parent topic for topic
  let(:topic) { Topic.create!(name: name, description: description) }
 # # we associate post with topic via topic.posts.create!
  let(:post) { topic.posts.create!(title: title, body: body) }

  it { is_expected.to belong_to(:topic) }

  # # test whether post has attributes title and body, when called if post will return non-nil value
  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: title, body: body)
    end
  end
end
