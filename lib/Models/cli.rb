
require_relative '../Models/user.rb'
class CommandLineInterface < User

    def greet
        puts FONT.write("STOCK PORTFOLIO")
        puts "Welcome to Your StockPorfolio, the best place to buy stocks!
        \n"
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
        puts "Let's create a new account!"
        name = PROMPT.ask("Enter your new username:\n")
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
                puts "\n" * 80
                puts "Welcome #{@user.name}!"
                choose_action
            else 
                puts "Wrong password, try again!"
                get_password
            end 
    end 

    def choose_action
        puts puts "\n" * 80
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
                response = @user.look_up(symbol.upcase)
               
                while response == nil do 
                    symbol = PROMPT.ask("Type in a stock symbol\n")
                    response = @user.look_up(symbol.upcase)
                end 
            when "2"
                symbol = PROMPT.ask("Type in a stock symbol\n")
                @user.buy_stock(symbol.upcase)
            when "3"
                @user.get_symbols_portfolio
            when "4"
                @user.most_bought_stock
            when "5"
                symbol = PROMPT.ask("Type in a stock symbol\n")
                @user.sell_stock(symbol.upcase)
            when "6"
                @user = nil
                puts "\n" * 80
                puts "YOU HAVE BEEN LOGGED OUT!"
                puts "\n" * 5
                greet
                puts "\n" * 5
                account?
            else 
                
                choose_action
                puts "Not a valid number, try again."
        end 
        back_to_menu
    end 

    def back_to_menu
        response = PROMPT.ask("
        Press M for Main Menu\n
        Press Q to log out.\n")
        if response.upcase == "M" 
            choose_action
        elsif response.upcase == "Q"
            @user = nil
            puts "Goodbye"
            greet
            account?
        else 
            puts "Wrong command"
            back_to_menu
        end 
    end 
        
    
end 