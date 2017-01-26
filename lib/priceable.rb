# frozen_string_literal: true
require 'priceable/version'

module Priceable
  SUFFIXES = %w(_in_cents _in_pennies _as_integer).freeze
  def priceable(*price_fields)
    price_fields.each do |price_field|
      suffix = SUFFIXES.detect do |suf|
        attribute_method? "#{price_field}#{suf}".to_sym
      end
      unless suffix
        puts "WARNING: Priceable field for `#{price_field}' is not found"
        next
      end

      define_method price_field do
        if send("#{price_field}#{suffix}".to_sym).nil?
          0.0
        else
          send("#{price_field}#{suffix}".to_sym) / 100.0
        end
      end

      define_method "#{price_field}=".to_sym do |new_price|
        send("#{price_field}#{suffix}=".to_sym, (new_price.to_f * 100).round)
      end
    end
  end
end

ActiveRecord::Base.extend Priceable
