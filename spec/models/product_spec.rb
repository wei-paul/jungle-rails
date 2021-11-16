require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:each) do
    @new_category = Category.new(name: 'cars')
    @new_product = Product.new(name: 'FASTCARVROOM', price_cents: 50000, quantity: 500, category: @new_category)
  end
  
  describe 'Validations' do

    it 'saves when all four fields are set' do
      @new_product.valid?
      expect(@new_product.errors).to be_empty
    end
      
    it 'fails to save when name is empty' do
      @new_product.name = nil
      @new_product.valid?
      expect(@new_product.errors).not_to be_empty
    end
    
    it 'fails to save when price is empty' do
      @new_product.price_cents = nil
      @new_product.valid?
      expect(@new_product.errors).not_to be_empty
    end

    it 'fails to save when quantity is empty' do
      @new_product.quantity = nil
      @new_product.valid?
      expect(@new_product.errors).not_to be_empty
    end

    it 'fails to save when category is empty' do
      @new_product.category = nil
      @new_product.valid?
      expect(@new_product.errors).not_to be_empty
    end


  end
end
