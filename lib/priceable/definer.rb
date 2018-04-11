# frozen_string_literal: true

module Priceable
  # price_fields definer
  class Definer
    SUFFIXES = %w[_in_cents _in_pennies _as_integer].freeze
    def initialize(model, price_fields)
      @model = model
      price_fields.each do |field|
        @field = field
        unless suffix
          puts "WARNING: Priceable field for `#{field}' is not found"
          next
        end
        define_getter
        define_setter
      end
    end

    private

    def define_getter
      getter_field = :"#{field}#{suffix}"
      model.define_method field do
        if send(getter_field).nil?
          0.0
        else
          send(getter_field) / 100.0
        end
      end
    end

    def define_setter
      setter_field = :"#{field}#{suffix}="
      model.define_method "#{field}=" do |new_price|
        send(setter_field, (new_price.to_f * 100).round)
      end
    end

    def suffix
      SUFFIXES.detect do |suf|
        model.attribute_method? :"#{field}#{suf}"
      end
    end

    attr_accessor :model, :field
  end
end
