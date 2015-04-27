require "rails_helper"

feature "Handling credentials" do
  let(:user) { FactoryGirl.create :user }
  let(:credential) { FactoryGirl.create :credential, user: user }

  background do
    credential
    sign_in user.email, "abc123"
  end

  scenario "testing correct credential", js: true do
    navigate_to "Credentials"
    within first("table.table tbody tr") do
      click_link "Test password"
    end
    fill_in "Password", with: "abc123"
    click_button "Test password"
    expect(page).to have_content "The provided password is correct"
  end

  scenario "testing wrong credential", js: true do
    navigate_to "Credentials"
    within first("table.table tbody tr") do
      click_link "Test password"
    end
    fill_in "Password", with: "abc123x"
    click_button "Test password"
    expect(page).to have_content "The provided password is incorrect"
  end

  def navigate_to link_name
    within ".navbar" do
      click_link link_name
    end
  end
  
  def sign_in email, password
    visit login_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

end
