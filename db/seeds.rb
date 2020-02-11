require 'pry'
User.destroy_all
Stock.destroy_all
Portfolio.destroy_all

mike = User.find_or_create_by(:name => 'Mike', :password => 'hello')
carlos = User.find_or_create_by(name: "Carlos", password: "bye")

mike.buy_stock("AAPL")
carlos.buy_stock("AAPL")


msft = Stock.create(symbol: "MSFT", price: 100, percent_change: 0.10)


mike_msft = Portfolio.create(user_id: mike.id, stock_id: msft.id)



binding.pry

puts "hello"

