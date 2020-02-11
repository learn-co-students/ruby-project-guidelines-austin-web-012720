class CommandLineInterface

def greet
    puts "Welcome to Your StockPorfolio, the best place to buy stocks!"
end 

def account?
    puts "Do you have an account? yes or no"
    answer = gets.chomp

    if answer == "no"
        create_account
    end 
end 

def create_account
    puts "Enter your name:"
    name = gets.chomp
    puts "Enter a password:"
    password = gets.chomp

    User.find_or_create_by(name: name, password: password)
end 

def log_in
    puts "Please log in"
end 

def stock_lookup
    puts "Enter a symbol:"
end 

end 