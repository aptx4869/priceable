# frozen_string_literal: true

require 'priceable/version'
require 'priceable/definer'

# Manage prices field
#
# rails g migration add_cost_to_llamas cost_in_cents:integer
# rake db:migrate
#
# app/models/llama.rb
# class Llama < ActiveRecord::Base
#   priceable :cost
# end
module Priceable
  def priceable(*price_fields)
    Definer.new(self, price_fields)
  end
end

ActiveRecord::Base.extend Priceable
