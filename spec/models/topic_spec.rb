require 'rails_helper'

RSpec.describe Topic, type: :model do
  # creates random data for posts
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:public) { true }
  let(:topic) { Topic.create!(name: name, description: description) }

  it { is_expected.to have_many(:posts) }

  # test Topic validates presence of name, description
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }

  # test also validates lengths of name and description
  it { is_expected.to validate_length_of(:name).is_at_least(5) }
  it { is_expected.to validate_length_of(:description).is_at_least(15) }

  # #confirms topic has certain attributes
  describe "attributes" do
    it "has name, description, and public attributes" do
      expect(topic).to have_attributes(name: name, description: description, public: public)
    end

    # #confirm attribute public is true
    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end
  # ends RSpec
end
