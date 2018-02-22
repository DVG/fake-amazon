FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    username { "SomeUser" }
    password 'somepassword'
    password_confirmation { |u| u.password }
  end
end
