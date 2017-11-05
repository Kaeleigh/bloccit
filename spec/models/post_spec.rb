require 'rails_helper'

RSpec.describe Post, type: :model do
  # #1 created new instance of Post class
  let(:post) {Post.create!(title: "New Post Title", body: "New Post Body") }

  # #2 test whether post has attributes title and body, when called if post will return non-nil value
  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
    end
  end
end
