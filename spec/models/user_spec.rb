require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

  # associates user to post
  it { is_expected.to have_many(:posts) }
  #associates user to comment
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:votes) }
  it { is_expected.to have_many(:favorites) }

  # Shoulda tests for name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  # Shoulda tests for email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@bloccit.com").for(:email) }

  # Shoulda tests for password
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
    end

    # # users respond to role
    it "responds to role" do
      expect(user).to respond_to(:role)
    end

    # #responds to admin is user is admin
    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

    # #returns whether user is memeber or not
    it "responds to member?" do
      expect(user).to respond_to(:member?)
    end
  end

  # test roles
  describe "roles" do
    # #users assigned member role by default
    it "is member by default" do
      expect(user.role).to eq("member")
    end

    # #test member users
    context "member user" do
      it "returns true for #member?" do
        expect(user.member?).to be_truthy
      end

      it "returns false for #admin?" do
        expect(user.admin?).to be_falsey
      end
    end

    # test admin users
    context "admin user" do
      before do
        user.admin!
      end

      it "returns false for #member?" do
        expect(user.member?).to be_falsey
      end

      it "returns true for #admin?" do
        expect(user.admin?).to be_truthy
      end
    end
  end

# #testing for value that should be invalid
 describe "invalid user" do
  let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
  let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }

  it "should be an invalid user due to blank name" do
    expect(user_with_invalid_name).to_not be_valid
  end

  it "should be an invalid user due to blank email" do
    expect(user_with_invalid_email).to_not be_valid
  end
 end

 describe "#favorite_for(post)" do
     before do
       topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
       @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
     end

     it "returns `nil` if the user has not favorited the post" do
 # #expect return nil if user didn't favor @post
       expect(user.favorite_for(@post)).to be_nil
     end

     it "returns the appropriate favorite if it exists" do
 # # create favorite for user and @post
       favorite = user.favorites.where(post: @post).create
 # # expect return favorite we created
       expect(user.favorite_for(@post)).to eq(favorite)
     end
   end

# RSpec ends
end
