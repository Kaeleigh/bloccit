require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  # #1 describe subject of spec
  describe "GET index" do
    it "renders the index template" do
      # #2 get calls the index method of controller
      get:index
      # #3 expect the controller's response to show the index template
      expect(response).to render_template("index")
    end
  end

  describe "GET about" do
     it "renders the about template" do
       get :about
       expect(response).to render_template("about")
     end
   end

end
