require 'rails_helper'

RSpec.describe "As a visitor when I visit the vending machine show page" do
  it "shows the name and price of all the snacks associated with that vending machine" do

    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing Basement")
    snack_1 = machine_1.snacks.create!(name: "twizzlers", price: "$1.50")
    snack_2 = machine_1.snacks.create!(name: "M&M's", price: "$1.00")
    snack_3 = machine_2.snacks.create!(name: "Donuts", price: "$1.50")
    snack_4 = machine_2.snacks.create!(name: "Poptarts", price: "$1.75")

    visit "/machines/#{machine_1.id}"

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)

    visit "/machines/#{machine_2.id}"

    expect(page).to have_content(snack_3.name)
    expect(page).to have_content(snack_3.price)
    expect(page).to have_content(snack_4.name)
    expect(page).to have_content(snack_4.price)
  end

  it "shows an average price for all snacks in that machine" do
    sam = Owner.create(name: "Sam's Snacks")
    machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine_2 = sam.machines.create(location: "Turing Basement")
    snack_1 = machine_1.snacks.create!(name: "twizzlers", price: "$1.50")
    snack_2 = machine_1.snacks.create!(name: "M&M's", price: "$1.00")
    snack_3 = machine_2.snacks.create!(name: "Donuts", price: "$1.50")
    snack_4 = machine_2.snacks.create!(name: "Poptarts", price: "$2.00")

    visit "/machines/#{machine_1.id}"
    expect(page).to have_content("$1.25")

    visit "/machines/#{machine_2.id}"
    expect(page).to have_content("$1.75")

  end
end
