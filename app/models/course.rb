class Course < ApplicationRecord
    has_many :registrations
    has_many :wizards, through: :registrations
end
