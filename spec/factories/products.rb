# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'Produto' }
    description { 'Desc qualquer' }
    quantity_in_stock { 0 }
    prep_time_in_minutes { 10 }
    price_in_cents { 1000 }
  end
end
