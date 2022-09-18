FactoryBot.define do
  factory :order do
    user { nil }
    client { nil }
    product { "" }
    status { 1 }
  end
end
