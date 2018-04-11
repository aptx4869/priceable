# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_120_504_005_527) do
  create_table 'llamas', force: :cascade do |t|
    t.string   'name'
    t.integer  'price_in_cents'
  end

  create_table 'pigs', force: :cascade do |t|
    t.string   'name'
    t.integer  'price_in_pennies'
  end
end
