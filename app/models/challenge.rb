class Challenge < ActiveRecord::Base
    belongs_to :encounter
    has_many :locations, through: :encounters

    def take_damage(damage)
        self.health -= damage - self.armor
    end

    def visible?
        !self.stealth
    end

    def engage_element(spell)
        if self.element == "fire"
            if spell.element == "fire"
                spell.damage = 0
            end
            if spell.element == "water"
                spell.damage *= 2
            end
        end
        if self.element == "water"
            if spell.element == "water"
                spell.damage = 0
            end
            if spell.element == "fire"
                spell.damage *= 2
            end
        end
    end

    def check_and_engage_element(element)
        if self.element 
            engage_element(element)
        end
    end

    def receive_spell(spell)
        if self.visibile?
            check_and_engage_element(spell)
            take_damage(spell.damage)
        else
            print "There is nothing to target!"
        end
        
    end
end