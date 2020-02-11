def title_logo

    puts PASTEL.red(FONT.write("vvvvvvv", letter_spacing: 2))
    puts PASTEL.bright_red(FONT.write("|||>RUBY<||", letter_spacing: 2))
    puts PASTEL.bright_red(FONT.write("|>WIZARD<|", letter_spacing: 2))
    puts PASTEL.red(FONT.write("^^^^^^^^^^^^", letter_spacing: 2))
end

def game_startup
    title_logo
    #PROMPT.yes?('Is this your first time playing?', help_color: :bright_red, active_color: :bright_red)

    PROMPT.say("Who cares! We don't have enough content for that to matter right now!", color: :bright_red)
 
end

def spell_prompt
    spell = PROMPT.select("Pick which spell to cast", %w(ManaBolt Inspect FrostBolt), active_color: :bright_red, per_page: 6)
    PROMPT.say("You cast #{spell}!", color: :blue)
end