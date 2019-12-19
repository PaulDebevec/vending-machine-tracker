# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


sam = Owner.create(name: "Sam's Snacks")
machine_1 = sam.machines.create(location: "Don's Mixed Drinks")
machine_2 = sam.machines.create(location: "Turing Basement")
snack_1 = machine_1.snacks.create!(name: "twizzlers", price: "$1.50")
snack_2 = machine_1.snacks.create!(name: "M&M's", price: "$1.00")
snack_3 = machine_2.snacks.create!(name: "Donuts", price: "$1.50")
snack_4 = machine_2.snacks.create!(name: "Poptarts", price: "$1.75")
