require 'rails_helper'

RSpec.describe "credentials/show", type: :view do
  let(:user) { FactoryGirl.create :user }

  before(:each) do
    @credential = assign(:credential, Credential.create!(
      :name => "Name",
      :login => "Login",
      :password => "Password",
      :url => "Url",
      :restrictions => "MyText",
      :user => user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Login/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
  end
end
