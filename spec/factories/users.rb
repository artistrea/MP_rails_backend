FactoryBot.define do
  factory :user do
    email { 'test@mail.com' }
    user_type { 0 }
    password { '123456' }
  end
end
