FactoryBot.define do
  factory :client do
    sequence(:table) { |n| create(:table, number: n) }
  end
end
