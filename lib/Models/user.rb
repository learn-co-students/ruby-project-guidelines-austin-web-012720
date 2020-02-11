class User < ActiveRecord::Base 
    has_many :portfolios
    has_many :stocks, through: :portfolios

    def get_symbols_portfolio
        user_id = self.id 
        array = Portfolio.where(user_id: user_id)
        
        stock_ids = array.map do |relationship|
            relationship.stock_id
        end 
        output = stock_ids.map do |id|
            Stock.where("id = ?", id)
        end
        
        new_array = output.map do |x, y|
             x.symbol
        end 
        if new_array == []
            puts "Porfolio is empty."
        else 
            puts "Your porfolio has these stocks:"
            puts new_array
        end 
    end 

    def look_up(symbol)
        response = Unirest.get "https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/get-detail?region=US&lang=en&symbol=#{symbol}",
        headers:{
            "X-RapidAPI-Host" => "apidojo-yahoo-finance-v1.p.rapidapi.com",
            "X-RapidAPI-Key" => "dafb7f16bbmsh88ffcdd851dbd91p135ccbjsn8936bcff69ee"
        }
    
        if response.body != ""
            puts "\n" * 35
            puts "Name: #{response.body["quoteType"]["shortName"]}"
            puts "Symbol: #{response.body["quoteType"]["symbol"]}"
            puts "Last day's close: $#{response.body["price"]["regularMarketPreviousClose"]["raw"]}"
            puts "Percent Change: #{response.body["price"]["regularMarketChange"]["raw"]}%"

            stock_hash = {
                symbol: response.body["quoteType"]["symbol"],
                price: response.body["price"]["regularMarketPreviousClose"]["raw"],
                percent_change: response.body["price"]["regularMarketChange"]["raw"]
            }
        else 
            puts "Invalid stock symbol"
            
        end 
    end 

    def look_up_earnings(symbol)
        response = Unirest.get "https://finnhub-realtime-stock-price.p.rapidapi.com/stock/earnings?symbol=#{symbol}",
        headers:{
            "X-RapidAPI-Host" => "finnhub-realtime-stock-price.p.rapidapi.com",
            "X-RapidAPI-Key" => "dafb7f16bbmsh88ffcdd851dbd91p135ccbjsn8936bcff69ee"
        }
    end 

   

    def buy_stock(symbol)
        hash = look_up(symbol)
        if hash != nil
            stock = Stock.find_or_create_by(symbol: hash[:symbol])
            stock.update(price: hash[:price])
            stock.update(percent_change: hash[:percent_change])
            Portfolio.create(user_id: self.id, stock_id: stock.id)
            puts "\n" * 35 
            puts FONT.write("#{symbol}") 
            puts "You bought #{symbol} stock."
        end
    end 

    def sell_stock(symbol)
        stock = Stock.find_by(symbol: symbol)
        id = stock.id
        puts self.stocks

        other = self.portfolios.find_by(stock_id: id)
        other.destroy
        puts "\n" * 35
        puts FONT.write("#{symbol}")  
        puts "You just sold #{symbol} stock."
    end 

    def most_bought_stock
        new_stock = Stock.all.max_by do |stock|
            stock.users.count
        end
        puts "This is the most bough stock:"
        puts new_stock.symbol
        puts new_stock.price
        puts new_stock.percent_change
    end 

    def highest_price_portfolio
        self.stocks.max_by do |stock|
            stock.price
        end 
    end 

end 