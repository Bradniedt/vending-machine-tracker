require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    it '.avg_snack_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = Snack.create(name: 'twizzlers', price: 2, machines: [dons])
      snack_2 = Snack.create(name: 'poptarts', price: 3, machines: [dons])

      expect(dons.avg_snack_price).to eq(2.5)
    end
  end
end
