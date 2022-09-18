# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :quantity_in_stock
      t.integer :prep_time_in_minutes

      t.timestamps
    end
  end
end
