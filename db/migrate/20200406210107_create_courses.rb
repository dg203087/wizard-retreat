class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :maximum_participants

      t.timestamps
    end
  end
end
