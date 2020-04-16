class Registration < ApplicationRecord
    belongs_to :wizard
    belongs_to :course

    # def self.not_duplicate
    #     registration.time_slot.select { |slot| slot != slot.self }
    #     errors.add(:course, 'This time slot is already full.') 
    # end

    # def self.not_more_than_three
    #     all.limit(3)
    # end


end
