require 'rails_helper'

RSpec.describe Topic, type: :model do
  # creates random data for posts
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:public) { true }
  let(:topic) { create(:topic) }

  it { is_expected.to have_many(:posts) }

  # #confirms topic has certain attributes
  describe "attributes" do
    it "has name, description, and public attributes" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description)
    end

    # #confirm attribute public is true
    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end
  # ends RSpec
end
