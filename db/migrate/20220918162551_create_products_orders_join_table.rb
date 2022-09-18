class CreateProductsOrdersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :products, :orders do |t|
      t.index :product_id
      t.index :order_id
    end
  end
end
