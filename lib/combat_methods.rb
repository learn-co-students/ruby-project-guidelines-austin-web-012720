
def spell_prompt
    puts "\n" * 1
    PROMPT.say("xXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx", color: :red)
    PROMPT.say("     It's your turn now!", color: :green)
    PROMPT.say("xXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx", color: :red)
    puts "\n"
    spell = PROMPT.select("Pick which spell to cast", Spell.all.map{|spell| spell.name}, active_color: :bright_red, per_page: 6)
    
    spell
end

def cast_spell(player, spell, target)
    # will modify based on attributes later
    # boost spell damage based on player attributes, etc.
    puts "\n"
    PROMPT.say("You cast #{spell.name}!", color: :blue)
    if spell.name == "Tutorial"
        tutorial_box(player.current_encounter)
        player_turn(player, target) # so that the player doesn't lose thier turn for doing the tutorial
    elsif spell.name == "Inspect"
        puts "\n"
        PROMPT.say("A #{target.name} is revealed!", color: :blue)
        target.stealth = false
        puts "\n"
        PROMPT.say("Name=> ", color: :red)
        PROMPT.say("#{target.name}", color: :green)
        PROMPT.say("Description=> ", color: :red)
        PROMPT.say("#{target.description}", color: :green)
        PROMPT.say("Current Health=> ", color: :red)
        PROMPT.say("#{target.health}", color: :green)
        PROMPT.say("Armor=> ", color: :red)
        PROMPT.say("#{target.armor}", color: :green)
        PROMPT.say("Element=> ", color: :red)
        PROMPT.say("#{target.element}", color: :green)
        puts "\n"
        puts "\n"
        PROMPT.say("Look at all that information! See if your enemy has armor or an element, it could change your spell choice!", color: :bright_cyan)
        puts "\n"
        PROMPT.ask("(Take a moment to read and press enter to continue when ready...)")
    elsif spell.name == "Heal"
        player.heal(spell.damage)
        PROMPT.say("You feel slightly better. You now have #{player.health} hp.")
    else
        target.receive_spell(spell)
        if !target.stealth
            PROMPT.say("The #{target.name} has #{target.health} hp left!", color: :blue)
        else
            PROMPT.say("You can't see anything at all. I hope you aren't taking damage!", color: :blue)
        end
    end
end

def combat(player, challenge)
    # TODO: Singular challenge currently, will get multi-challenge support working later
    while(true)
        sleep 0.5
        if !challenge.stealth
            PROMPT.say("You have #{player.health} hp left, and #{challenge.name} has #{challenge.health} hp left.", color: :magenta)
        else
            PROMPT.say("You have #{player.health} hp left, and can't see anyone to attack. That can't be right...", color: :magenta)   
        end 
        player_turn(player, challenge)
    #   TODO: multi targets later 
    #   if not challenges.any?{ |challenge| challenge.health > 0}
        if challenge.health <= 0
            combat_victory(player)
            break;
        end

        challenge_turn(player, challenge)
        if player.health <= 0
            combat_failure(player)
            break;
        end
    end
end

def player_turn(player, target)
    spell_name = spell_prompt
    spell = Spell.find_by(name: spell_name)
    cast_spell(player, spell, target)
    player
    sleep 1.2
end

def challenge_turn(player, challenge)
    puts "\n"
    if !challenge.stealth
        PROMPT.say("xXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx", color: :green)
        PROMPT.say("     #{challenge.name} takes a turn!", color: :red)
        PROMPT.say("xXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx", color: :green)
    else
        PROMPT.say("xXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx", color: :green)
        PROMPT.say("The unknown enemy takes a turn!", color: :red)
        PROMPT.say("xXxXxXxXxXxXxXxXxXxXxXxXxXxXxXx", color: :green)
    end
    puts "\n"
    
    player.take_damage(challenge.strength)

    if challenge.stealth
        PROMPT.say("Something attacks you. You should figure out what is in here!", color: :blue)
    else
        PROMPT.say("#{challenge.name} attacks you.")
    end

    # PROMPT.say("#{attack[:description]}", color: :blue)
    PROMPT.say("You take #{challenge.strength} damage. You now have #{player.health} hp left.", color: :blue)
    puts "\n"
    player
    sleep(1)
end

def combat_victory(player)
    # TODO: Make this pretty
    system "clear"
    puts "\n"
    PROMPT.say("Your enemy lies broken and defeated before you. You walk gloatingly over it's ruined corpse, mocking it as you pass. What awaits you in your next challenge?", color: :bright_green)
    "VICTORY"
    puts "\n"
    sleep 0.5
end

def combat_failure(player)
    # TODO: Make this pretty
    system "clear"
    puts "\n"
    PROMPT.say("You lie broken and defeated. Your quest to become a mage is done.", color: :bright_magenta)
    "FAILED"
    puts "\n"
    sleep 0.5
end



def tutorial_box(encounter_id)
    current_tutorial = Tutorial.find_by(id: encounter_id)

    box = TTY::Box.frame(width: 110, height: 12, align: :center, padding: 1, title: {top_left: "SpellBot Tutorial", top_right: "Encounter number #{encounter_id}"}, 
        style: {
            fg: :bright_cyan,
            bg: :black,
            border: {
            fg: :bright_magenta,
            bg: :black
            }
        }) do
        "#{current_tutorial.content}"
    end

    print box

end