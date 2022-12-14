class Table < ApplicationRecord
  has_many :clients, class_name: 'client', foreign_key: 'client_id',
                     dependent: :nullify, inverse_of: :table
  validates :number, uniqueness: true
end
