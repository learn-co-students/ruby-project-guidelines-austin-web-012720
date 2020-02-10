class Spellbot < ActiveRecord::Base
    has_many :spells
    has_many :challenges, through: :instances
    has_many :locations, through: :instances
end