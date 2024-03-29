class Wizard < ApplicationRecord
    has_secure_password
    has_many :registrations
    has_many :courses, through: :registrations

    validates :email, uniqueness: true, presence: true, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates :password, length: {in: 5..20}, presence: true
    validates_presence_of :first_name, :last_name, format: { with: /\A[a-zA-Z]+\Z/ }
   
    def full_name
        full_name = [first_name, last_name].join(' ')
    end

    def self.griffindor
        where(wizards: {house: "Gryffindor"})
    end

    def self.slytherin
        where(wizards: {house: "Slytherin"})
    end

    def self.ravenclaw
        where(wizards: {house: "Ravenclaw"})
    end

    def self.hufflepuff
        where(wizards: {house: "hufflepuff"})
    end

end
