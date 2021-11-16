require 'rails_helper'

RSpec.describe Product, type: :model do
  
  let(:category) {Category.new(:name => 'Utensils')}
  subject {described_class.new(:name => 'Frozen spoon', :price => 100, :quantity => 10, :category => category)}  
  
  describe 'Validations' do

    it 'saves when all four fields are set' do
      subject.valid?
      expect(subject.errors).to be_empty
    end
  
    
    it 'fails to save when name is empty' do
      subject.name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end
    
    it 'fails to save when price is empty' do
      subject.price_cents = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when quantity is empty' do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when category is empty' do
      subject.category = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end


  end
end
