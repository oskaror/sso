FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }

    password { 'password' }
    role { 'user' }

    trait :admin do
      role { 'admin' }
    end
  end
end