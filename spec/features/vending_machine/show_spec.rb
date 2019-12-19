

# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
require 'rails_helper'

RSpec.describe "As a visitor when I visit the vending machine show page" do
  xit "shows the name and price of all the snacks associated with that vending machine" do

    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing Basement")
    snack_1 = machine_1.snacks.create!(name: "twizzlers", price: "$1.50")
    snack_2 = machine_1.snacks.create!(name: "M&M's", price: "$1.00")

    visit "/machines/#{machine_1.id}"

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)
  end
end
