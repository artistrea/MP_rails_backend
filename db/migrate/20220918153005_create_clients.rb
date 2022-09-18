class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.belongs_to :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
