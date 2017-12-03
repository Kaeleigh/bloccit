require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # hash of attributes set to new_user_attributes
  let(:new_user_attributes) do
    {
      name: "BlocHead",
      email: "blochead@bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
    }
  end

  # test new action for HTTP success when issuing GET
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "instantiates a new user" do
      get :new
      expect(assigns(:user)).to_not be_nil
    end
  end

  # test create action
  describe "POST create" do
    it "returns an http redirect" do
      post :create, params: { user: new_user_attributes }
      expect(response).to have_http_status(:redirect)
    end
    # this tests db count of users & increase by 1 when new user created
    it "creates a new user" do
      expect{
        post :create, params: { user: new_user_attributes }
      }.to change(User, :count).by(1)
    end
    # allows user to set a name
    it "sets user name properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end
    # allows user to set email
    it "sets users email properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end
    # allows user to set password
    it "sets user password properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end
    #confirms password is set properly
    it "sets user password_confirmation properly" do
      post :create, params: { user: new_user_attributes }
      expect(
      assigns(:user).password_confirmation
      ).to eq new_user_attributes[:password_confirmation]
    end
    #checks a user is signed in after signing up
    it "logs the user in after sign up" do
      post :create, params: { user: new_user_attributes }
      expect(session[:user_id]).to eq assigns(:user).id
    end
  end

  describe "not signed in" do
    # # variable factory_user to create user obj
    let(:factory_user) { create(:user) }

    before do
      post :create, params: { user: new_user_attributes }
    end

    # #standared tests for show
    it "returns http success" do
      get :show, params: {id: factory_user.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: factory_user.id}
      expect(response).to render_template :show
    end

    it "assigns factory_user to @user" do
      get :show, params: {id: factory_user.id}
      expect(assigns(:user)).to eq(factory_user)
    end
  end


  #RSpec ends
end
