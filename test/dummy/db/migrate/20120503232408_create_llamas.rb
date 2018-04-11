# frozen_string_literal: true

class CreateLlamas < ActiveRecord::Migration
  def change
    create_table :llamas do |t|
      t.string :name
      t.integer :price_in_cents
    end
  end
end
