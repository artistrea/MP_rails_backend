# frozen_string_literal: true

class Product < ApplicationRecord
  has_and_belongs_to_many :orders

  validates :name, :description, :quantity_in_stock, :prep_time_in_minutes, presence: true
  validates :name, uniqueness: true
  validates :quantity_in_stock, :prep_time_in_minutes, numericality: { greater_than_or_equal_to: 0 }
end
