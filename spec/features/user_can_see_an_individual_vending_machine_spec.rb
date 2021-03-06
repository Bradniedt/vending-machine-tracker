require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: 'twizzlers', price: 2, machines: [dons])
    snack_2 = Snack.create(name: 'poptarts', price: 3, machines: [dons])

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'should see all of the snacks for that machine and their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: 'twizzlers', price: 2, machines: [dons])
    snack_2 = Snack.create(name: 'poptarts', price: 3, machines: [dons])


    visit machine_path(dons)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)
  end

  it 'should see the average price for all snacks in this machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: 'twizzlers', price: 2, machines: [dons])
    snack_2 = Snack.create(name: 'poptarts', price: 3, machines: [dons])

    visit machine_path(dons)

    expect(page).to have_content(dons.avg_snack_price)
  end
end
