require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'when using standar factory' do
    it 'should create record' do
      product = build(:product)
      expect(product).to be_valid
    end
  end
end
