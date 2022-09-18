class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.integer :number

      t.timestamps
    end
    add_index :tables, :number, unique: true
  end
end
