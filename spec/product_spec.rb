require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new ({name: 'test'})
      @product = @category.products.new({name: 'test product', price: 10, quantity: 1})
    end

    it 'should have a name field' do
      expect(@product.name).to be_present
    end

    it 'should have a price field' do      
      expect(@product.price).to be_present
    end

    it 'should have a quantity field' do      
      expect(@product.quantity).to be_present
    end

    it 'should have a category field' do      
      expect(@product.category).to be_present
    end
  end
end