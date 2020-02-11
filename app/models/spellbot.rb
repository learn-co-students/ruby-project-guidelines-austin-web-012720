class Spellbot < ActiveRecord::Base
    has_many :spells
    has_many :encounters
    has_many :challenges, through: :encounters
    has_many :locations, through: :encounters


    def cast_spell(spell_name)
        spell = Spells.find_by(name: spell_name)
        target = Challenges.find_by(id: encounter.id)
        # will modify based on attributes later
        target.recieve_spell(spell)

    end

    def spell_prompt
        spell = PROMPT.select("Pick which spell to cast", %w(Manabolt Inspect Frostbolt), active_color: :bright_red, per_page: 6)
        PROMPT.say("You cast #{spell}!", color: :blue)
        cast_spell(spell)
    end
end