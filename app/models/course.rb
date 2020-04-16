class Course < ApplicationRecord
    has_many :registrations
    has_many :wizards, through: :registrations
    accepts_nested_attributes_for :registrations
    
    validates :name, presence: true, length: {in: 3...75}, uniqueness: true
    validates :location, presence: true
    validates :description, presence: true, length: {maximum: 250}
    validates :maximum_participants, presence: true
    

    def currently_enrolled
        @course = self.wizards.size
    end

    # def self.alphabetize 
    #     order(:name)
    # end

    # def self.space?
    #     currently_enrolled + 1 <= maximum_participants
    # end

end
