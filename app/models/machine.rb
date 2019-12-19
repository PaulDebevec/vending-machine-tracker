class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  # def average_price
  #   require "pry"; binding.pry
  #     snacks.each do |snack|
  #     puts price = snack.price.delete("$").to_f
  #     puts average(price)
  #   end
  # end
end
