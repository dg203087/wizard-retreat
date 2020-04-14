class AddTimeToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :course_time, :string
  end
end
