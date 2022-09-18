class Client < ApplicationRecord
  belongs_to :table, class_name: 'table'
end
