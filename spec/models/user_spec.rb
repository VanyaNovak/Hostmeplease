require 'rails_helper'

RSpec.describe User do
  context 'when valid' do
    let(:user_without_name) { build(:user, first_name: 'a' * 4) }
    let(:user_without_name_role) { build(:user, role: 'owner') }

    it 'creates an default user' do
      expect(user_without_name).to be_valid
    end

    it 'creates an user with owner role' do
      expect(user_without_name_role).to be_valid
    end
  end

  context 'when not valid' do
    let(:user_without_name_empty) { build(:user, first_name: '    ') }
    let(:user_without_name_unlimitted) { build(:user, first_name: '1' * 100) }
    let(:user_without_email) { build(:user, email: '') }
    let(:user_without_password) { build(:user, password: '') }
    let(:user_without_role) { build(:user, role: '') }

    it 'creates an user with space-name' do
      expect(user_without_name_empty).not_to be_valid
    end

    it 'creates an user with long name' do
      expect(user_without_name_unlimitted).not_to be_valid
    end

    it 'creates an user without email' do
      expect(user_without_email).not_to be_valid
    end

    it 'creates an user without password' do
      expect(user_without_password).not_to be_valid
    end

    it 'creates an user without role' do
      expect(user_without_role).not_to be_valid
    end
  end
end
