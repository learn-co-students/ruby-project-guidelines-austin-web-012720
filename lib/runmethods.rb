game_status = "RUNNING"
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


def spell_prompt
    puts "\n" * 3
    PROMPT.say("choose your spell wisely", color: :green)
    spell = PROMPT.select("Pick which spell to cast", %w(Manabolt Inspect Frostbolt), active_color: :bright_red, per_page: 6)
    
    spell
end

def target_prompt(targets)
    puts "\n" * 3
    PROMPT.say("choose your spell wisely", color: :green)
    spell = PROMPT.select("Pick which spell to cast", %w(Manabolt Inspect Frostbolt), active_color: :bright_red, per_page: 6)
    spell
end

def cast_spell(player, spell, target)
    # will modify based on attributes later
    # boost spell damage based on player attributes, etc.
    PROMPT.say("You cast #{spell.name}!", color: :blue)
    if spell.name == "Inspect"
        PROMPT.say("A #{target.name} is revealed!", color: :blue)
        target.stealth = false
    else
        target.receive_spell(spell)
        PROMPT.say("The #{target.name} has #{target.health} left!", color: :blue)
    end
end

def combat(player, challenge)
    # TODO: Singular challenge currently, will get multi-challenge support working later
    while(true)
        player_turn(player, challenge)
    #   TODO: multi targets later 
    #   if not challenges.any?{ |challenge| challenge.health > 0}
        if challenge.health < 0
            combat_victory(player)
            break;
        end

        challenge_turn(player, challenge)
        if player.health <= 0
            combat_failure(player)
            break;
        end

    #   challenges.each do |challenge|
    #       challenge_turn(player, challenge)
    #       if player.health <= 0
    #           combat_failure(player)
    #           break;
    #       end
    #    end
    end
end

def player_turn(player, target)
    spell_name = spell_prompt
    spell = Spell.find_by(name: spell_name)
    cast_spell(player, spell, target)
    player
end

def challenge_turn(player, challenge)
    PROMPT.say("The #{challenge.name} attacks you. You take #{challenge.strength} damage. You now have #{player.health} left.", color: :bright_green) 
    player.take_damage(challenge.strength)
    player
end

def combat_victory(player)
    # TODO: Make this pretty
    PROMPT.say("Your enemies lie broken and defeated before you. What awaits you in your next challenge?", color: :bright_green)
    "VICTORY"
end

def combat_failure(player)
    # TODO: Make this pretty
    puts "You lie broken and defeated. Your quest to become a mage is done."
    game_status = "FAILED"
end

def enter_location(player)
    encounter_challenge = Challenge.find_by(id: player.current_encounter)
    location = Location.find_by(id: player.current_encounter)
    PROMPT.say("You have entered #{location.name}. #{location.description}", color: :bright_red)
    PROMPT.say("Checking to see if there are enemies nearby...", color: :green)
    #encounter_challenges.each do |challenge|
        if !encounter_challenge.stealth
            PROMPT.say("You spotted one!", color: :red)
            PROMPT.say("~~~~~~~~~~~~~~~~~", color: :green)
            PROMPT.say("~~~~~~~~~~~~~~~~~", color: :green)
            PROMPT.say("You see a #{encounter_challenge.name}. #{encounter_challenge.description}", color: :bright_red)
        end
    #end
end

def reset_database
    Challenge.delete_all
    Encounter.delete_all
    Location.delete_all
    Spell.delete_all
    Spellbot.delete_all
end

def game_startup
    title_logo
    game_intro
    # reset_database
    name = PROMPT.ask("What is your name?")
    player = Spellbot.new(name: name, current_encounter: 1)
    # TODO: change the number of challenges
    while not Encounter.last.complete
        enter_location(player)
        encounter = Encounter.find_by(id: player.current_encounter)
        challenge = Challenge.find_by(id: player.current_encounter)
        # TODO: Will make multiple enemies available later. One enemy per challenge currently
        # challenges = Challenge.all.collect{ |challenge| Challenge.new(challenge) }
        combat(player, challenge)
        encounter.complete = true
        encounter.save # TODO: may need to move this
        player.current_encounter += 1
    end
    end_screen
end

