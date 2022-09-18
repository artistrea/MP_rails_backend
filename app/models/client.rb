class Client < ApplicationRecord
  has_many :orders, dependent: :nullify
  belongs_to :table
end
