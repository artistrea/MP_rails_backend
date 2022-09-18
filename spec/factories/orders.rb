FactoryBot.define do
  factory :order do
    user { nil }
    client { nil }
    products { [] }
    status { 1 }
  end
end
