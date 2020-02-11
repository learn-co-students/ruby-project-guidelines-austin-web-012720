def game_startup
    PROMPT.yes?('Is this your first time playing?', help_color: :red, active_color: :green)
    puts "Who cares! We don't have enough content for that to matter right now!".colorize(:red)
end