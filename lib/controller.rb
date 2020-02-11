class Jeopardy
    
    def intro
        Views.banner_jeopardy
        yes_or_no = PROMPT.yes?("Welcome to Jeopardy! Are you a new user?")
            if yes_or_no
                User.create_user
            else
                User.find_user
            end
    end


end