require 'rails_helper'

RSpec.describe "credentials/index", type: :view do
  let(:user) { FactoryGirl.create :user }

  before(:each) do
    assign(:credentials, [
      Credential.create!(
        :name => "Name",
        :login => "Login",
        :password => "Password",
        :url => "Url",
        :restrictions => "MyText",
        :user => user
      ),
      Credential.create!(
        :name => "Name",
        :login => "Login",
        :password => "Password",
        :url => "Url",
        :restrictions => "MyText",
        :user => user
      )
    ])
  end

  it "renders a list of credentials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
