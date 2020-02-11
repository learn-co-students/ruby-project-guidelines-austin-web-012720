require_relative '../Models/user.rb'
class CommandLineInterface < User

    def greet
        puts "Welcome to Your StockPorfolio, the best place to buy stocks!"
    end 

    def account?
        answer = PROMPT.ask("Do you have an account? type yes or no")
        
        if answer == "no"
            create_account
        else answer == "yes"
            log_in
        end 
    end 

    def create_account
        name = PROMPT.ask("Enter your name:")
        password = PROMPT.ask("Enter a password:")

        User.find_or_create_by(name: name, password: password)
        log_in
    end 

    def log_in
        name = PROMPT.ask("Type in your username to log in")
        
        @user = User.find_by(name: name)
        if !@user
            puts "Wrong username, try again."
            log_in
        else 
            choose_action
        end
    end 

    def choose_action
        puts "
            1) Look Up a Stock
            2) Buy Stock
            3) View your Porfolio
            4) View Most popular stock
            5) Sell a stock
            6) Log out"
            @input = PROMPT.ask("Please choose a number")
            perform_action
    end 
        
            
    def perform_action
        case @input
            when "1"
                symbol = PROMPT.ask("Type in a stock symbol")
                @user.look_up(symbol)
            when "2"
                symbol = PROMPT.ask("Type in a stock symbol")
                @user.buy_stock(symbol)
            when "3"
                @user.get_symbols_portfolio
            when "4"
                @user.most_bought_stock
            when "5"
                symbol = PROMPT.ask("Type in a stock symbol")
                @user.sell_stock(symbol)
            when "6"
                @user = nil
                greet
            else 
                puts "Not a valid number, try again."
                choose_action
        end 
        choose_action
    end 

        
    
end 