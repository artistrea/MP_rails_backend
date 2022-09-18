class Order < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :user
  belongs_to :client
end
