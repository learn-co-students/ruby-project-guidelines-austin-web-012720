class Encounter < ActiveRecord::Base
    belongs_to :spellbot
    has_many :challenges


    def enter_location
        create_challenge_instance
        print "You have entered #{location.name}. #{location.description}"
        challenges.each do |challenge|
            if !challenge.stealth
                print "You see a #{challenge.name}. #{challenge.description}"
            end
        end
    end

    def create_challenge_instance
        encounter_spawn = Challenge.find(challenge_id == self.challenge_id)
    end

    def destroy_challenge_instance
        encounter_spawn = nil
    end

    def successfully_complete_challenge
        PROMPT.say("You did it! You have successfully defeated #{challenge.name}.", color: :green)
        destroy_challenge_instance
    end



end