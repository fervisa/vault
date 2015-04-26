FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{ n }@mail.com" }
    password "abc123"
    password_confirmation "abc123"
  end

end
