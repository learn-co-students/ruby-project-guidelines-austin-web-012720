class Werewolf < Challenge
    # after_initialize is run whenever an instance of this class is created such as create and new
    after_initialize :init

    def init
        # The ||= is there for if we want to set other values when we're creating them
        self.name ||= "w-ERROR-wolf"
        self.description ||= "After being bitten by a broken but enchanted line of code, these wolves are driven to growl loudly at every full moon. If you could speak wolf you’d know they said ErrorMethod: Undefined method ‘howl_at_moon’."
        self.element ||= "fire"
        self.health ||= 10
        self.armor ||= 0
        self.strength ||= 0
        self.stealth ||= true
    end
end