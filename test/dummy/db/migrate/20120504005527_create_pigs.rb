# frozen_string_literal: true

class CreatePigs < ActiveRecord::Migration
  def change
    create_table :pigs do |t|
      t.string :name
      t.integer :price_in_pennies
    end
  end
end
