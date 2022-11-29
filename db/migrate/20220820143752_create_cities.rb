# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.integer :pop1991, null: false
      t.integer :pop2000, null: false
      t.integer :pop2010, null: false

      t.timestamps
    end
  end
end
