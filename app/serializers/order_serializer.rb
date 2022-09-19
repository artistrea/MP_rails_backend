class OrderSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :client, :products, :status
end
