class Challenge < ActiveRecord::Base
    belongs_to :instance
    has_many :locations, through: :instance

    def recieve_spell(spell)
        
    end
end