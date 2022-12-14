class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :client, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
