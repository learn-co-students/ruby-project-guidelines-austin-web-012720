require 'ruby2d'


class Jeopardy
    
    def intro
        @think_song = Music.new('Jeopardy-theme-song.mp3')
        @think_song.play
        Views.banner_jeopardy
        yes_or_no = PROMPT.yes?("Welcome to Jeopardy! Are you a new user?")
            if yes_or_no
                User.create_user
            else
                User.find_user
            end
    end
end