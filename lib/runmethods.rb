def title_logo

    puts PASTEL.red(FONT.write("vvvvvvv", letter_spacing: 2))
    puts PASTEL.bright_red(FONT.write("|||>RUBY<||", letter_spacing: 2))
    puts PASTEL.bright_red(FONT.write("|>WIZARD<|", letter_spacing: 2))
    puts PASTEL.red(FONT.write("^^^^^^^^^^^^", letter_spacing: 2))
end

def game_intro
    PROMPT.say("Welcome to ", color: :green) 
    PROMPT.say("RUBY WIZARD ", color: :bright_red)
    PROMPT.say("!", color: :green) 
    PROMPT.yes?('Is this your first time playing?', help_color: :green, active_color: :green)
    PROMPT.say("Who cares! We don't have enough content for that to matter right now!", color: :green)
    puts " "
    puts " "
    PROMPT.say("Ruby wizard will be an educational text-based game focused on Ruby as a programming language", color: :bright_red)
    PROMPT.say("Please enjoy what will hopefully be a pleasant experience, and apologies if you break the code...", color: :bright_red)
    puts ""
    PROMPT.say(". . . . . . . . . .", color: :red)
    PROMPT.say(". . . . . . . . . .", color: :red)
    puts ""
    PROMPT.say(". . . . . . . . . .", color: :red)
    puts ""
    PROMPT.say(". . . . . . . . . .", color: :red)
    PROMPT.say(". . . . . . . . . .", color: :red)
    puts ""
    PROMPT.say("...but you probably deserve it.", color: :bright_red)
    puts ""
    puts ""
    PROMPT.yes?('Are you ready to start?', help_color: :green, active_color: :green)
    puts ""
    puts ""
    PROMPT.say("Doesn't matter, let's go!", color: :bright_red)
    puts ""
    puts ""
    puts ""

end

def end_screen
    PROMPT.say("As you stumble through the clearing ahead, you notice...nothing. Absolutely nothing for you to fight or do.", color: :bright_red)
    PROMPT.ask("Did...did you win?")
    PROMPT.say("You did!!", color: :bright_red)
    PROMPT.ask("Press enter to win!")
    puts PASTEL.red(FONT.write(". . . . . . . . . . .", letter_spacing: 3))
    puts PASTEL.bright_red(FONT.write(" YOU   HAVE", letter_spacing: 2))
    puts PASTEL.bright_red(FONT.write("CONQUERED", letter_spacing: 2))
    puts PASTEL.bright_red(FONT.write("THIS ALPHA", letter_spacing: 2))
    puts PASTEL.red(FONT.write("^^^^^^^^^^^^^^", letter_spacing: 2))
end

def reset_database
    rake db:reset
end

def game_startup
    title_logo
    game_intro
    end_screen
end