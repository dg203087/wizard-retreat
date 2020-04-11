class AddParticipantsToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :current_participants, :integer
  end
end
