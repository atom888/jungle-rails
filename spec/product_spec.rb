require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before :each do
      @category = Category.create!(name: 'Fun')
    end

    it 'product should be valid with all parameters met' do
      @product = Product.new(name: 'a', price: 1, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it 'product should be invalid if name is nil' do
     @product = Product.new(name: nil, price: 1, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can't be blank")

    end

    it 'product should be invalid if price is nil' do
     @product = Product.new(name: 'a', price: nil, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:price]).to include("is not a number")

    end

    it 'product should be invalid if quantity is nil' do
     @product = Product.new(name: 'a', price: 1, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:quantity]).to include("can't be blank")

    end

    it 'product should be invalid if category is nil' do
     @product = Product.new(name: 'a', price: 1, quantity: 1, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end