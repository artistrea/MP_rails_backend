require 'faker'

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@mail.com', password: '123456', user_type: 2)


(0...4).each do |n|
    Product.create(name: Faker::Food.dish,
        description: Faker::Food.description, price_in_cents: 1000,
        quantity_in_stock: n,prep_time_in_minutes: n
    )
end

