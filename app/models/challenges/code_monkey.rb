class CodeMonkey < Challenge
    after_initialize :init
    def init
       self.name ||= "Code Monkey" 
       self.description ||= "Although they always seem to be busy, you can never find them when you need them for work. After being stuck debugging the same issue for the past 3 months you better be wary!"
       self.stealth ||= 1
       self.health ||= 15
       self.armor ||= 1
       self.strength ||= 1 # for now becuase otherwise the player will die
       self.element ||= "fire"
    end
end