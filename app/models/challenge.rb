class Challenge < ActiveRecord::Base
    belongs_to :instance
    has_many :locations, through: :instance
end