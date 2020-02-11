require_relative '../config/environment'

game_startup
name = PROMPT.ask("What is your name?")
player = Spellbot.create(name: name, current_encounter: 1)
#game loop
#finish game


#spell_prompt



