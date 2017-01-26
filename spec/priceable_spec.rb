# frozen_string_literal: true
require 'spec_helper'

describe Priceable do
  let(:llama) { Llama.new }

  it 'creates a getter method' do
    llama.price_in_cents = 10_000
    expect(llama.price).to eq 100
  end

  describe 'setter' do
    it 'saves 200.10 as 20010' do
      llama.price = 200.10
      expect(llama.price_in_cents).to eq 20_010
    end

    it 'saves 285.534 as 28553' do
      llama.price = 285.534
      expect(llama.price_in_cents).to eq 28_553
    end

    it 'saves 285.535 as 28554' do
      llama.price = 285.535
      expect(llama.price_in_cents).to eq 28_554
    end
  end

  it 'returns 0.0 if nil' do
    expect(llama.price).to eq 0
  end

  it 'shows a warning message if there is no database field set' do
    expect($stdout).to(
      receive(:puts).with("WARNING: Priceable field for `cost' is not found")
    )
    Pig.priceable :cost
  end
end
