require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # created a post and assigned to my_post using let, RandomData used to give a random title and body
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    # expect index to return array of one item
    it "assigns [my_post] to @posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post])
    end
  end

  #commented tests for show, new and edit for later implementation
  #describe "GET #show" do
  #  it "returns http success" do
  #    get :show
  #    expect(response).to have_http_status(:success)
  #  end
  #  end

  #  describe "GET #new" do
  #    it "returns http success" do
  #      get :new
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

  #  describe "GET #edit" do
  #    it "returns http success" do
  #      get :edit
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

end
