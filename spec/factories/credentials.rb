FactoryGirl.define do
  factory :credential do
    name "MyString"
    login "MyString"
    password "abc123"
    password_confirmation "abc123"
    url "MyString"
    restrictions "MyText"
  end

end
