require 'rails_helper'

feature 'Handling sessions' do
  let(:user) { FactoryGirl.create :user }

  background do
    user
  end

  scenario "loging in" do
    visit root_path
    expect(current_path).to eq login_path
    expect(page).to have_content "You are not authorized to access this page."
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'abc123'
    click_button 'Log in'
    expect(current_path).to eq root_path
    expect(page).to have_content "You have signed in successfuly"
  end
end
