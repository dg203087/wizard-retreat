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

    def self.search(search_name)
        if search_name
            self.where(" name LIKE ?", "%#{search_name}%")
        else
            @courses = Course.all
        end 
    end
end
