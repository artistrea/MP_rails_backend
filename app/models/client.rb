class Client < ApplicationRecord
  has_many :orders
  belongs_to :table
end
