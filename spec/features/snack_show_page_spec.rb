require 'rails_helper'

describe 'as a user' do
  describe 'when I visit the snack show page' do
    it 'should see the snack name and price,
    machine locations with that snack,
    the average snack price for each machine,
    and the count of snacks for that machine' do
    owner1 = Owner.create(name: "Pam's Snacks")
    owner2 = Owner.create(name: "Sam's Snacks")
    vons  = owner2.machines.create(location: "Von's Mixed Drinks")
    dons  = owner1.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: 'twizzlers', price: 2, machines: [dons, vons])
    snack_2 = Snack.create(name: 'poptarts', price: 3, machines: [dons, vons])

    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_1.machine_locations)
    expect(page).to have_content(dons.snack_count)
    expect(page).to have_content(dons.avg_snack_price)
    expect(page).to have_content(vons.snack_count)
    expect(page).to have_content(vons.avg_snack_price)

    end
  end
end
