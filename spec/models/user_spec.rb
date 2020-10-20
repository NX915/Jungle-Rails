require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do

    before do
      User.create ({first_name: 'first', last_name: 'last', email: 'test@test.com', password: '12345678', password_confirmation: '12345678'})
    end
    
    it 'should allow test user registration' do
      expect(User.find_by(first_name: 'first')).to be_present
    end
    
    it 'should allow proper formatted user registation' do
      @user = User.new ({first_name: 'first', last_name: 'last', email: 'test2@test.com', password: '12345678', password_confirmation: '12345678'})
      expect(@user).to be_valid
    end

    it 'should not allow empty first name' do
      @user = User.new ({first_name: '', last_name: 'last', email: 'test2@test.com', password: '12345678', password_confirmation: '12345678'})
      expect(@user).to_not be_valid
    end

    it 'should not allow empty last name' do
      @user = User.new ({first_name: 'first', last_name: '', email: 'test2@test.com', password: '12345678', password_confirmation: '12345678'})
      expect(@user).to_not be_valid
    end

    it 'should not allow empty email' do
      @user = User.new ({first_name: 'first', last_name: 'last', email: '', password: '12345678', password_confirmation: '12345678'})
      expect(@user).to_not be_valid
    end

    it 'should enforce minimal 8 characters long password' do
      @user = User.new ({first_name: 'first', last_name: 'last', email: 'test2@test.com', password: '1234567', password_confirmation: '1234567'})
      expect(@user).to_not be_valid
    end

    it 'should enforce password confirmation' do
      @user = User.new ({first_name: 'first', last_name: 'last', email: 'test2@test.com', password: '12345678', password_confirmation: '1234567asdf'})
      expect(@user).to_not be_valid
    end

    it 'should enforce unique email' do
      @user = User.new ({first_name: 'first', last_name: 'last', email: 'test@test.com', password: '12345678', password_confirmation: '12345678'})
      expect(@user).to_not be_valid
    end

  end
end
