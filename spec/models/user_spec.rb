require 'rails_helper'

RSpec.describe User, type: :model do
    
  before(:each) do
    @new_user = User.new(first_name: "John", last_name: "Doe", email: 'johndoe@gmail.com', password: "asdf", password_confirmation: "asdf")
  end
    
  describe 'Validations' do

    it 'saves successfully when all four fields are set' do
      @new_user.valid?
      expect(@new_user.errors).to be_empty
    end

    it 'fails to save when email is not set' do
      @new_user.email = nil
      @new_user.valid?
      expect(@new_user.errors).not_to be_empty
    end

    it 'fails to save when first name is not set' do
      @new_user.first_name = nil
      @new_user.valid?
      expect(@new_user.errors).not_to be_empty
    end

    it 'fails to save when last name is not set' do
      @new_user.last_name = nil
      @new_user.valid?
      expect(@new_user.errors).not_to be_empty
    end

    it 'fails to save when password is not set' do
      @new_user.password = nil
      @new_user.valid?
      expect(@new_user.errors).not_to be_empty
    end

    it 'fails to save when password_confirmation is not set' do
      @new_user.password_confirmation = nil
      @new_user.valid?
      expect(@new_user.errors).not_to be_empty
    end

    it 'fails to save when password and password_confirmation does not match' do
      @new_user.password_confirmation = 'asd'
      @new_user.valid?
      expect(@new_user.errors).not_to be_empty
    end

    it 'fails to save when email is not unique (not case sensitive)' do
      User.create(:first_name => 'John', :last_name => 'Doe', :email => 'JOHNDOE@gmail.com', :password => "asdf", :password_confirmation => "asdf")
      @new_user.valid?
      expect(@new_user.errors).not_to be_empty
    end
      
    describe '.authenticate_with_credentials' do
      it 'returns user if passes authentication' do
        @new_user.save
        user = User.authenticate_with_credentials('johndoe@gmail.com', 'asdf')
        expect(@new_user).to eql(user)
      end

      it 'returns nil if fails authentication' do
        @new_user.save
        user = User.authenticate_with_credentials('johndoe@gmail.com', 'fsda')
        expect(user).to eql(nil)
      end

      it 'authentication still passes if white spaces present before/after email' do
        @new_user.save
        user = User.authenticate_with_credentials(' johndoe@gmail.com ', 'asdf')
        expect(@new_user).to eql(user)
      end

      it 'authentication still passes if email is a mixture of upper/lower case' do
        @new_user.save
        user = User.authenticate_with_credentials('joHndOE@gmail.com', 'asdf')
        expect(@new_user).to eql(user)
      end
    end
    
  end
end


