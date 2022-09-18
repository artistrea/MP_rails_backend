FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "teste@mail#{n}t.com" }
    user_type { 0 }
    password { '123456' }
  end
end
