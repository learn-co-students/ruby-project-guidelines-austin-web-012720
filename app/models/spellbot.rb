class Spellbot < ActiveRecord::Base
    has_many :spells
    has_many :instances
    has_many :challenges, through: :instances
    has_many :locations, through: :instances

    def cast_spell(spell_name, target_name)
        spell = spells.find_by_name(spell_name)
        target = challenges.find_by_name(target_name)
        # will modify based on attributes later
        target.recieve_spell(spell)

    end
end