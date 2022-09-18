# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'when using standard factory' do
    it 'creates record' do
      product = build(:product)
      expect(product).to be_valid
    end
  end

  context 'when using empty property' do
    it 'invalidates if empty name' do
      product = build(:product, name: '')
      expect(product).not_to be_valid
    end

    it 'invalidates if empty description' do
      product = build(:product, description: '')
      expect(product).not_to be_valid
    end

    it 'invalidates if empty quantity_in_stock' do
      product = build(:product, quantity_in_stock: nil)
      expect(product).not_to be_valid
    end

    it 'invalidates if empty prep_time_in_minutes' do
      product = build(:product, prep_time_in_minutes: nil)
      expect(product).not_to be_valid
    end
  end

  context 'when using invalid non-empty property' do
    it 'invalidates if negative quantity_in_stock' do
      product = build(:product, quantity_in_stock: -1)
      expect(product).not_to be_valid
    end

    it 'invalidates if negative prep_time_in_minutes' do
      product = build(:product, prep_time_in_minutes: -1)
      expect(product).not_to be_valid
    end
  end

  context 'when using repeated value for unique column' do
    it 'does not validate repeated name' do
      create(:product)
      product = build(:product)
      expect(product).not_to be_valid
    end
  end
end
