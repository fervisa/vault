require 'rails_helper'

RSpec.describe "credentials/edit", type: :view do
  let(:user) { FactoryGirl.create :user }

  before(:each) do
    @credential = assign(:credential, Credential.create!(
      :name => "MyString",
      :login => "MyString",
      :password => "MyString",
      :url => "MyString",
      :restrictions => "MyText",
      :user => user
    ))
  end

  it "renders the edit credential form" do
    render

    assert_select "form[action=?][method=?]", credential_path(@credential), "post" do

      assert_select "input#credential_name[name=?]", "credential[name]"

      assert_select "input#credential_login[name=?]", "credential[login]"

      assert_select "input#credential_password[name=?]", "credential[password]"

      assert_select "input#credential_url[name=?]", "credential[url]"

      assert_select "textarea#credential_restrictions[name=?]", "credential[restrictions]"
    end
  end
end
