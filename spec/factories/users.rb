FactoryBot.define do
  factory :user do
    fullname { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    gender { 1 }
  end
end
