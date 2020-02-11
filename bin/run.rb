require_relative '../config/environment'

game_startup
name = PROMPT.ask("What is your name?")
player = Spellbot.create(name: name, current_level: 1)
#game loop
#finish game
game_finish

#spell_prompt



