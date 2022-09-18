require 'rails_helper'

RSpec.describe Client, type: :model do
  context 'when using standard factory' do
    it 'creates valid record' do
      client = build(:client)
      expect(client).to be_valid
    end
  end
end
