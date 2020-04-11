class Wizard < ApplicationRecord
    has_secure_password
    has_many :registrations
    has_many :courses, through: :registrations
    validates :email, uniqueness: true, presence: true
    validates :password, uniqueness: true, length: {in: 6..20}, presence: true
    # accepts_nested_attributes_for :courses
end
