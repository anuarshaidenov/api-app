FactoryBot.define do
  factory :user do
    fullname { "MyString" }
    email { "test@me.me" }
    password { "MyString" }
    gender { 1 }
  end
end
