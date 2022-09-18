require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when using standard factory' do
    it 'creates valid record' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  context 'when empty in required field' do
    it 'should not validate email' do
      user = build(:user, email: "")
      expect(user).to_not be_valid
    end

    it 'should not validate password' do
      user = build(:user, password: "")
      expect(user).to_not be_valid
    end

    it 'should not validate user_type' do
      user = build(:user, user_type: nil)
      expect(user).to_not be_valid
    end
  end

  context 'when invalid format field' do
    it 'should not validate smaller than six chars password' do
      user = build(:user, password: "12345")
      expect(user).to_not be_valid
    end

    it 'should not validate user_type of -1 or less' do
      user = build(:user, user_type: -1)
      expect(user).to_not be_valid
    end
    
    it 'should not validate user_type of 3 or more' do
      user = build(:user, user_type: 3)
      expect(user).to_not be_valid
    end
  end
end
