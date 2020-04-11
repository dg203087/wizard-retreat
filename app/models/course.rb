class Course < ApplicationRecord
    has_many :registrations
    has_many :wizards, through: :registrations
    validates :name, presence: true, length: {in: 3...75}, uniqueness: true
    validates :location, presence: true
    validates :desciption, presence: true, length: {maximum: 250}
    validates :maximum_participants, presence: true
end
