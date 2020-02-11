require_relative '../config/environment'

User.destroy_all
Stock.destroy_all
# Portofolio.destroy_all

cli = CommandLineInterface.new
cli.greet
cli.account?







# cli.stock_lookup

binding.pry

puts "h"

# symbol = gets.chomp






