class AddParticipantsToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :current_participants, :integer
  end
end
