class ChangePriceColumnOfProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :price_in_cents


    add_column :products, :price_in_cents, :integer
  end
end
