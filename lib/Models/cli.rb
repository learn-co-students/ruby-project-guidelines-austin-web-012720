
require_relative '../Models/user.rb'
class CommandLineInterface < User

    def greet
        puts "Welcome to Your StockPorfolio, the best place to buy stocks!\n"
    end 

    def account?
        answer = PROMPT.ask("Do you have an account? type yes or no\n")
        
        if answer == "no"
            create_account
        else answer == "yes"
            log_in
        end 
    end 

    def create_account
        name = PROMPT.ask("Enter your name:\n")
        password = ask("Enter a new password:  \n") { |q| q.echo = "*" }

        User.find_or_create_by(name: name, password: password)
        log_in
    end 

    def log_in
        name = PROMPT.ask("Type in your username to log in\n")
        @user = User.find_by(name: name)

        if !@user
            puts "Wrong username, try again."
            log_in
        else 
            get_password
        end 
    end 

    def get_password
        input_password = ask("Type in your password:  \n") { |q| q.echo = "*" }
            if @user.password == input_password
                puts "Welcome #{@user.name}!"
                choose_action
            else 
                puts "Wrong password, try again!"
                get_password
            end 
    end 

    def choose_action
        puts "
        MAIN MENU:

            1) Look Up a Stock
            2) Buy Stock
            3) View your Porfolio
            4) View Most popular stock
            5) Sell a stock
            6) Log out\n"
            @input = PROMPT.ask("Please choose a number\n")
            perform_action
    end 
        
            
    def perform_action
        case @input
            when "1"
                symbol = PROMPT.ask("Type in a stock symbol\n")
                @user.look_up(symbol)
            when "2"
                symbol = PROMPT.ask("Type in a stock symbol\n")
                @user.buy_stock(symbol)
            when "3"
                @user.get_symbols_portfolio
            when "4"
                @user.most_bought_stock
            when "5"
                symbol = PROMPT.ask("Type in a stock symbol\n")
                @user.sell_stock(symbol)
            when "6"
                @user = nil
                puts "Goodbye"
                greet
                account?
            else 
                puts "Not a valid number, try again."
                choose_action
        end 
        choose_action
    end 

        
    
end 