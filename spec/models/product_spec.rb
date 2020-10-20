require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new ({name: 'test'})
    end

    it 'should allow input with name, price, category and quantity' do
      @product = @category.products.new({name: 'test product', price: 10, quantity: 1})
      expect(@product).to be_valid
    end
    
    it 'should enforce a name field' do
      @product = @category.products.new({name: '', price: 10, quantity: 1})
      expect(@product).to_not be_valid
    end

    it 'should enforce a price field' do   
      @product = @category.products.new({name: 'test product', price: nil, quantity: 1})   
      expect(@product).to_not be_valid
    end

    it 'should enforce a quantity field' do 
      @product = @category.products.new({name: 'test product', price: 10, quantity: nil})     
      expect(@product).to_not be_valid
    end

    it 'should enforce a category field' do  
      @product = Product.new({name: 'test product', price: 10, quantity: 1})    
      expect(@product).to_not be_valid
    end
  end
end