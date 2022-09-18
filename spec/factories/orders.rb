FactoryBot.define do
  factory :order do
    sequence(:user) { |n| create(:user, email: "admi@mail#{n}teste.com") }
    sequence(:client) { |n| create(:client) }
    sequence(:products) { |n| [create(:product, name: "Produto num #{n}")] }
    status { 1 }
  end
end
