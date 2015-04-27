require 'rails_helper'

RSpec.describe "credentials/new", type: :view do
  before(:each) do
    assign(:credential, Credential.new(
      :name => "MyString",
      :login => "MyString",
      :password => "MyString",
      :url => "MyString",
      :restrictions => "MyText"
    ))
  end

  it "renders new credential form" do
    render

    assert_select "form[action=?][method=?]", credentials_path, "post" do

      assert_select "input#credential_name[name=?]", "credential[name]"

      assert_select "input#credential_login[name=?]", "credential[login]"

      assert_select "input#credential_password[name=?]", "credential[password]"

      assert_select "input#credential_url[name=?]", "credential[url]"

      assert_select "textarea#credential_restrictions[name=?]", "credential[restrictions]"
    end
  end
end
