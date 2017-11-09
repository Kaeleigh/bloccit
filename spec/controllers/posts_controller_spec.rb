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

  # test for showing, creating and editing posts
  describe "GET show" do
    it "returns http success" do
      # parameters passed to params hash
      get :show, params: { id: my_post.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
# # return show view using render_template
      get :show, params: { id: my_post.id }
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: { id: my_post.id }
# #expect post to equal var my_post
      expect(assigns(:post)).to eq(my_post)
    end
  end
  
  # create and new posts
   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end

     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end

     it "instantiates @post" do
       get :new
       expect(assigns(:post)).not_to be_nil
     end
   end

   describe "POST create" do
     it "increases the number of Post by 1" do
       expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph} } }.to change(Post,:count).by(1)
     end
     it "assigns the new post to @post" do
       post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(assigns(:post)).to eq Post.last
     end
     it "redirects to the new post" do
        post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(response).to redirect_to Post.last
      end
    end

  #  describe "GET #edit" do
  #    it "returns http success" do
  #      get :edit
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

end
