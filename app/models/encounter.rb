class Encounter < ActiveRecord::Base
    belongs_to :spellbot
    has_many :challenges
    has_one :location

    def say_stuff
        location = Location.find_by(id: self.id)
        location.name
    end

    def enter_location
        #create_challenge_instance
        encounter_challenge = Challenge.find_by(id: self.id)
        location = Location.find_by(id: self.id)
        PROMPT.say("You have entered #{location.name}. #{location.description}", color: :bright_red)
        PROMPT.say("Checking to see if there are enemies nearby...", color: :green)
        #encounter_challenges.each do |challenge|
            if !encounter_challenge.stealth
                PROMPT.say("You spotted one!", color: :red)
                PROMPT.say("~~~~~~~~~~~~~~~~~", color: :red)
                PROMPT.say("~~~~~~~~~~~~~~~~~", color: :red)
                PROMPT.say("You see a #{encounter_challenge.name}. #{encounter_challenge.description}", color: :bright_red)
            end
        #end
    end


    def successfully_complete_challenge
        PROMPT.say("You did it! You have successfully defeated #{challenge.name}.", color: :green)
    end



end