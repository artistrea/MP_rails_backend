class Table < ApplicationRecord
  has_many :clients, class_name: "client", foreign_key: "client_id"
  validates :number, uniqueness: true
end
