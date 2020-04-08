class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.string :wizard_id
      t.string :course_id
      t.string :time_slot

      t.timestamps
    end
  end
end
