require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'when using standard factory' do
    it 'creates valid record' do
      order = build(:order)
      expect(order).to be_valid
    end
  end
end
