require 'rails_helper'

RSpec.describe Order, :type => :model do
  context 'valid data' do
    it do
      order = FactoryGirl.create :order
      assert order.valid?
    end
  end
  context 'invalid data' do
    it 'without name' do
      order = Order.create username: '', phone: '123'
      assert order.errors.any?
    end
    it 'without phone' do
      order = Order.create username: 'Sidorov Ivan', phone: ''
      assert order.errors.any?
    end

  end
end
