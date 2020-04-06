class Wizard < ApplicationRecord
    has_secure_password
    has_many :registrations
    has_many :courses, through: :registrations
end
