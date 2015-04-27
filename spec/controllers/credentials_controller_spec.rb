require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CredentialsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Credential. As you add validations to Credential, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for :credential
  }

  let(:valid_new_attributes) {
    FactoryGirl.attributes_for :credential, user: user
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for :credential, password_confirmation: 'x'
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CredentialsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user) { FactoryGirl.create :user }

  before :each do
    allow(subject).to receive(:current_user).and_return user
  end

  describe "GET #index" do
    it "assigns all credentials as @credentials" do
      credential = Credential.create! valid_new_attributes
      get :index, {}, valid_session
      expect(assigns(:credentials)).to eq([credential])
    end
  end

  describe "GET #show" do
    it "assigns the requested credential as @credential" do
      credential = Credential.create! valid_new_attributes
      get :show, {:id => credential.to_param}, valid_session
      expect(assigns(:credential)).to eq(credential)
    end
  end

  describe "POST #test" do
    let(:credential) { FactoryGirl.create :credential, valid_new_attributes }

    it "assigns the requested credential as @credential" do
      post :test, id: credential.id, credential: { password: 'abc123' }
      expect(assigns(:credential)).to eq(credential)
    end

    context "correct credentials" do
      before :each do
        post :test, id: credential.id, credential: { password: 'abc123' }
      end

      it "loads a success message" do
        expect(flash[:success]).to match /The provided password is correct/
      end

      it "renders 'show' view" do
        expect(response).to render_template :show
      end
    end

    context "incorrect credentials" do
      before :each do
        post :test, id: credential.id, credential: { password: 'abc123x' }
      end

      it "loads an error message" do
        expect(flash[:error]).to match /The provided password is incorrect/
      end

      it "renders 'show' view" do
        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    it "assigns a new credential as @credential" do
      get :new, {}, valid_session
      expect(assigns(:credential)).to be_a_new(Credential)
    end
  end

  describe "GET #edit" do
    it "assigns the requested credential as @credential" do
      credential = Credential.create! valid_new_attributes
      get :edit, {:id => credential.to_param}, valid_session
      expect(assigns(:credential)).to eq(credential)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Credential" do
        expect {
          post :create, {:credential => valid_attributes}, valid_session
        }.to change(Credential, :count).by(1)
      end

      it "assigns a newly created credential as @credential" do
        post :create, {:credential => valid_attributes}, valid_session
        expect(assigns(:credential)).to be_a(Credential)
        expect(assigns(:credential)).to be_persisted
      end

      it "redirects to the created credential" do
        post :create, {:credential => valid_attributes}, valid_session
        expect(response).to redirect_to(Credential.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved credential as @credential" do
        post :create, {:credential => invalid_attributes}, valid_session
        expect(assigns(:credential)).to be_a_new(Credential)
      end

      it "re-renders the 'new' template" do
        post :create, {:credential => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for :credential, password: 'qwerty', password_confirmation: 'qwerty'
      }

      it "updates the requested credential" do
        credential = Credential.create! valid_new_attributes
        expect{
          put :update, {:id => credential.to_param, :credential => new_attributes}, valid_session
        }.to change{ credential.reload.password_digest }
      end

      it "assigns the requested credential as @credential" do
        credential = Credential.create! valid_new_attributes
        put :update, {:id => credential.to_param, :credential => valid_attributes}, valid_session
        expect(assigns(:credential)).to eq(credential)
      end

      it "redirects to the credential" do
        credential = Credential.create! valid_new_attributes
        put :update, {:id => credential.to_param, :credential => valid_attributes}, valid_session
        expect(response).to redirect_to(credential)
      end
    end

    context "with invalid params" do
      it "assigns the credential as @credential" do
        credential = Credential.create! valid_new_attributes
        put :update, {:id => credential.to_param, :credential => invalid_attributes}, valid_session
        expect(assigns(:credential)).to eq(credential)
      end

      it "re-renders the 'edit' template" do
        credential = Credential.create! valid_new_attributes
        put :update, {:id => credential.to_param, :credential => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested credential" do
      credential = Credential.create! valid_new_attributes
      expect {
        delete :destroy, {:id => credential.to_param}, valid_session
      }.to change(Credential, :count).by(-1)
    end

    it "redirects to the credentials list" do
      credential = Credential.create! valid_new_attributes
      delete :destroy, {:id => credential.to_param}, valid_session
      expect(response).to redirect_to(credentials_url)
    end
  end

end
