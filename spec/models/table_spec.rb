require 'rails_helper'

RSpec.describe Table, type: :model do
  context 'when using standard factory' do
    it 'creates valid record' do
      table = build(:table)
      expect(table).to be_valid
    end
  end

  context 'when using repeated number' do
    it 'should not be valid' do
      create(:table)
      table = build(:table)
      expect(table).to_not be_valid
    end
  end
end
