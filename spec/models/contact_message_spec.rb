require 'rails_helper'

RSpec.describe ContactMessage, type: :model do
  context 'when using standard factory' do
    it 'creates valid record' do
      contact_message = build(:contact_message)
      expect(contact_message).to be_valid
    end
  end

  context 'when it has no message' do
    it 'invalidates record' do
      contact_message = build(:contact_message)
      expect(contact_message).to_not be_valid
    end
  end
end
