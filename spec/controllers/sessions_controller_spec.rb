require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { FactoryGirl.create :user }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "loads new user as @user" do
      get :new
      expect(assigns(:user)).to be_a User
    end
  end

  describe "GET #create" do
    context "when user exists" do  
      it "redirects to root path" do
        post :create, user: { email: user.email, password: "abc123" }
        expect(response).to redirect_to root_path
      end

      it "loads a success message" do
        post :create, user: { email: user.email, password: "abc123" }
        expect(flash[:notice]).to match "You have signed in successfuly"
      end
    end

    context "when user does not exist" do  
      it "renders 'new' template" do
        post :create, user: { email: "noone@mail.com", password: "abc123" }
        expect(response).to render_template :new
      end

      it "loads user with email" do
        post :create, user: { email: "noone@mail.com", password: "abc123" }
        expect(assigns(:user).email).to eq "noone@mail.com"
      end

      it "loads an error message" do
        post :create, user: { email: "noone@mail.com", password: "abc123" }
        expect(flash[:alert]).to match "Wrong email or password"
      end
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
