require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before :each do
      @correct_password = 'nice'
      @correct_password_confirm = 'nice'
      @incorrect_password = 'bad'
    end


    it 'user is valid if all parameters are met - password matches password confirmation' do
    @user = User.new(first_name: 'a', last_name: 'b', email: 'a@a.com', password: @correct_password, password_confirmation: @correct_password_confirm)
    expect(@user).to be_valid
    end

    it 'user is invalid due to password confirmation not matching password' do
      @user = User.new(first_name: 'a', last_name: 'b', email: 'a@a.com', password: @incorrect_password, password_confirmation: @correct_password_confirm)
    expect(@user).to_not be_valid
    expect(@user.errors[:password_confirmation]).to include("doesn't match Password")

    end

    # it 'user is valid due - removing case sensitivity in email' do
    #   @user = User.new(first_name: 'a', last_name: 'b', email: 'AA@AA.com', password: @correct_password, password_confirmation: @correct_password_confirm)
    # expect(@user).to_not be_valid
    # expect(@user.errors[:email]).to include("WTF?")
    # end

    it 'user is invalid if first_name is nil' do
      @user = User.new(first_name: nil, last_name: 'b', email: 'a@a.com', password: @correct_password, password_confirmation: @correct_password_confirm)
    expect(@user).to_not be_valid
    expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'user is invalid if last_name is nil' do
      @user = User.new(first_name: 'a', last_name: nil, email: 'a@a.com', password: @correct_password, password_confirmation: @correct_password_confirm)
    expect(@user).to_not be_valid
    expect(@user.errors[:last_name]).to include("can't be blank")
    end

     it 'user is invalid if email is nil' do
      @user = User.new(first_name: 'a', last_name: nil, email: nil, password: @correct_password, password_confirmation: @correct_password_confirm)
    expect(@user).to_not be_valid
    expect(@user.errors[:email]).to include("can't be blank")
    end



  end
end