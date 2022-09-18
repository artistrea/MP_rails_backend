class Product < ApplicationRecord
    validates :name, :description, :quantity_in_stock, :prep_time_in_minutes, presence: true
    validates :name, uniqueness: true
end
