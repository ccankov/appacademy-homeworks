require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:chris) { User.create(email: 'chris@fake.com', password: 'password') }
  # validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  describe '#is_password?' do
    it 'correctly validates password' do
      expect(chris.is_password?('password')).to be true
      expect(chris.is_password?('banana')).to be false
    end
  end

  describe '#reset_session_token' do
    it 'changes the session token' do
      old_token = chris.session_token
      chris.reset_session_token!
      expect(chris.session_token).to_not eq(old_token)
    end
    it 'returns the new token' do
      expect(chris.reset_session_token!).to eq(chris.session_token)
    end
  end

  describe 'class methods' do
    describe '::find_by_credentials' do
      it 'find a user given correct credentials' do
        chris = User.create(email: 'chris@fake.com', password: 'password')
        expect(User.find_by_credentials('chris@fake.com', 'password')).to eq(chris)
      end
      it 'does not find a user if the credentials do not match' do
        chris = User.create(email: 'chris@fake.com', password: 'password')
        expect(User.find_by_credentials('chris@fake.com', 'banana')).to eq(nil)
      end
    end
  end
end
