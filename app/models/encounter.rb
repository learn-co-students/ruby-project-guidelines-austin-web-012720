class Encounter < ActiveRecord::Base
    belongs_to :spellbot
    has_many :challenges


    def enter_location
        print "You have entered #{location.name}. #{location.description}"
        challenges.each do |challenge|
            if !challenge.stealth
                print "You see a #{challenge.name}. #{challenge.description}"
            end
        end
    end

    def create_challenge_instance
        encounter_spawn = challenge
    end

    def destroy_challenge_instance
        encounter_spawn = nil
    end

    def successfully_complete_challenge
        destroy_challenge_instance
        print "You did it!"
    end



end