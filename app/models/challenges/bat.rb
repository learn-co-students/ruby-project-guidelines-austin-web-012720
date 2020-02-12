class Bat < Challenge
    # after_initialize is run whenever an instance of this class is created such as create and new
    after_initialize :init

    def init
        # The ||= is there for if we want to set other values when we're creating them
        self.name ||= "b-ATTR-ACCESSOR"
        self.description ||= "Hidden in the darkness you see it: due to the turbulent mana emanating deep within the mountain these bats have become influenced by the attr_accessor...they can give just as well as they can take, be careful!"
        self.element ||= nil
        self.health ||= 5
        self.armor ||= 0
        self.strength ||= 1
        self.stealth ||= true
    end
end