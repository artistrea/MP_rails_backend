class AddPriceInCentsToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price_in_cents, :decimal
  end
end
