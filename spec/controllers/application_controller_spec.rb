require "rails_helper"

describe ApplicationController, type: :controller do
  let(:user) { FactoryGirl.create :user }

  controller do
    before_action :authenticate!

    def index
      render nothing: true
    end
  end

  describe "handling unauthorized access" do
    it "redirects to root page" do
      get :index
      expect(response).to redirect_to login_path
    end

    it "loads an error message" do
      get :index
      expect(flash[:alert]).to match /You are not authorized to access this page/
    end
  end

  describe "handling authorized access" do
    it "responds with 200" do
      allow(subject).to receive(:current_user).and_return user
      get :index
      expect(response.code).to eq '200'
    end
  end
end
