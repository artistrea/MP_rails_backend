require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'when using standard factory' do
    it 'creates valid record' do
      order = build(:order)
      expect(order).to be_valid
    end
  end

  context 'when using empty property' do
    it 'invalidates if no user' do
      order = build(:order, user: nil)
      expect(order).not_to be_valid
    end

    it 'invalidates if no client' do
      order = build(:order, client: nil)
      expect(order).not_to be_valid
    end

    it 'invalidates if empty products' do
      order = build(:order, products: [])
      expect(order).not_to be_valid
    end
  end
end
